require 'test_helper'

class SpecPropertiesControllerTest < ActionController::TestCase
  setup do
    @spec_property = spec_properties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spec_properties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spec_property" do
    assert_difference('SpecProperty.count') do
      post :create, spec_property: {  }
    end

    assert_redirected_to spec_property_path(assigns(:spec_property))
  end

  test "should show spec_property" do
    get :show, id: @spec_property
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spec_property
    assert_response :success
  end

  test "should update spec_property" do
    put :update, id: @spec_property, spec_property: {  }
    assert_redirected_to spec_property_path(assigns(:spec_property))
  end

  test "should destroy spec_property" do
    assert_difference('SpecProperty.count', -1) do
      delete :destroy, id: @spec_property
    end

    assert_redirected_to spec_properties_path
  end
end
