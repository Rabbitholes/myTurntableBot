#!/usr/bin/env ruby
require 'turntabler'

# Credentials
EMAIL = 'spawnbot@sb.gme'
PASSWORD = 'spawnbot11'
ROOM = '51f920faeb35c10a6c3a1f97' # ID only '52015fb6eb35c109d87e7ec3'

@@votesAttempted = 0
@@votesCounted = 0
@@votesFailed = 0

@@botId = ""

TT.run(EMAIL, PASSWORD, :room => ROOM) do |c|

  room.say("The Master Spawn_Bot is online!!!")
  def attemptVote(song)
    begin
      @@votesAttempted = @@votesAttempted + 1
      puts "Voting"
      song.vote
      puts "Voting - success"
      @@votesCounted = @@votesCounted + 1
    rescue Exception => e
      puts "Voting - failed"
      puts e.to_s
      @@votesFailed = @@votesFailed + 1
    end
  end

  on :song_started do |song|
    begin
      puts "song_started"
      attemptVote(song)
      puts "song_started - success"
    rescue Exception => e
      puts "song_started - failed"
      puts e.to_s
    end
  end

  on :song_ended do |song|
    begin
      puts "song_ended"
      attemptVote(song)
      puts "song_ended - success"
    rescue Exception => e
      puts "song_ended - failed"
      puts e.to_s
    end
  end


  on :user_spoke do |message|
    rando = 10.times.map{ 20 + Random.rand(11) }[0]
    if (message.content == "spawnbot@sb.gme")
      room.say("attempts #{@@votesAttempted}")
      room.say("counted #{@@votesCounted}")
      room.say("failed #{@@votesFailed}")
    end

    if (message.content == "master_spawn_bot")
      room.say(room.listener_capacity.to_s)
    end

    if (message.content == "spawn_swarm")
      begin
        puts "spawning"
        room.say("spawning")
        system("bash runner.sh")
        room.say("spawned")
        puts "spawned"
      rescue Exception => e
        puts e.to_s
      end
    end
  end
end