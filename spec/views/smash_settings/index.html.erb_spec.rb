require 'rails_helper'

RSpec.describe "smash_settings/index", type: :view do
  before(:each) do
    assign(:smash_settings, [
      SmashSetting.create!(
        :submitted_by => "Submitted By",
        :game => "Game",
        :name => "Name",
        :hash => "Hash",
        :color => 1,
        :records => "Records",
        :description => "Description",
        :tree => "MyText"
      ),
      SmashSetting.create!(
        :submitted_by => "Submitted By",
        :game => "Game",
        :name => "Name",
        :hash => "Hash",
        :color => 1,
        :records => "Records",
        :description => "Description",
        :tree => "MyText"
      )
    ])
  end

  it "renders a list of smash_settings" do
    render
    assert_select "tr>td", :text => "Submitted By".to_s, :count => 2
    assert_select "tr>td", :text => "Game".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Hash".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Records".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
