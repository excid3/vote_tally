require "application_system_test_case"

class RidingsTest < ApplicationSystemTestCase
  setup do
    @riding = ridings(:one)
  end

  test "visiting the index" do
    visit ridings_url
    assert_selector "h1", text: "Ridings"
  end

  test "creating a Riding" do
    visit ridings_url
    click_on "New Riding"

    fill_in "Eligible voters", with: @riding.eligible_voters
    fill_in "Name", with: @riding.name
    fill_in "Number", with: @riding.number
    fill_in "Province", with: @riding.province
    fill_in "Win number", with: @riding.win_number
    click_on "Create Riding"

    assert_text "Riding was successfully created"
    click_on "Back"
  end

  test "updating a Riding" do
    visit ridings_url
    click_on "Edit", match: :first

    fill_in "Eligible voters", with: @riding.eligible_voters
    fill_in "Name", with: @riding.name
    fill_in "Number", with: @riding.number
    fill_in "Province", with: @riding.province
    fill_in "Win number", with: @riding.win_number
    click_on "Update Riding"

    assert_text "Riding was successfully updated"
    click_on "Back"
  end

  test "destroying a Riding" do
    visit ridings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Riding was successfully destroyed"
  end
end
