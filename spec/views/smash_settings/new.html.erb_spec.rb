require 'rails_helper'

RSpec.describe "smash_settings/new", type: :view do
  before(:each) do
    assign(:smash_setting, SmashSetting.new(
      :submitted_by => "MyString",
      :game => "MyString",
      :name => "MyString",
      :hash => "MyString",
      :color => 1,
      :records => "MyString",
      :description => "MyString",
      :tree => "MyText"
    ))
  end

  it "renders new smash_setting form" do
    render

    assert_select "form[action=?][method=?]", smash_settings_path, "post" do

      assert_select "input#smash_setting_submitted_by[name=?]", "smash_setting[submitted_by]"

      assert_select "input#smash_setting_game[name=?]", "smash_setting[game]"

      assert_select "input#smash_setting_name[name=?]", "smash_setting[name]"

      assert_select "input#smash_setting_hash[name=?]", "smash_setting[hash]"

      assert_select "input#smash_setting_color[name=?]", "smash_setting[color]"

      assert_select "input#smash_setting_records[name=?]", "smash_setting[records]"

      assert_select "input#smash_setting_description[name=?]", "smash_setting[description]"

      assert_select "textarea#smash_setting_tree[name=?]", "smash_setting[tree]"
    end
  end
end
