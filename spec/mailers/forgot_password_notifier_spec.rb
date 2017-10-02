require "rails_helper"

RSpec.describe ForgotPasswordNotifierMailer, type: :mailer do
  describe ".notify" do
   let(:user) { create(:user, username: "m_user", email: "m@m.c") }
   let(:mail) { described_class.notify(user) }

   it "renders the subject" do
     expect(mail.subject).to eq("Reset password notice")
   end

   it "renders the receiver's email" do
     expect(mail.to).to eq(["m@m.c"])
   end

   it "renders the sender's email" do
     expect(mail.from).to eq(["info@wiki.tt"])
   end

   it "assigns @user" do
     expect(mail.body.encoded).to match("Hello #{user.username}")
   end

   it "assigns @user" do
     expect(mail.body.encoded).to match("Hello #{user.username}")
   end
 end
end
