#!/usr/bin/env ruby
require 'turntabler'

# Credentials
EMAIL = 'champion08@gmail.com'
PASSWORD = 'Rabbit~15t'
ROOM = '51f920faeb35c10a6c3a1f97' # ID only

@@votesAttempted = 0
@@votesCounted = 0
@@votesFailed = 0

@@votesAttempted2 = 0
@@votesCounted2 = 0
@@votesFailed2 = 0

TT.run(EMAIL, PASSWORD, :room => ROOM) do |c|
  c.room.become_dj
  room.say("Vote_Bot has become a dj!!!")

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

    if (message.content == "get-clock")
      remain = c.room.current_song.seconds_remaining
      slength = c.room.current_song.length
      room.say("remaining #{remain}")
      room.say("length #{slength}")
      if ((slength - remain) >= 5)
        room.say("cut it now")
      else
        room.say("wait a bit long")
      end
    end


    if (message.content == "vote-stats")
      room.say("~Slave Stats~")
      room.say("votes attempted => #{@@votesAttempted}")
      room.say("votes counted =>  #{@@votesCounted}")
      room.say("votes failed => #{@@votesFailed}")
      room.say("#2 attempts")
      room.say("votes attempted => #{@@votesAttempted2}")
      room.say("votes counted =>  #{@@votesCounted2}")
      room.say("votes failed => #{@@votesFailed2}")
    end

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
          room.say("magic-booter")
        rescue Exception => e
          room.say("go check your vote logs")
          puts "88888888888888888888888888888888888"
          puts
          puts e.to_s
          puts
          puts "88888888888888888888888888888888888"
          #room.say("watt #{rando}")
          #room.say("magic-booter")
        end
      end
    end
  end


end