require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class BugsnagSourcemapsUploadHelper
      # class methods that you define here become available in your action
      # as `Helper::BugsnagSourcemapsUploadHelper.your_method`
      #
      def self.create_bundle(platform, entry_file, path, bundle_path)
        UI.message("Creating React Native bundle")
        Action.sh("react-native bundle \
          --dev false \
          --platform #{platform} \
          --bundle-output #{bundle_path} \
          --sourcemap-output #{path} \
          --entry-file #{entry_file}")
      end

      def self.upload_bundle(api_key, platform, app_version, path, bundle_path, minified_url, strip, overwrite, wildcard_prefix)
        command = "bugsnag-sourcemaps upload --api-key #{api_key} --source-map #{path} --minified-file #{bundle_path} --upload-sources "
        if minified_url
          command += "--minified-url #{minified_url} "
        else
          command += "--minified-url index.#{platform}.bundle "
        end
        if app_version
          command += "--app-version=#{app_version} "
        end
        if strip
          command += "--strip-project-root "
        end
        if overwrite
          command += "--overwrite "
        end
        if wildcard_prefix
          command += "--add-wildcard-prefix "
        end
        UI.message("Uploading React Native bundle to Bugsnag")
        Action.sh(command.to_s)
      end

      def self.show_message
        UI.message("Hello from the bugsnag_sourcemaps_upload plugin helper!")
      end
    end
  end
end
