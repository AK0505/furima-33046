FactoryBot.define do
  factory :item do
    name                 {"テスト"}
    ptice                {500}
    text                 {"テスト"}
    judgement_id         {1}
    category_id          {1}
    prefecture_id        {2}
    day_id               {1}
    user_id              {1}
  end
end
