FactoryBot.define do
  factory :project_comment do
    project { nil }
    user { nil }
    content { "MyText" }
    parent_id { 1 }
  end
end
