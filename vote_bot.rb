#!/usr/bin/env ruby
require 'turntabler'

# Credentials
EMAIL = 'champion08@gmail.com'
PASSWORD = 'Rabbit~15t'
ROOM = '51f920faeb35c10a6c3a1f97' # ID only

TT.run(EMAIL, PASSWORD, :room => ROOM) do |c|
  c.room.become_dj
  room.say("Vote_Bot has become a dj!!!")


  on :song_started do |song|
    room.say("q")
    song.vote
    room.say("qq")
  end


  on :user_spoke do |message|
    rando = 10.times.map{ 20 + Random.rand(11) }[0]
    if (message.content == "tigers-blood")
      if (message.sender.name == "dr mundo")
        room.say("and so it begins #{rando}")
        room.say("magic-booter")
      end
    end
    if (message.content == "magic-boot")
      if (message.sender.name == "Rabbitholes")
=begin
        begin
          room.say("votting vote")
          c.room.current_song.vote
          room.say("votteed vote")
        rescue Exception => e
          room.say("wat #{rando}")
          room.say("wat #{e.to_s}")
        end
=end
        begin
          room.say("#winning #{rando}")
          c.room.current_dj.remove_as_dj
          c.room.become_dj
          room.say("magic-booter")
        rescue Exception => e
          room.say("watt #{rando}")
          room.say("magic-booter")
        end
      end
    end
  end


end