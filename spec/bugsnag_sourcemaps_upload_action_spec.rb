describe Fastlane::Actions::BugsnagSourcemapsUploadAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The bugsnag_sourcemaps_upload plugin is working!")

      Fastlane::Actions::BugsnagSourcemapsUploadAction.run(nil)
    end
  end
end
