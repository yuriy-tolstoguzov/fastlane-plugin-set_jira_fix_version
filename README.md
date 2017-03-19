# set_jira_fix_version plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-set_jira_fix_version) [![Gem Version](https://badge.fury.io/rb/fastlane-plugin-set_jira_fix_version.svg)](https://badge.fury.io/rb/fastlane-plugin-set_jira_fix_version)

## Getting Started

This project is a [fastlane](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-set_jira_fix_version`, add it to your project by running:

```bash
fastlane add_plugin set_jira_fix_version
```

## About set_jira_fix_version

This plugin allow you to easily add fix version to specified JIRA issues. It contains two actions:

* `jira_issue_keys_from_changelog` gathers your issue keys that you left in commit names and supply them to `set_jira_fix_version`.
* `set_jira_fix_version` create version if needed and updates specified JIRA issues with this version. It supports basic and cookie authorization. If JIRA account password won't be specified in parameters (recommended) it will ask it at first launch and save in a macOS keychain. If JIRA version with specified name is not created, this action will create it. The action can take issue IDs from lane context (`FL_JIRA_ISSUE_IDS`) and many other JIRA related parameters from environment variables.

## [WIP]: Example

Check out the [example `Fastfile`](fastlane/Fastfile) to see how to use this plugin. Try it by cloning the repo, running `fastlane install_plugins` and `bundle exec fastlane test`.

**Note to author:** Please set up a sample project to make it easy for users to explore what your plugin does. Provide everything that is necessary to try out the plugin in this project (including a sample Xcode/Android project if necessary)

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

## Using `fastlane` Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About `fastlane`

`fastlane` is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
