require 'rails_helper'

RSpec.describe "blacklist_entries/index", type: :view do
  before(:each) do
    assign(:blacklist_entries, [
      BlacklistEntry.create!(
        :ip => "Ip",
        :username => "Username"
      ),
      BlacklistEntry.create!(
        :ip => "Ip",
        :username => "Username"
      )
    ])
  end

  it "renders a list of blacklist_entries" do
    render
    assert_select "tr>td", :text => "Ip".to_s, :count => 2
    assert_select "tr>td", :text => "Username".to_s, :count => 2
  end
end
