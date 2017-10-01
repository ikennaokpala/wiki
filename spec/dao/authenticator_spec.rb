require "rails_helper"

RSpec.describe Authenticator do
  let(:user) { create(:user, { username: "a_user", password: "a_pass"} ) }
  let(:params) { { username: user.username, password: user.password } }

  describe "#user" do
    context "when username and password are correct" do
      subject { Authenticator.new(params) }

      it "returns user record that was found" do
        expect(subject.user).to eq(user)
      end

      it "invokes query for user only once" do
        expect(User).to receive(:find_by)
          .with(params)
          .and_return(user)
          .once

        subject.user
        subject.user
      end
    end

    context "when username is wrong and password is correct" do
      subject { Authenticator.new({ username: "auser", password: params[:password] }) }

      it "returns a null user" do
        expect(subject.user).to be_instance_of(Authenticator::NullUser)
      end

      it "returns null user with nil id" do
        expect(subject.user.id).to be_nil
      end

      it "returns false when #present? is invoked" do
        expect(subject.user.present?).to be_falsey
      end

      it "invokes NullUser only once" do
        expect(Authenticator::NullUser).to receive(:new)
          .with(nil)
          .and_return(Authenticator::NullUser.new)
          .once

        subject.user
        subject.user
      end
    end

    context "when username is correct and password is wrong" do
      subject { Authenticator.new({ username: params[:username], password: "apass" }) }

      it "returns a null user" do
        expect(subject.user).to be_instance_of(Authenticator::NullUser)
      end

      it "returns null user with nil id" do
        expect(subject.user.id).to be_nil
      end

      it "returns false when #present? is invoked" do
        expect(subject.user.present?).to be_falsey
      end

      it "invokes NullUser only once" do
        expect(Authenticator::NullUser).to receive(:new)
          .with(nil)
          .and_return(Authenticator::NullUser.new)
          .once

        subject.user
        subject.user
      end
    end
  end

  describe "#valid?" do
    context "when username and password are correct" do
      subject { Authenticator.new(params) }

      it "returns true" do
        expect(subject.valid?).to be_truthy
      end
    end

    context "when username is wrong and password is correct" do
      subject { Authenticator.new({ username: "auser", password: params[:password] }) }

      it "returns false" do
        expect(subject.valid?).to be_falsey
      end
    end

    context "when username is correct and password is wrong" do
      subject { Authenticator.new({ username: params[:username], password: "apass" }) }

      it "returns false" do
        expect(subject.valid?).to be_falsey
      end
    end
  end
end
