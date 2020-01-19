class Guest
attr_accessor :name, :money, :bar_tab, :membership

def initialize(name, money, favourite_song, membership)
  @money = money
  @name = name
  @bar_tab = 0
  @favourite_song = favourite_song
  @membership = membership

end


def favourite_song(room)
  for song in room.playlist
    if song.name == @favourite_song
    return "Whoo!"
end

end
 return  "Lame!"
end


end
