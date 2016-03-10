require 'rails_helper'

RSpec.describe "merge_plugins_statistics/index", type: :view do
  before(:each) do
    assign(:merge_plugins_statistics, [
      MergePluginsStatistic.create!(
        :user_id => 1,
        :times_run => 2,
        :merges_built => 3,
        :plugins_checked => 4,
        :plugins_fixed => 5,
        :plugins_merged => 6,
        :reports_submitted => 7
      ),
      MergePluginsStatistic.create!(
        :user_id => 1,
        :times_run => 2,
        :merges_built => 3,
        :plugins_checked => 4,
        :plugins_fixed => 5,
        :plugins_merged => 6,
        :reports_submitted => 7
      )
    ])
  end

  it "renders a list of merge_plugins_statistics" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
  end
end
