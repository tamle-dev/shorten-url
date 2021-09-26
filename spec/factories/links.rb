FactoryBot.define do
  factory :link do
    url { "MyText" }
    slug { "MyString" }
    clicked { 1 }
    user_id { 1 }
  end
end
