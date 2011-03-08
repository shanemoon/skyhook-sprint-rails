require 'test_helper'

class RawInputsControllerTest < ActionController::TestCase
  setup do
    @raw_input = raw_inputs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:raw_inputs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create raw_input" do
    assert_difference('RawInput.count') do
      post :create, :raw_input => @raw_input.attributes
    end

    assert_redirected_to raw_input_path(assigns(:raw_input))
  end

  test "should show raw_input" do
    get :show, :id => @raw_input.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @raw_input.to_param
    assert_response :success
  end

  test "should update raw_input" do
    put :update, :id => @raw_input.to_param, :raw_input => @raw_input.attributes
    assert_redirected_to raw_input_path(assigns(:raw_input))
  end

  test "should destroy raw_input" do
    assert_difference('RawInput.count', -1) do
      delete :destroy, :id => @raw_input.to_param
    end

    assert_redirected_to raw_inputs_path
  end
end
