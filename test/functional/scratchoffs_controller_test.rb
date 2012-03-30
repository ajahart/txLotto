require 'test_helper'

class ScratchoffsControllerTest < ActionController::TestCase
  setup do
    @scratchoff = scratchoffs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scratchoffs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scratchoff" do
    assert_difference('Scratchoff.count') do
      post :create, :scratchoff => @scratchoff.attributes
    end

    assert_redirected_to scratchoff_path(assigns(:scratchoff))
  end

  test "should show scratchoff" do
    get :show, :id => @scratchoff.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @scratchoff.to_param
    assert_response :success
  end

  test "should update scratchoff" do
    put :update, :id => @scratchoff.to_param, :scratchoff => @scratchoff.attributes
    assert_redirected_to scratchoff_path(assigns(:scratchoff))
  end

  test "should destroy scratchoff" do
    assert_difference('Scratchoff.count', -1) do
      delete :destroy, :id => @scratchoff.to_param
    end

    assert_redirected_to scratchoffs_path
  end
end
