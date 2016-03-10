require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :username => "MyString",
      :role => "MyString",
      :times_seen => 1,
      :download => 1,
      :upload => 1
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_username[name=?]", "user[username]"

      assert_select "input#user_role[name=?]", "user[role]"

      assert_select "input#user_times_seen[name=?]", "user[times_seen]"

      assert_select "input#user_download[name=?]", "user[download]"

      assert_select "input#user_upload[name=?]", "user[upload]"
    end
  end
end
