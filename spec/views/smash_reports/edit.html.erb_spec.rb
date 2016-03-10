require 'rails_helper'

RSpec.describe "smash_reports/edit", type: :view do
  before(:each) do
    @smash_report = assign(:smash_report, SmashReport.create!(
      :submitted_by => "MyString",
      :approved => false,
      :smash_setting_id => 1,
      :game => "MyString",
      :filename => "MyString",
      :hash => "MyString",
      :record_count => 1,
      :smash_version => "MyString",
      :notes => "MyString"
    ))
  end

  it "renders the edit smash_report form" do
    render

    assert_select "form[action=?][method=?]", smash_report_path(@smash_report), "post" do

      assert_select "input#smash_report_submitted_by[name=?]", "smash_report[submitted_by]"

      assert_select "input#smash_report_approved[name=?]", "smash_report[approved]"

      assert_select "input#smash_report_smash_setting_id[name=?]", "smash_report[smash_setting_id]"

      assert_select "input#smash_report_game[name=?]", "smash_report[game]"

      assert_select "input#smash_report_filename[name=?]", "smash_report[filename]"

      assert_select "input#smash_report_hash[name=?]", "smash_report[hash]"

      assert_select "input#smash_report_record_count[name=?]", "smash_report[record_count]"

      assert_select "input#smash_report_smash_version[name=?]", "smash_report[smash_version]"

      assert_select "input#smash_report_notes[name=?]", "smash_report[notes]"
    end
  end
end
