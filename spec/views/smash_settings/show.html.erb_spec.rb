require 'rails_helper'

RSpec.describe "smash_settings/show", type: :view do
  before(:each) do
    @smash_setting = assign(:smash_setting, SmashSetting.create!(
      :submitted_by => "Submitted By",
      :game => "Game",
      :name => "Name",
      :hash => "Hash",
      :color => 1,
      :records => "Records",
      :description => "Description",
      :tree => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Submitted By/)
    expect(rendered).to match(/Game/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Hash/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Records/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/MyText/)
  end
end
