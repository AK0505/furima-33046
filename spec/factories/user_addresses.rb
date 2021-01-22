FactoryBot.define do
  factory :user_address do
    token                {"tok_abcdefghijk00000000000000000"}
    postal_code          {"222-2222"}
    prefecture_id        {1}
    municipality         {"札幌市"}
    address              {"2-2-2"}
    building_name        {"テスト"}
    phone_number         {"12345678910"}
  end
end

