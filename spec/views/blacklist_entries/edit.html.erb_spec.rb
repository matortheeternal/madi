require 'rails_helper'

RSpec.describe "blacklist_entries/edit", type: :view do
  before(:each) do
    @blacklist_entry = assign(:blacklist_entry, BlacklistEntry.create!(
      :ip => "MyString",
      :username => "MyString"
    ))
  end

  it "renders the edit blacklist_entry form" do
    render

    assert_select "form[action=?][method=?]", blacklist_entry_path(@blacklist_entry), "post" do

      assert_select "input#blacklist_entry_ip[name=?]", "blacklist_entry[ip]"

      assert_select "input#blacklist_entry_username[name=?]", "blacklist_entry[username]"
    end
  end
end
