module Fastlane
  module Actions
    module SharedValues
      FL_JIRA_ISSUE_IDS = :FL_JIRA_ISSUE_IDS
    end

    class JiraIssueKeysFromChangelogAction < Action
      def self.run(params)
        tag = params[:tag]
        project_key = params[:project_key]

        if tag.start_with?("`") && tag.end_with?("`")
          tag_command = tag.tr("`", "")
          tag = `#{tag_command}`
          tag.strip!
        end
        UI.message("Looking for issue keys starting from tag: #{tag}")

        git_log = `git log #{tag}..HEAD --format=%s`
        issue_key_regex = /#{project_key}-\d+(?!\!)/
        issue_keys = git_log.scan(issue_key_regex).uniq

        if issue_keys.nil? || issue_keys.empty?
          UI.error("No issue keys were found!")
        else
          UI.message("Issues found: #{issue_keys}")
        end
        Actions.lane_context[SharedValues::FL_JIRA_ISSUE_IDS] = issue_keys
        return issue_keys
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Gets list of JIRA issues kyes from git log starting from specified tag"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :tag,
                                       env_name: "FL_JIRA_ISSUE_KEYS_FROM_CHANGELOG_TAG_NAME",
                                       description: "Tag name of shell command in `` to that returns tag name",
                                       is_string: true,
                                       default_value: "`git describe --tags --abbrev=0`"),
          FastlaneCore::ConfigItem.new(key: :project_key,
                                       env_name: "FL_JIRA_PROJECT_ID",
                                       description: "Project key that corresponds to JIRA issue id prefixes",
                                       is_string: true)
        ]
      end

      def self.output
        [
          ['FL_JIRA_ISSUE_KEYS_FROM_CHANGELOG', 'JIRA issue keys collected from specified tag']
        ]
      end

      def self.return_value
        "Returns array of JIRA issue keys from git log starting from specified tag"
      end

      def self.authors
        ["yuriy-tolstoguzov"]
      end

      def self.is_supported?(platform)
        true
      end

      def self.example_code
        [
          'jira_issue_keys_from_changelog(
            project_key: "IOS",
            tag: "builds/latest-tag"
          )',
          'jira_issue_keys_from_changelog(
            project_key: "IOS"
          )'
        ]
      end

      def self.sample_return_value
        ["IOS-1000", "IOS-1001"]
      end

      def self.category
        :misc
      end
    end
  end
end
