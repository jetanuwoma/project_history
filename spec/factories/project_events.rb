FactoryBot.define do
  factory :project_event do
    project { nil }
    user { nil }
    eventable { nil }
    event_type { "MyString" }
    data { "" }
  end
end
