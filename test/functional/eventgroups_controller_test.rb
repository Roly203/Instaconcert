require 'test_helper'

class EventgroupsControllerTest < ActionController::TestCase
  setup do
    @eventgroup = eventgroups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:eventgroups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create eventgroup" do
    assert_difference('Eventgroup.count') do
      post :create, eventgroup: {  }
    end

    assert_redirected_to eventgroup_path(assigns(:eventgroup))
  end

  test "should show eventgroup" do
    get :show, id: @eventgroup
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @eventgroup
    assert_response :success
  end

  test "should update eventgroup" do
    put :update, id: @eventgroup, eventgroup: {  }
    assert_redirected_to eventgroup_path(assigns(:eventgroup))
  end

  test "should destroy eventgroup" do
    assert_difference('Eventgroup.count', -1) do
      delete :destroy, id: @eventgroup
    end

    assert_redirected_to eventgroups_path
  end
end
