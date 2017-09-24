require "rails_helper"

RSpec.describe ProgrammingLanguage, type: :model do
  subject { build(:programming_language) }

  it { is_expected.to have_attributes(name: be_an_instance_of(String)) }
end
