require "rails_helper"

RSpec.describe User, type: :model do
  subject { build(:user) }

  it do
    is_expected.to have_attributes(
      username: be_an_instance_of(String),
      email: be_an_instance_of(String),
      password: be_an_instance_of(String)
    )
  end
end
