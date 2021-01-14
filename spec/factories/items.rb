FactoryBot.define do
  factory :item do
    name                 {"テスト"}
    price                {500}
    text                 {"テスト"}
    judgement_id         {1}
    category_id          {1}
    prefecture_id        {2}
    day_id               {1}
    status_id            {1}
    


    user
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/a.png'), filename: 'a.png')
    end
  end
end
