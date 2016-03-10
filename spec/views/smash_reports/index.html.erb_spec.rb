require 'rails_helper'

RSpec.describe "smash_reports/index", type: :view do
  before(:each) do
    assign(:smash_reports, [
      SmashReport.create!(
        :submitted_by => "Submitted By",
        :approved => false,
        :smash_setting_id => 1,
        :game => "Game",
        :filename => "Filename",
        :hash => "Hash",
        :record_count => 2,
        :smash_version => "Smash Version",
        :notes => "Notes"
      ),
      SmashReport.create!(
        :submitted_by => "Submitted By",
        :approved => false,
        :smash_setting_id => 1,
        :game => "Game",
        :filename => "Filename",
        :hash => "Hash",
        :record_count => 2,
        :smash_version => "Smash Version",
        :notes => "Notes"
      )
    ])
  end

  it "renders a list of smash_reports" do
    render
    assert_select "tr>td", :text => "Submitted By".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Game".to_s, :count => 2
    assert_select "tr>td", :text => "Filename".to_s, :count => 2
    assert_select "tr>td", :text => "Hash".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Smash Version".to_s, :count => 2
    assert_select "tr>td", :text => "Notes".to_s, :count => 2
  end
end
