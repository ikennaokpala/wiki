require "rails_helper"

RSpec.describe EmailJob, :type => :job do
  describe "#perform" do
    ActiveJob::Base.queue_adapter = :test

    it "sends an email" do
      expect {
        EmailJob.set.perform_later(create(:user))
      }.to have_enqueued_job
    end
  end
end
