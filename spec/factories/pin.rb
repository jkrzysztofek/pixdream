FactoryBot.define do
  factory :pin do
    description 'Description'

    user

    after(:build) do |pin|
      pin.image.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'example.jpg')),
                        filename: 'example.jpg',
                        content_type: 'image/jpg')
    end
  end
end
