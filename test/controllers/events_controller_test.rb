require 'test_helper'

class EventsControllerTest < ActionController::TestCase
    
    def setup
        @event = Event.create(name: "Summer is Coming", date: DateTime.new(2016, 6, 25, 6, 30), capacity: 50, theme: "Swimwear") 
        @user = User.create(username: "Brendan", email: "brendan@example.com", password: "password", admin: true)
    end
    
    test "should get categories index" do
        get :index
        assert_response :success
    end
    
    test "should get new" do
        #session[:user_id] = @user.id
        get :new
        assert_response :success
    end
    
    test "should get show" do
        get(:show, {'id' => @event.id}) 
        assert_response :success
    end
    
    #test "should redirect when admin not logged in" do
    #    assert_no_difference 'Category.count' do
    #        post :create, category: { name: "sports" }
    #    end
    #    assert_redirected_to categories_path
    #end
    
end