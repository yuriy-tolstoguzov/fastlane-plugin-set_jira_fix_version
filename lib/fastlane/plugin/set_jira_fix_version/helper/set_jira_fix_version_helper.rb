module Fastlane
  module Helper
    class SetJiraFixVersionHelper
      # class methods that you define here become available in your action
      # as `Helper::SetJiraFixVersionHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the set_jira_fix_version plugin helper!")
      end
    end
  end
end
