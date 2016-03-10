FactoryGirl.define do
  factory :user do
    username "MyString"
    role "MyString"
    first_seen "2016-03-10 11:08:20"
    last_seen "2016-03-10 11:08:20"
    times_seen 1
    download 1
    upload 1
  end
end
