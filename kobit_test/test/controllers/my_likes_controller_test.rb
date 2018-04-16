require 'test_helper'

class MyLikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @my_like = my_likes(:one)
  end

  test "should get index" do
    get my_likes_url
    assert_response :success
  end

  test "should get new" do
    get new_my_like_url
    assert_response :success
  end

  test "should create my_like" do
    assert_difference('MyLike.count') do
      post my_likes_url, params: { my_like: { fruit: @my_like.fruit, name: @my_like.name } }
    end

    assert_redirected_to my_like_url(MyLike.last)
  end

  test "should show my_like" do
    get my_like_url(@my_like)
    assert_response :success
  end

  test "should get edit" do
    get edit_my_like_url(@my_like)
    assert_response :success
  end

  test "should update my_like" do
    patch my_like_url(@my_like), params: { my_like: { fruit: @my_like.fruit, name: @my_like.name } }
    assert_redirected_to my_like_url(@my_like)
  end

  test "should destroy my_like" do
    assert_difference('MyLike.count', -1) do
      delete my_like_url(@my_like)
    end

    assert_redirected_to my_likes_url
  end
end
