FactoryGirl.define do
  factory :user do
    sequence(:id) { |i| i }
    username "user"
    email "user@wiki.com"
    password "testing"
    created_at Time.now
    updated_at Time.now
  end
end
