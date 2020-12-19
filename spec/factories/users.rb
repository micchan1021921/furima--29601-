FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.email}
    password              { '1a' + Faker::Internet.password(min_length: 6, max_length: 20) }
    last_name             {"松本"}
    first_name            {"美月"}
    first_name_kana       {"ミヅキ"}
    last_name_kana        {"マツモト"}
    birth_date            {Faker::Date.in_date_period}

  end
end


#{ '1a' + Faker::Internet.password(min_length: 7, max_length: 20) }