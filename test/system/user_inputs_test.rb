require "application_system_test_case"

class UserInputsTest < ApplicationSystemTestCase
  setup do
    @user_input = user_inputs(:one)
  end

  test "visiting the index" do
    visit user_inputs_url
    assert_selector "h1", text: "User Inputs"
  end

  test "creating a User input" do
    visit user_inputs_url
    click_on "New User Input"

    fill_in "Csv", with: @user_input.csv
    fill_in "Num Of Columns", with: @user_input.num_of_columns
    click_on "Create User input"

    assert_text "User input was successfully created"
    click_on "Back"
  end

  test "updating a User input" do
    visit user_inputs_url
    click_on "Edit", match: :first

    fill_in "Csv", with: @user_input.csv
    fill_in "Num Of Columns", with: @user_input.num_of_columns
    click_on "Update User input"

    assert_text "User input was successfully updated"
    click_on "Back"
  end

  test "destroying a User input" do
    visit user_inputs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User input was successfully destroyed"
  end
end
