require("minitest/autorun")
require("minitest/reporters")
require_relative("../guest.rb")
require_relative("../rooms.rb")
require_relative("../songs.rb")
require_relative("../bar.rb")

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class Roomstest < MiniTest::Test

  def setup
    @bar = Bar.new("sing your heart out!")
    @room1 = Rooms.new("Dance Dance", 4, 5)
    @song = Song.new("Purple Rain", "Prince")
    @song2 = Song.new("Like a Prayer", "Madonna")
    @song3 = Song.new("Love Shack", "B-52's")
    @song4 = Song.new("“I Wanna Dance With Somebody", "Whitney Houston")

    @bar.food = [{type: "Burger",price:5},{type: "chips", price: 5}]
    @bar.drink =[{type:"vodka", price: 4}, {type:"whiskey", price: 3}, {type: "beer", price: 4}]
    @room1.playlist = [@song, @song2, @song3]

    @guest1 = Guest.new("Mark", 15, "Love Shack", "Non-member")
    @guest2 = Guest.new("Jane", 20, "Barbie girl", "VIP")
    @guest3 = Guest.new("Will", 2, "Eazy Living", "Non-member")

  end

def test_check_in
@room1.check_in(@guest1)
assert_equal(1, @room1.count_guests)
  end

def test_check_out
  @room1.check_in(@guest1)
  @room1.check_in(@guest2)
assert_equal(2, @room1.count_guests)
@room1.check_out(@guest1)
assert_equal(1, @room1.count_guests)
end



def test_capacity
  @room1.check_in(@guest1)
  @room1.check_in(@guest2)
  @room1.check_in(@guest1)
  @room1.check_in(@guest2)
assert_equal(4, @room1.count_guests)
assert_equal(5, @guest1.money)
  @room1.check_in(@guest2)
  assert_equal("sorry room is full!", @room1.check_in(@guest2))
  assert_equal(4, @room1.count_guests)

end

def test_add_songs_to_room
  @room1.add_songs_to_room(@song4)
  assert_equal(4, @room1.song_count)

end


def test_entry_fee
  @room1.entry_fee(@guest1)
  assert_equal(10, @guest1.money)
  @room1.entry_fee(@guest3)
  assert_equal("sorry no entry", @room1.entry_fee(@guest3))
end



def test_favourite_song
  @guest1.favourite_song(@room1)
 assert_equal("Whoo!", @guest1.favourite_song(@room1))
 @guest2.favourite_song(@room1)
 assert_equal("Lame!", @guest2.favourite_song(@room1))
end

def test_bar_tab
  @room1.entry_fee(@guest1)
  assert_equal(5, @guest1.bar_tab)
end

def test_buy_food
  @bar.buy_food("Burger", @guest1)
  assert_equal(10, @guest1.money)
  assert_equal(5, @guest1.bar_tab)
end

def test_buy_drink
  @bar.buy_drink("vodka", @guest1)
  assert_equal(11, @guest1.money)
  assert_equal(4, @guest1.bar_tab)
end

def test_vip
  @bar.buy_food("Burger", @guest2)
  assert_equal(17.5, @guest2.money)
  assert_equal(2.5, @guest2.bar_tab)
end

end
