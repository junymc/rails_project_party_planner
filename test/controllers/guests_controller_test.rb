require 'test_helper'

class GuestsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get guests_new_url
    assert_response :success
  end

  test "should get create" do
    get guests_create_url
    assert_response :success
  end

  test "should get edit" do
    get guests_edit_url
    assert_response :success
  end

  test "should get update" do
    get guests_update_url
    assert_response :success
  end

  test "should get delete" do
    get guests_delete_url
    assert_response :success
  end

end
