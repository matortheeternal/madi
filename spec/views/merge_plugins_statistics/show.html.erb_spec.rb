require 'rails_helper'

RSpec.describe "merge_plugins_statistics/show", type: :view do
  before(:each) do
    @merge_plugins_statistic = assign(:merge_plugins_statistic, MergePluginsStatistic.create!(
      :user_id => 1,
      :times_run => 2,
      :merges_built => 3,
      :plugins_checked => 4,
      :plugins_fixed => 5,
      :plugins_merged => 6,
      :reports_submitted => 7
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
