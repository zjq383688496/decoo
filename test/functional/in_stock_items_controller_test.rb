require 'test_helper'

class InStockItemsControllerTest < ActionController::TestCase
  setup do
    @in_stock_item = in_stock_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:in_stock_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create in_stock_item" do
    assert_difference('InStockItem.count') do
      post :create, in_stock_item: {  }
    end

    assert_redirected_to in_stock_item_path(assigns(:in_stock_item))
  end

  test "should show in_stock_item" do
    get :show, id: @in_stock_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @in_stock_item
    assert_response :success
  end

  test "should update in_stock_item" do
    put :update, id: @in_stock_item, in_stock_item: {  }
    assert_redirected_to in_stock_item_path(assigns(:in_stock_item))
  end

  test "should destroy in_stock_item" do
    assert_difference('InStockItem.count', -1) do
      delete :destroy, id: @in_stock_item
    end

    assert_redirected_to in_stock_items_path
  end
end
