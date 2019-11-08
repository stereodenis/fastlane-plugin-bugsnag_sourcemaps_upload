require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class BugsnagSourcemapsUploadHelper
      # class methods that you define here become available in your action
      # as `Helper::BugsnagSourcemapsUploadHelper.your_method`
      #
      def self.create_bundle(os)
        UI.message("Creating React Native bundle")
        Action.sh("react-native bundle --platform #{os} --dev false --entry-file index.js --bundle-output /tmp/#{os}.bundle --sourcemap-output /tmp/#{os}.bundle.map")
      end

      def self.upload_bundle(api_key, os)
        UI.message("Uploading React Native bundle to Bugsnag")
        Action.sh("bugsnag-sourcemaps upload --api-key #{api_key} --source-map /tmp/#{os}.bundle.map --strip-project-root --minified-file /tmp/#{os}.bundle --minified-url index.#{os}.bundle --upload-sources --overwrite")
      end

      def self.show_message
        UI.message("Hello from the bugsnag_sourcemaps_upload plugin helper!")
      end
    end
  end
end
