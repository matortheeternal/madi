require 'rails_helper'

RSpec.describe "smash_reports/show", type: :view do
  before(:each) do
    @smash_report = assign(:smash_report, SmashReport.create!(
      :submitted_by => "Submitted By",
      :approved => false,
      :smash_setting_id => 1,
      :game => "Game",
      :filename => "Filename",
      :hash => "Hash",
      :record_count => 2,
      :smash_version => "Smash Version",
      :notes => "Notes"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Submitted By/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Game/)
    expect(rendered).to match(/Filename/)
    expect(rendered).to match(/Hash/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Smash Version/)
    expect(rendered).to match(/Notes/)
  end
end
