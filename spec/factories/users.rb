FactoryBot.define do
  factory :user do
    name { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { '1aA' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    birth_day { '1930-01-10' }
    gender { 'man' }
    hobby { 'ジョギング' }
    self_introduction { '初めてまして。私は' }
  end
end
