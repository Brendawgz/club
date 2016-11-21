require 'test_helper'

class EventTest < ActiveSupport::TestCase
   
   def setup
      @event = Event.new(name: "Summer is Coming", date: DateTime.new(2016, 6, 25, 6, 30), capacity: 50, theme: "Swimwear") 
   end
   
   test "event should be valid" do
       assert @event.valid?
   end
   
   test "date should be a DateTime" do
      @event.date = "Not a DateTime"
      assert_not @event.valid?
   end
   
   test "name should be unique" do
       @event.save
       event2 = Event.new(name: "Summer is Coming", date: DateTime.new(2016, 6, 25, 6, 30), capacity: 50, theme: "Swimwear") 
       assert_not event2.valid?
   end
   
   test "name should not be too long" do
      @event.name = "a" * 41
      assert_not @event.valid?
   end
   
   test "name should not be too short" do
       @event.name = "a" * 3
      assert_not @event.valid?
   end
    
end