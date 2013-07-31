#!/usr/bin/env ruby
require 'turntabler'

# Credentials
EMAIL = 'champion08@gmail.com'
PASSWORD = 'Rabbit~15t'
ROOM = '51f920faeb35c10a6c3a1f97' # ID only


@@vote_count = 1
@@homies = {}


TT.run(EMAIL, PASSWORD, :room => ROOM) do  |c|
  room.say("DJ_Bot (BETA). This bot is going to get you lots of points")

  c.room.become_dj
  room.say("DJ_Bot has become a dj!!!")

  on :user_spoke do |message|
    if (message.content == "mine")
      homie_id = message.sender.id.to_s
      puts "092340197823490812"
      puts "092340197823490812"
      puts
      puts homie_id
      puts
      puts "092340197823490812"
      puts "092340197823490812"

      #room.say(@@homies.to_s)
      if (@@homies.has_key?(homie_id))
        room.say("Bot has voted #{@@homies[homie_id].to_i} times for '#{message.sender.name.to_s}'")
      else
        room.say("Sorry homie... we don't have any vote information for you.")
      end
    end

    if (message.content == "bot-votes")
      room.say("Total_Votes => #{@@vote_count}")
    end

    if (message.content == "force-bot-vote")
      room.say("bot is voting")

      begin
        c.room.current_song.vote
        @@vote_count = @@vote_count + 1

        homie_id = c.room.current_song.played_by.id.to_s
        if (@@homies.has_key?(homie_id))
          @@homies[homie_id] = @@homies[homie_id].to_i + 1
        else
          @@homies[homie_id] = 1
        end
        room.say("I voted! Total_Votes => #{@@vote_count}")
      rescue Exception => e

        homie_id = c.room.current_song.played_by.id.to_s
        if (@@homies.has_key?(homie_id))
          @@homies[homie_id] = @@homies[homie_id].to_i + 1
        else
          @@homies[homie_id] = 1
        end
        room.say("..it looks as though I (the bot) have already voted")
      end

    end

=begin
    if (message.content == "song-stats")
      room.say(c.room.current_song.votes.to_s)
    end
=end
  end

  on :song_started do |song|
    room.say("song_started")
    song.vote
    homie_id = song.played_by.id.to_s
    room.say("this is for testing #{homie_id}")
    if (@@homies.has_key?(homie_id))
      @@homies[homie_id] = @@homies[homie_id].to_i + 1
    else
      @@homies[homie_id] = 1
    end
    @@vote_count = @@vote_count + 1
    room.say("I voted! Total_Votes => #{@@vote_count}")
  end

end
