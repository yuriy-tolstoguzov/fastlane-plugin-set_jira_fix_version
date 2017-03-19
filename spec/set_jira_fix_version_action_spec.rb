describe Fastlane::Actions::SetJiraFixVersionAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The set_jira_fix_version plugin is working!")

      Fastlane::Actions::SetJiraFixVersionAction.run(nil)
    end
  end
end
