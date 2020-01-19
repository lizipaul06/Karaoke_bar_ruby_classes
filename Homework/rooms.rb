class Rooms

attr_accessor :playlist

def initialize(name, capacity, entry_fee)
  @name = name
  @playlist = []
  @capacity = capacity
  @entry_fee = entry_fee
  @guest = []

end

def count_guests
  @guest.count
end

def entry_fee(customer)
  if customer.money >= @entry_fee
  customer.money -= @entry_fee
  customer.bar_tab += @entry_fee
end
  return "sorry no entry"
end

def check_in(guest)
  if count_guests < @capacity
     entry_fee(guest)
    return @guest.push(guest)

  end
  return "sorry room is full!"
end

def check_out(guest)
  return @guest.delete(guest)
end



def add_songs_to_room(song)
  @playlist.push(song)

end

def song_count
  @playlist.count
end



end
