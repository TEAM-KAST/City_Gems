require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      :author => 1,
      :content => "MyString",
      :pin_id => 1
    ))
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do

      assert_select "input#comment_author[name=?]", "comment[author]"

      assert_select "input#comment_content[name=?]", "comment[content]"

      assert_select "input#comment_pin_id[name=?]", "comment[pin_id]"
    end
  end
end