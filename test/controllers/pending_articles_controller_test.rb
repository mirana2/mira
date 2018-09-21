require 'test_helper'

class PendingArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pending_article = pending_articles(:one)
  end

  test "should get index" do
    get pending_articles_url
    assert_response :success
  end

  test "should get new" do
    get new_pending_article_url
    assert_response :success
  end

  test "should create pending_article" do
    assert_difference('PendingArticle.count') do
      post pending_articles_url, params: { pending_article: {  } }
    end

    assert_redirected_to pending_article_url(PendingArticle.last)
  end

  test "should show pending_article" do
    get pending_article_url(@pending_article)
    assert_response :success
  end

  test "should get edit" do
    get edit_pending_article_url(@pending_article)
    assert_response :success
  end

  test "should update pending_article" do
    patch pending_article_url(@pending_article), params: { pending_article: {  } }
    assert_redirected_to pending_article_url(@pending_article)
  end

  test "should destroy pending_article" do
    assert_difference('PendingArticle.count', -1) do
      delete pending_article_url(@pending_article)
    end

    assert_redirected_to pending_articles_url
  end
end
