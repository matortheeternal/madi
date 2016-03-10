require 'rails_helper'

RSpec.describe "mator_smash_statistics/index", type: :view do
  before(:each) do
    assign(:mator_smash_statistics, [
      MatorSmashStatistic.create!(
        :user_id => 1,
        :times_run => 2,
        :patches_build => 3,
        :settings_created => 4,
        :plugins_smashed => 5,
        :reports_submitted => 6,
        :settings_submitted => 7
      ),
      MatorSmashStatistic.create!(
        :user_id => 1,
        :times_run => 2,
        :patches_build => 3,
        :settings_created => 4,
        :plugins_smashed => 5,
        :reports_submitted => 6,
        :settings_submitted => 7
      )
    ])
  end

  it "renders a list of mator_smash_statistics" do
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
