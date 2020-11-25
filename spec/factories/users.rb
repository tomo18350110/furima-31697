FactoryBot.define do
  factory :user do
    nickname              { 'ヤマダ' }
    email                 { 'takemi@takemi' }
    password              { 'a11111' }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '陸' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'リク' }
    birthday              { '1930-02-01' }
  end
end
