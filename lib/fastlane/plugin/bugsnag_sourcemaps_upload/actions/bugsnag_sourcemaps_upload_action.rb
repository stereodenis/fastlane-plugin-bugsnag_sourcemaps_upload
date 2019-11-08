require 'fastlane/action'
require_relative '../helper/bugsnag_sourcemaps_upload_helper'

module Fastlane
  module Actions
    class BugsnagSourcemapsUploadAction < Action
      def self.run(params)
        params[:os].each do |os|
          Helper::BugsnagSourcemapsUploadHelper.create_bundle(os)
          Helper::BugsnagSourcemapsUploadHelper.upload_bundle(params[:api_key], os)
        end
      end

      def self.description
        "Helps to upload sourcemaps to Bugsnag"
      end

      def self.authors
        ["Evgrafov Denis"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Helps to upload sourcemaps to Bugsnag"
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "BUGSNAG_SOURCEMAPS_UPLOAD_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
          FastlaneCore::ConfigItem.new(key: :api_key,
                                       description: "Bugsnag API key",
                                       optional: false,
                                       type: String),
          FastlaneCore::ConfigItem.new(key: :os,
                                       description: "OS list",
                                       optional: false,
                                       type: Array)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
