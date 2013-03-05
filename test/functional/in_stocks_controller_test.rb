require 'test_helper'

class InStocksControllerTest < ActionController::TestCase
  setup do
    @in_stock = in_stocks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:in_stocks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create in_stock" do
    assert_difference('InStock.count') do
      post :create, in_stock: {  }
    end

    assert_redirected_to in_stock_path(assigns(:in_stock))
  end

  test "should show in_stock" do
    get :show, id: @in_stock
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @in_stock
    assert_response :success
  end

  test "should update in_stock" do
    put :update, id: @in_stock, in_stock: {  }
    assert_redirected_to in_stock_path(assigns(:in_stock))
  end

  test "should destroy in_stock" do
    assert_difference('InStock.count', -1) do
      delete :destroy, id: @in_stock
    end

    assert_redirected_to in_stocks_path
  end
end
