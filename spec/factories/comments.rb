FactoryGirl.define do
  factory :comment do
    user
    content "MyString"
    pin
  end
end
