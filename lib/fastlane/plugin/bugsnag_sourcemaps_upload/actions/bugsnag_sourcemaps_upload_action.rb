require 'fastlane/action'
require_relative '../helper/bugsnag_sourcemaps_upload_helper'

module Fastlane
  module Actions
    class BugsnagSourcemapsUploadAction < Action
      def self.run(params)
        api_key = params[:api_key]
        app_version = params[:app_version]
        os = params[:os]
        path = params[:path]
        bundle_path = params[:bundle_path]
        minified_url = params[:minified_url]
        overwrite = params[:overwrite]
        strip = params[:strip]
        wildcard_prefix = params[:wildcard_prefix]
        generate_sourcemaps = params[:generate_sourcemaps]
        entry_file = params[:entry_file]

        if generate_sourcemaps
          Helper::BugsnagSourcemapsUploadHelper.create_bundle(os, entry_file, path, bundle_path)
        end
        Helper::BugsnagSourcemapsUploadHelper.upload_bundle(api_key, app_version, path, bundle_path, minified_url, strip, overwrite, wildcard_prefix)
      end

      def self.description
        "Upload sourcemaps to Bugsnag"
      end

      def self.authors
        ["Evgrafov Denis", "Ivan Sokolovskii"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Helps to generate and upload React-Native sourcemaps to Bugsnag"
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "BUGSNAG_SOURCEMAPS_UPLOAD_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
          FastlaneCore::ConfigItem.new(key: :api_key,
                                       env_name: "BUGSNAG_API_KEY",
                                       description: "Bugsnag API key",
                                       optional: false,
                                       type: String),
          FastlaneCore::ConfigItem.new(key: :app_version,
                                       env_name: "BUGSNAG_SOURCEMAPS_APP_VERSION",
                                       description: "Target app version",
                                       optional: true,
                                       type: String),
          FastlaneCore::ConfigItem.new(key: :os,
                                       env_name: "BUGSNAG_SOURCEMAPS_OS",
                                       description: "OS",
                                       optional: true,
                                       default_value: 'ios',
                                       type: String),
          FastlaneCore::ConfigItem.new(key: :path,
                                       env_name: "BUGSNAG_SOURCEMAPS_PATH",
                                       description: "Path to sourcemaps to upload",
                                       optional: true,
                                       default_value: "/tmp/ios.bundle.map",
                                       type: String),
          FastlaneCore::ConfigItem.new(key: :bundle_path,
                                       env_name: "BUGSNAG_SOURCEMAPS_BUNDLE_PATH",
                                       description: "Path to bundle  to upload",
                                       optional: true,
                                       default_value: "/tmp/ios.bundle",
                                       type: String),
          FastlaneCore::ConfigItem.new(key: :minified_url,
                                       env_name: "BUGSNAG_SOURCEMAPS_MINIFIED_URL",
                                       description: "Bugsnag mified url",
                                       optional: true,
                                       default_value: "index.ios.bundle",
                                       type: String),
          FastlaneCore::ConfigItem.new(key: :overwrite,
                                       env_name: "BUGSNAG_SOURCEMAPS_OVERWRITE",
                                       description: "Overwrite existing sourcemaps in Bugsnag",
                                       optional: true,
                                       default_value: true,
                                       type: Boolean),
          FastlaneCore::ConfigItem.new(key: :strip,
                                       env_name: "BUGSNAG_SOURCEMAPS_STRIP_PROJECT_ROOT",
                                       description: "Strip project root",
                                       optional: true,
                                       default_value: true,
                                       type: Boolean),
          FastlaneCore::ConfigItem.new(key: :wildcard_prefix,
                                       env_name: "BUGSNAG_SOURCEMAPS_WILDCARD_PREFIX",
                                       description: "Add wildcard prefix for Bugsnag",
                                       optional: true,
                                       default_value: false,
                                       type: Boolean),
          FastlaneCore::ConfigItem.new(key: :generate_sourcemaps,
                                       env_name: "BUGSNAG_SOURCEMAPS_GENERATE",
                                       description: "Generate React-Native sourcemaps",
                                       optional: true,
                                       default_value: true,
                                       type: Boolean),
          FastlaneCore::ConfigItem.new(key: :entry_file,
                                       env_name: "BUGSNAG_SOURCEMAPS_ENTRY_FILE",
                                       description: "React Native index file for soucemaps generation",
                                       optional: true,
                                       default_value: "index.js",
                                       type: String)
        ]
      end

      def self.is_supported?(platform)
        [:ios, :android].include?(platform)
        true
      end
    end
  end
end
