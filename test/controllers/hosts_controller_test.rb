require 'test_helper'

class HostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get hosts_new_url
    assert_response :success
  end

  test "should get create" do
    get hosts_create_url
    assert_response :success
  end

  test "should get edit" do
    get hosts_edit_url
    assert_response :success
  end

  test "should get update" do
    get hosts_update_url
    assert_response :success
  end

  test "should get delete" do
    get hosts_delete_url
    assert_response :success
  end

end
