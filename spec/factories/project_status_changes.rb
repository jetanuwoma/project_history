FactoryBot.define do
  factory :project_status_change do
    project { nil }
    user { nil }
    status { "MyString" }
  end
end
