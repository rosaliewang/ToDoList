require 'test_helper'

class TodoasControllerTest < ActionController::TestCase
  setup do
    @todoa = todoas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:todoas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create todoa" do
    assert_difference('Todoa.count') do
      post :create, todoa: { content: @todoa.content, due: @todoa.due }
    end

    assert_redirected_to todoa_path(assigns(:todoa))
  end

  test "should show todoa" do
    get :show, id: @todoa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @todoa
    assert_response :success
  end

  test "should update todoa" do
    patch :update, id: @todoa, todoa: { content: @todoa.content, due: @todoa.due }
    assert_redirected_to todoa_path(assigns(:todoa))
  end

  test "should destroy todoa" do
    assert_difference('Todoa.count', -1) do
      delete :destroy, id: @todoa
    end

    assert_redirected_to todoas_path
  end
end
