require "application_system_test_case"

class PendingArticlesTest < ApplicationSystemTestCase
  setup do
    @pending_article = pending_articles(:one)
  end

  test "visiting the index" do
    visit pending_articles_url
    assert_selector "h1", text: "Pending Articles"
  end

  test "creating a Pending article" do
    visit pending_articles_url
    click_on "New Pending Article"

    click_on "Create Pending article"

    assert_text "Pending article was successfully created"
    click_on "Back"
  end

  test "updating a Pending article" do
    visit pending_articles_url
    click_on "Edit", match: :first

    click_on "Update Pending article"

    assert_text "Pending article was successfully updated"
    click_on "Back"
  end

  test "destroying a Pending article" do
    visit pending_articles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pending article was successfully destroyed"
  end
end
