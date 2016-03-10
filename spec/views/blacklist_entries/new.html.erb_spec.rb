require 'rails_helper'

RSpec.describe "blacklist_entries/new", type: :view do
  before(:each) do
    assign(:blacklist_entry, BlacklistEntry.new(
      :ip => "MyString",
      :username => "MyString"
    ))
  end

  it "renders new blacklist_entry form" do
    render

    assert_select "form[action=?][method=?]", blacklist_entries_path, "post" do

      assert_select "input#blacklist_entry_ip[name=?]", "blacklist_entry[ip]"

      assert_select "input#blacklist_entry_username[name=?]", "blacklist_entry[username]"
    end
  end
end
