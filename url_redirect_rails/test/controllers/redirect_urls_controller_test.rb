require 'test_helper'

class RedirectUrlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @redirect_url = redirect_urls(:one)
  end

  test "should get index" do
    get redirect_urls_url
    assert_response :success
  end

  test "should get new" do
    get new_redirect_url_url
    assert_response :success
  end

  test "should create redirect_url" do
    assert_difference('RedirectUrl.count') do
      post redirect_urls_url, params: { redirect_url: { new_url: @redirect_url.new_url, old_url: @redirect_url.old_url } }
    end

    assert_redirected_to redirect_url_url(RedirectUrl.last)
  end

  test "should show redirect_url" do
    get redirect_url_url(@redirect_url)
    assert_response :success
  end

  test "should get edit" do
    get edit_redirect_url_url(@redirect_url)
    assert_response :success
  end

  test "should update redirect_url" do
    patch redirect_url_url(@redirect_url), params: { redirect_url: { new_url: @redirect_url.new_url, old_url: @redirect_url.old_url } }
    assert_redirected_to redirect_url_url(@redirect_url)
  end

  test "should destroy redirect_url" do
    assert_difference('RedirectUrl.count', -1) do
      delete redirect_url_url(@redirect_url)
    end

    assert_redirected_to redirect_urls_url
  end
end
