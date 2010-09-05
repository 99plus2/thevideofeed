require 'test_helper'

class FeedItemsControllerTest < ActionController::TestCase

  test "index" do
    get :index
    assert_redirected_to new_user_session_path
    u = sign_in!
    get :index
    assert_response :success
    Post.make
    u.posts.make
    get :index
    assert_response :success
  end

  test "index shows posts in user's feed_items" do
    u1 = sign_in!
    u2 = User.make
    p = u2.posts.make
    get :index
    assert assigns(:feed_items).blank?
    u1.follow(u2)
    get :index
    assert !assigns(:feed_items).blank?
    assert assigns(:feed_items).first.post == p
    u1.unfollow(u2)
    get :index
    assert assigns(:feed_items).blank?
  end

end
