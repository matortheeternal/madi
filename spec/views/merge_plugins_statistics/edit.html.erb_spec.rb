require 'rails_helper'

RSpec.describe "merge_plugins_statistics/edit", type: :view do
  before(:each) do
    @merge_plugins_statistic = assign(:merge_plugins_statistic, MergePluginsStatistic.create!(
      :user_id => 1,
      :times_run => 1,
      :merges_built => 1,
      :plugins_checked => 1,
      :plugins_fixed => 1,
      :plugins_merged => 1,
      :reports_submitted => 1
    ))
  end

  it "renders the edit merge_plugins_statistic form" do
    render

    assert_select "form[action=?][method=?]", merge_plugins_statistic_path(@merge_plugins_statistic), "post" do

      assert_select "input#merge_plugins_statistic_user_id[name=?]", "merge_plugins_statistic[user_id]"

      assert_select "input#merge_plugins_statistic_times_run[name=?]", "merge_plugins_statistic[times_run]"

      assert_select "input#merge_plugins_statistic_merges_built[name=?]", "merge_plugins_statistic[merges_built]"

      assert_select "input#merge_plugins_statistic_plugins_checked[name=?]", "merge_plugins_statistic[plugins_checked]"

      assert_select "input#merge_plugins_statistic_plugins_fixed[name=?]", "merge_plugins_statistic[plugins_fixed]"

      assert_select "input#merge_plugins_statistic_plugins_merged[name=?]", "merge_plugins_statistic[plugins_merged]"

      assert_select "input#merge_plugins_statistic_reports_submitted[name=?]", "merge_plugins_statistic[reports_submitted]"
    end
  end
end
