FactoryGirl.define do
  factory :programming_language do
    sequence(:id) { |i| i }
    sequence(:name) { |i| "Programming Language #{i}" }
    created_at Time.now
    updated_at Time.now
  end

  factory :article do
    title "Article has been titled"
    body "Article has a body of content to further amplify the title"
    created_at Time.now
    updated_at Time.now
    programming_language
  end

  factory :user do
    sequence(:id) { |i| i }
    username "user"
    email "user@wiki.com"
    password "testing"
    created_at Time.now
    updated_at Time.now
  end
end
