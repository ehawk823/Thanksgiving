require 'test_helper'

class HandlesControllerTest < ActionController::TestCase
  setup do
    @handle = handles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:handles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create handle" do
    assert_difference('Handle.count') do
      post :create, handle: { handle_name: @handle.handle_name }
    end

    assert_redirected_to handle_path(assigns(:handle))
  end

  test "should show handle" do
    get :show, id: @handle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @handle
    assert_response :success
  end

  test "should update handle" do
    patch :update, id: @handle, handle: { handle_name: @handle.handle_name }
    assert_redirected_to handle_path(assigns(:handle))
  end

  test "should destroy handle" do
    assert_difference('Handle.count', -1) do
      delete :destroy, id: @handle
    end

    assert_redirected_to handles_path
  end
end
