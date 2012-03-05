require 'test_helper'

module Ems
  class TagsControllerTest < ActionController::TestCase
    setup do
      @tag = tags(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:tags)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create tags" do
      assert_difference('Tag.count') do
        post :create, tags: @tag.attributes
      end
  
      assert_redirected_to tag_path(assigns(:tags))
    end
  
    test "should show tags" do
      get :show, id: @tag
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, id: @tag
      assert_response :success
    end
  
    test "should update tags" do
      put :update, id: @tag, tags: @tag.attributes
      assert_redirected_to tag_path(assigns(:tags))
    end
  
    test "should destroy tags" do
      assert_difference('Tag.count', -1) do
        delete :destroy, id: @tag
      end
  
      assert_redirected_to tags_path
    end
  end
end
