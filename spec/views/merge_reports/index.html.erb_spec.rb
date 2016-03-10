require 'rails_helper'

RSpec.describe "merge_reports/index", type: :view do
  before(:each) do
    assign(:merge_reports, [
      MergeReport.create!(
        :submitted_by => "Submitted By",
        :approved => false,
        :game => "Game",
        :filename => "Filename",
        :hash => "Hash",
        :record_count => 1,
        :rating => 2,
        :merge_version => "Merge Version",
        :notes => "Notes"
      ),
      MergeReport.create!(
        :submitted_by => "Submitted By",
        :approved => false,
        :game => "Game",
        :filename => "Filename",
        :hash => "Hash",
        :record_count => 1,
        :rating => 2,
        :merge_version => "Merge Version",
        :notes => "Notes"
      )
    ])
  end

  it "renders a list of merge_reports" do
    render
    assert_select "tr>td", :text => "Submitted By".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Game".to_s, :count => 2
    assert_select "tr>td", :text => "Filename".to_s, :count => 2
    assert_select "tr>td", :text => "Hash".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Merge Version".to_s, :count => 2
    assert_select "tr>td", :text => "Notes".to_s, :count => 2
  end
end
