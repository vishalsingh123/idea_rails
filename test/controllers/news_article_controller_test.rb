require 'test_helper'

class NewsArticleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get news_article_index_url
    assert_response :success
  end

end
