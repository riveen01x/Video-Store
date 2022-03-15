require "application_system_test_case"

class CopiesTest < ApplicationSystemTestCase
  setup do
    @copy = copies(:one)
  end

  test "visiting the index" do
    visit copies_url
    assert_selector "h1", text: "Copies"
  end

  test "creating a Copy" do
    visit copies_url
    click_on "New Copy"

    fill_in "Copy type", with: @copy.copy_type
    fill_in "Video", with: @copy.video_id
    click_on "Create Copy"

    assert_text "Copy was successfully created"
    click_on "Back"
  end

  test "updating a Copy" do
    visit copies_url
    click_on "Edit", match: :first

    fill_in "Copy type", with: @copy.copy_type
    fill_in "Video", with: @copy.video_id
    click_on "Update Copy"

    assert_text "Copy was successfully updated"
    click_on "Back"
  end

  test "destroying a Copy" do
    visit copies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Copy was successfully destroyed"
  end
end
