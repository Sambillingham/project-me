require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase

  test "should get show" do
    get :show, id: users(:bobby).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "render 404 if profile not found" do
  	get :show, id: "doesn't exist"
  	assert_response :not_found
  end

  test "correctly assign varibles on show pages" do
  	get :show, id: users(:bobby).profile_name

  	assert assigns(:user)
  	assert_not_empty assigns(:statuses)
  end

  test "only show the correct user's statuses" do
  	get :show, id: users(:bobby).profile_name
  	assigns(:statuses).each do |status|
  		assert_equal users(:bobby), status.user
  	end
  end




end
