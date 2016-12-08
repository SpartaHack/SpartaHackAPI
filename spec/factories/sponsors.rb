FactoryGirl.define do
  factory :sponsor do
    name      			               { FFaker::Company.name }
    url 					                 { FFaker::Internet.http_url }
    logo_svg_light 					       { FFaker::Avatar.image }
    logo_png_light 					       { FFaker::Avatar.image }
    logo_svg_dark 					       { FFaker::Avatar.image }
    logo_png_dark 					       { FFaker::Avatar.image }
    level                          "Trainee"

    factory :warrior do
      level                        "Warrior"
    end

    factory :commander do
      level                        "Commander"
    end
  end
end
