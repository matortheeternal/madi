require 'rails_helper'

RSpec.describe "mator_smash_statistics/new", type: :view do
  before(:each) do
    assign(:mator_smash_statistic, MatorSmashStatistic.new(
      :user_id => 1,
      :times_run => 1,
      :patches_build => 1,
      :settings_created => 1,
      :plugins_smashed => 1,
      :reports_submitted => 1,
      :settings_submitted => 1
    ))
  end

  it "renders new mator_smash_statistic form" do
    render

    assert_select "form[action=?][method=?]", mator_smash_statistics_path, "post" do

      assert_select "input#mator_smash_statistic_user_id[name=?]", "mator_smash_statistic[user_id]"

      assert_select "input#mator_smash_statistic_times_run[name=?]", "mator_smash_statistic[times_run]"

      assert_select "input#mator_smash_statistic_patches_build[name=?]", "mator_smash_statistic[patches_build]"

      assert_select "input#mator_smash_statistic_settings_created[name=?]", "mator_smash_statistic[settings_created]"

      assert_select "input#mator_smash_statistic_plugins_smashed[name=?]", "mator_smash_statistic[plugins_smashed]"

      assert_select "input#mator_smash_statistic_reports_submitted[name=?]", "mator_smash_statistic[reports_submitted]"

      assert_select "input#mator_smash_statistic_settings_submitted[name=?]", "mator_smash_statistic[settings_submitted]"
    end
  end
end
