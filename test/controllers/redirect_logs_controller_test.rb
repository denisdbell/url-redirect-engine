require 'test_helper'

class RedirectLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @redirect_log = redirect_logs(:one)
  end

  test "should get index" do
    get redirect_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_redirect_log_url
    assert_response :success
  end

  test "should create redirect_log" do
    assert_difference('RedirectLog.count') do
      post redirect_logs_url, params: { redirect_log: { new_url: @redirect_log.new_url, old_url: @redirect_log.old_url, rule: @redirect_log.rule, status: @redirect_log.status } }
    end

    assert_redirected_to redirect_log_url(RedirectLog.last)
  end

  test "should show redirect_log" do
    get redirect_log_url(@redirect_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_redirect_log_url(@redirect_log)
    assert_response :success
  end

  test "should update redirect_log" do
    patch redirect_log_url(@redirect_log), params: { redirect_log: { new_url: @redirect_log.new_url, old_url: @redirect_log.old_url, rule: @redirect_log.rule, status: @redirect_log.status } }
    assert_redirected_to redirect_log_url(@redirect_log)
  end

  test "should destroy redirect_log" do
    assert_difference('RedirectLog.count', -1) do
      delete redirect_log_url(@redirect_log)
    end

    assert_redirected_to redirect_logs_url
  end
end
