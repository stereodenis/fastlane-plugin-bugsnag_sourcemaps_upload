# bugsnag_sourcemaps_upload plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-bugsnag_sourcemaps_upload)
[![Gem Version](https://badge.fury.io/rb/fastlane-plugin-bugsnag_sourcemaps_upload.svg)](https://badge.fury.io/rb/fastlane-plugin-bugsnag_sourcemaps_upload)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-bugsnag_sourcemaps_upload`, add it to your project by running:

```bash
fastlane add_plugin bugsnag_sourcemaps_upload
```

## About bugsnag_sourcemaps_upload

Helps to generate and upload React Native sourcemaps to Bugsnag


### Example

```ruby
# Generate and upload soucemaps
bugsnag_sourcemaps_upload(
  api_key: 'YOUR_BUGSNAG_API_KEY',
  app_version: '1.0.0'
)

# Uploading Hermes generated soucemaps
bugsnag_sourcemaps_upload(
  api_key: 'YOUR_BUGSNAG_API_KEY',
  app_version: '1.0.0',
  generate_sourcemaps: false,
  platform: 'android',
  sourcemaps_dir: 'android/app/build/generated',
  sourcemap: 'sourcemaps/react/release/index.android.bundle.map',
  bundle: 'assets/react/release/index.android.bundle'
)
```

### Available options

| Option | Description | Environment variable | Default value |
| - | - | - | - |
| api_key* | API key | BUGSNAG_API_KEY |  |
| app_version* | Target app version | BUGSNAG_SOURCEMAPS_APP_VERSION |  |
| platform | Target platform | BUGSNAG_SOURCEMAPS_PLATFORM | ios |
| sourcemaps_dir | Sourcemaps directory | BUGSNAG_SOURCEMAPS_DIR | /tmp |
| sourcemap | Override path to sourcemaps(relative path to sourcemaps_dir) | BUGSNAG_SOURCEMAPS_NAME | *platform*.bundle.map  |
| bundle | Override path to minified file(relative path to sourcemaps_dir) | BUGSNAG_SOURCEMAPS_BUNDLE_NAME | *platform*.bundle |
| minified_url | Override minified url| BUGSNAG_SOURCEMAPS_MINIFIED_URL | index.*platform*.bundle  |
| overwrite | Overwrite sourcemaps in Bugsnag | BUGSNAG_SOURCEMAPS_OVERWRITE | true |
| strip | Strip root | BUGSNAG_SOURCEMAPS_STRIP_PROJECT_ROOT | true |
| wildcard_prefix | Add wildcard prefix | BUGSNAG_SOURCEMAPS_WILDCARD_PREFIX | false |
| generate_sourcemaps | Generate sourcemaps using react-native bundle | BUGSNAG_SOURCEMAPS_GENERATE | true |
| entry_file | React-native app index file path | BUGSNAG_SOURCEMAPS_ENTRY_FILE | index.js |

\* - required

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
