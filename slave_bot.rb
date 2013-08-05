#!/usr/bin/env ruby
require 'turntabler'

# Credentials
EMAIL = 'matthew.s.schmitz@gmail.com'
PASSWORD = 'rabbit~15t'
ROOM = '51f920faeb35c10a6c3a1f97' # ID only



@@votesAttempted = 0
@@votesCounted = 0
@@votesFailed = 0

@@votesAttempted2 = 0
@@votesCounted2 = 0
@@votesFailed2 = 0

TT.run(EMAIL, PASSWORD, :room => ROOM) do |c|
  c.room.become_dj
  room.say("Slave_Bot has become a dj!!!")

  on :song_started do |song|
    begin
      @@votesAttempted = @@votesAttempted + 1
      song.vote
      @@votesCounted = @@votesCounted + 1
    rescue Exception => e
      @@votesFailed = @@votesFailed + 1
    end
  end

  on :user_spoke do |message|
    rando = 10.times.map{ 20 + Random.rand(11) }[0]
    if (message.content == "slave-stats")
      room.say("~Slave Stats~")
      room.say("votes attempted => #{@@votesAttempted}")
      room.say("votes counted =>  #{@@votesCounted}")
      room.say("votes failed => #{@@votesFailed}")
      room.say("#2 attempts")
      room.say("votes attempted => #{@@votesAttempted2}")
      room.say("votes counted =>  #{@@votesCounted2}")
      room.say("votes failed => #{@@votesFailed2}")
    end
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
          begin
            @@votesAttempted2 = @@votesAttempted2 + 1
            song.vote
            @@votesCounted2 = @@votesCounted2 + 1
          rescue Exception => e
            @@votesFailed2 = @@votesFailed2 + 1
          end
          room.say("#winning #{rando}")
          c.room.current_dj.remove_as_dj
          c.room.become_dj
          room.say("magic-boot")
        rescue Exception => e
          room.say("go check your slave logs")
          puts "88888888888888888888888888888888888"
          puts
          puts e.to_s
          puts
          puts "88888888888888888888888888888888888"

          #room.say("watt #{rando}")
          #room.say("magic-boot")
        end
      end
    end
  end


end