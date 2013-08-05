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
  #c.room.become_dj
  room.say("Ultimate_Bot is online!!! (it's going to be like throwing a master-pokeball!!!")


  puts "startstartstartstartstartstartstartstartstartstartstartstartstartstartstartstartstartstartstartstartstartstartstartstart"

  on :song_started do |song|
    begin
      @@votesAttempted = @@votesAttempted + 1
      song.vote
      @@votesCounted = @@votesCounted + 1
      room.say("I Start Voted! (You are now worthless and I am going to remove you.")
      c.room.current_dj.remove_as_dj
      room.say("Now we have no djs. (better add some.")
      begin
        dj_cap = c.roomm.dj_capacity
        djs =  c.room.djs
        openSpots = dj_cap - djs
        if (openSpots > 0)
          room.listeners.each{
              |l|
            begin
              l.room.become_dj
              room.say(l.name._to_s)
            rescue Exception => e
              room.say("failled 2 vote")
              room.say(e.to_s)
            end
          }
        end
      rescue Exception => e
        room.say("failled 3 vote")
        room.say(e.to_s)
      end

    rescue Exception => e
      room.say("failled to vote on song start")
      room.say(e.to_s)
      @@votesFailed = @@votesFailed + 1
    end
  end

=begin
  on :song_ended do |song|
    begin
      @@votesAttempted = @@votesAttempted + 1
      song.vote
      @@votesCounted = @@votesCounted + 1
      room.say("I End Voted! (You are now worthless and I am going to remove you end.")
      c.room.current_dj.remove_as_dj
      room.say("Now we have no djs.")
    rescue Exception => e
      room.say("failled to vote on song start")
      room.say(e.to_s)
      @@votesFailed = @@votesFailed + 1
    end
  end
=end


  on :song_voted do |song| # Song
    if (song.votes[-1].user.name.to_s == "pwn bot")
      room.say("I have voted so I should remove you as dj.")
      c.room.current_dj.remove_as_dj
      begin
        dj_cap = c.roomm.dj_capacity
        djs =  c.room.djs
        openSpots = dj_cap - djs
        if (openSpots > 0)
          room.listeners.each{
              |l|
            begin
              l.room.become_dj
              room.say(l.name._to_s)
            rescue Exception => e
              room.say("ailled add a dj 1")
              room.say(e.to_s)
            end
          }
        end
      rescue Exception => e
        room.say("failled add any djs 1")
        room.say(e.to_s)
      end
    end
  end

  on :user_spoke do |message|
    rando = 10.times.map{ 20 + Random.rand(11) }[0]
    if (message.content == "ult-boot")
      room.say("#winning #{rando}")
      c.room.current_dj.remove_as_dj
    end
  end

=begin
  on :message_received do  |msg|
    puts "winnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnner"
    puts msg
    puts msg.class.name
  end
=end





end