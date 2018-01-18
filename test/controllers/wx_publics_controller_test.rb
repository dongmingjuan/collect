require 'test_helper'

class WxPublicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wx_public = wx_publics(:one)
  end

  test "should get index" do
    get wx_publics_url
    assert_response :success
  end

  test "should get new" do
    get new_wx_public_url
    assert_response :success
  end

  test "should create wx_public" do
    assert_difference('WxPublic.count') do
      post wx_publics_url, params: { wx_public: { alias: @wx_public.alias, manager: @wx_public.manager, nickname: @wx_public.nickname } }
    end

    assert_redirected_to wx_public_url(WxPublic.last)
  end

  test "should show wx_public" do
    get wx_public_url(@wx_public)
    assert_response :success
  end

  test "should get edit" do
    get edit_wx_public_url(@wx_public)
    assert_response :success
  end

  test "should update wx_public" do
    patch wx_public_url(@wx_public), params: { wx_public: { alias: @wx_public.alias, manager: @wx_public.manager, nickname: @wx_public.nickname } }
    assert_redirected_to wx_public_url(@wx_public)
  end

  test "should destroy wx_public" do
    assert_difference('WxPublic.count', -1) do
      delete wx_public_url(@wx_public)
    end

    assert_redirected_to wx_publics_url
  end
end
