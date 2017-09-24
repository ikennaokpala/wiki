require "rails_helper"

RSpec.describe Article, type: :model do
  subject { build(:article) }

  it do
    is_expected.to have_attributes(
      title: be_an_instance_of(String),
      body: be_an_instance_of(String)
    )
  end
end
