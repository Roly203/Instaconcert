require 'test_helper'

class EventRequestsControllerTest < ActionController::TestCase
  setup do
    @event_request = event_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_request" do
    assert_difference('EventRequest.count') do
      post :create, event_request: { distance: @event_request.distance, lat: @event_request.lat, long: @event_request.long, max_timestamp: @event_request.max_timestamp, min_timestamp: @event_request.min_timestamp }
    end

    assert_redirected_to event_request_path(assigns(:event_request))
  end

  test "should show event_request" do
    get :show, id: @event_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_request
    assert_response :success
  end

  test "should update event_request" do
    put :update, id: @event_request, event_request: { distance: @event_request.distance, lat: @event_request.lat, long: @event_request.long, max_timestamp: @event_request.max_timestamp, min_timestamp: @event_request.min_timestamp }
    assert_redirected_to event_request_path(assigns(:event_request))
  end

  test "should destroy event_request" do
    assert_difference('EventRequest.count', -1) do
      delete :destroy, id: @event_request
    end

    assert_redirected_to event_requests_path
  end
end
