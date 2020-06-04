require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class BugsnagSourcemapsUploadHelper
      # class methods that you define here become available in your action
      # as `Helper::BugsnagSourcemapsUploadHelper.your_method`
      #
      def self.create_bundle(os, entry_file, path, bundle_path)
        UI.message("Creating React Native bundle")
        Action.sh("react-native bundle \
          --platform #{os} \
          --dev false \
          --entry-file #{entry_file} \
          --bundle-output #{bundle_path} \
          --sourcemap-output #{path}")
      end

      def self.upload_bundle(api_key, app_version, path, bundle_path, minified_url, strip, overwrite, wildcard_prefix)
        UI.message("Uploading React Native bundle to Bugsnag")
        Action.sh("bugsnag-sourcemaps upload \
          --api-key #{api_key} \
          #{app_version ? "--app-version=#{app_version} \\" : ""}
          --source-map #{path} \
          #{strip ? "--strip-project-root \\" : ""}
          --minified-file #{bundle_path} \
          --minified-url #{minified_url} \
          --upload-sources \
          #{overwrite ? "--overwrite \\" : ""}
          #{wildcard_prefix ? "add-wildcard-prefix" : ""}")
      end

      def self.show_message
        UI.message("Hello from the bugsnag_sourcemaps_upload plugin helper!")
      end
    end
  end
end
