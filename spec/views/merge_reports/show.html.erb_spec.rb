require 'rails_helper'

RSpec.describe "merge_reports/show", type: :view do
  before(:each) do
    @merge_report = assign(:merge_report, MergeReport.create!(
      :submitted_by => "Submitted By",
      :approved => false,
      :game => "Game",
      :filename => "Filename",
      :hash => "Hash",
      :record_count => 1,
      :rating => 2,
      :merge_version => "Merge Version",
      :notes => "Notes"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Submitted By/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Game/)
    expect(rendered).to match(/Filename/)
    expect(rendered).to match(/Hash/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Merge Version/)
    expect(rendered).to match(/Notes/)
  end
end
