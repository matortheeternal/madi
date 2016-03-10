require 'rails_helper'

RSpec.describe "blacklist_entries/show", type: :view do
  before(:each) do
    @blacklist_entry = assign(:blacklist_entry, BlacklistEntry.create!(
      :ip => "Ip",
      :username => "Username"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Ip/)
    expect(rendered).to match(/Username/)
  end
end
