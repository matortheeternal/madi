require 'rails_helper'

RSpec.describe "merge_reports/new", type: :view do
  before(:each) do
    assign(:merge_report, MergeReport.new(
      :submitted_by => "MyString",
      :approved => false,
      :game => "MyString",
      :filename => "MyString",
      :hash => "MyString",
      :record_count => 1,
      :rating => 1,
      :merge_version => "MyString",
      :notes => "MyString"
    ))
  end

  it "renders new merge_report form" do
    render

    assert_select "form[action=?][method=?]", merge_reports_path, "post" do

      assert_select "input#merge_report_submitted_by[name=?]", "merge_report[submitted_by]"

      assert_select "input#merge_report_approved[name=?]", "merge_report[approved]"

      assert_select "input#merge_report_game[name=?]", "merge_report[game]"

      assert_select "input#merge_report_filename[name=?]", "merge_report[filename]"

      assert_select "input#merge_report_hash[name=?]", "merge_report[hash]"

      assert_select "input#merge_report_record_count[name=?]", "merge_report[record_count]"

      assert_select "input#merge_report_rating[name=?]", "merge_report[rating]"

      assert_select "input#merge_report_merge_version[name=?]", "merge_report[merge_version]"

      assert_select "input#merge_report_notes[name=?]", "merge_report[notes]"
    end
  end
end
