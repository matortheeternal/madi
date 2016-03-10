require 'rails_helper'

RSpec.describe "mator_smash_statistics/show", type: :view do
  before(:each) do
    @mator_smash_statistic = assign(:mator_smash_statistic, MatorSmashStatistic.create!(
      :user_id => 1,
      :times_run => 2,
      :patches_build => 3,
      :settings_created => 4,
      :plugins_smashed => 5,
      :reports_submitted => 6,
      :settings_submitted => 7
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7/)
  end
end
