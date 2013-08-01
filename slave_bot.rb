#!/usr/bin/env ruby
require 'turntabler'

# Credentials
EMAIL = 'matthew.s.schmitz@gmail.com'
PASSWORD = 'rabbit~15t'
ROOM = '51f920faeb35c10a6c3a1f97' # ID only


TT.run(EMAIL, PASSWORD, :room => ROOM) do |c|
  c.room.become_dj
  room.say("Slave_Bot has become a dj!!!")




  on :song_started do |song|
    room.say("v")
    puts "attempting"
    puts "attempting"
    puts "attempting"
    puts "attempting"
    song.vote
    room.say("vv")
    puts "better go gomhe"

  end

  on :user_spoke do |message|
    rando = 10.times.map{ 20 + Random.rand(11) }[0]
    if (message.content == "magic-booter")
      if (message.sender.name == "pwn bot")
=begin
        begin
          room.say("votting slave")
          c.room.current_song.vote
          room.say("votteed slave")
        rescue Exception => e
          room.say("wat #{rando}")
          room.say("wat #{e.to_s}")
        end
=end
        begin
          room.say("#winning #{rando}")
          c.room.current_dj.remove_as_dj
          c.room.become_dj
          room.say("magic-boot")
        rescue Exception => e
          room.say("watt #{rando}")
          room.say("magic-boot")
        end
      end
    end
  end


end