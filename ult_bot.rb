#!/usr/bin/env ruby
require 'turntabler'

# Credentials
EMAIL = 'champion08@gmail.com'
PASSWORD = 'Rabbit~15t'
#ROOM = '51f920faeb35c10a6c3a1f97' # ID only
ROOM = '52015fb6eb35c109d87e7ec3'

@@votesAttempted = 0
@@votesCounted = 0
@@votesFailed = 0
#@@fromVote = 0
@@fromEnd = 0
@@fromStart = 0
@@fromManual = 0
#@@fromVoteFail = 0
@@fromEndFail = 0
@@fromStartFail = 0
@@fromManualFail = 0
@@voted = false

@@botId = ""
#@@localLog = Logger.new('ultimate.log', 0, 100 * 1024 * 1024)

TT.run(EMAIL, PASSWORD, :room => ROOM) do |c|
  #c.room.become_dj
  #begin

  @@botId  = c.user.id

  room.say("Ultimate_Bot is online!!! (it's going to be like throwing a master-pokeball!!!")

  puts "startstartstartstartstartstartstartstartstartstartstartstartstartstartstartstartstartstartstartstartstartstartstartstart"

  def djMagic()
    begin
      puts "djMagic"
      room.say("djMagic")
      #@@localLog.debug("djMagic")
      dj_cap = room.dj_capacity
      djs = room.djs.length
      openSpots = dj_cap - djs
      room.say("(#{openSpots}) Open Spots")
      if (djs <= 2)
        begin
          room.say(@@botId)
          magicUser = room.listener(@@botId)#("pwn bot")
          if (!magicUser.dj?)
            room.become_dj
            room.say("Never Fear. Underdog is here!")
          else
            room.say("Uhh houston...we amy have a problem")
          end
        rescue Exception => e
          raise e
        end
        begin
          room.current_dj.remove_as_dj
        rescue Exception => e
          raise e
        end
      end

      #if (openSpots > 0)
      #  room.listeners.each{
      #      |l|
      #    if (openSpots > 0 && !l.dj?)
      #      begin
      #        l.become_dj
      #        room.say("'#{l.name}' has become a dj.")
      #      rescue Exception => e
      #        room.say("djMagic / Listener - #{l.name}")
      #        room.say(e.to_s)
      #      end
      #    end
      #  }
      #end
      puts "djMagic - success"
      #room.say("djMagic - success")
      #@@localLog.debug("djMagic - success")
    rescue Exception => e
      #@@localLog.debug("djMagic")
      #@@localLog.debug(e.to_s)
      room.say("djMagic - failed")
      room.say(e.to_s)
      puts "djMagic - failed"
      puts e.to_s
      raise e
    end
  end

  def attemptVote(song)
    begin
      @@votesAttempted = @@votesAttempted + 1
      room.say("attemptVote")
      #@@localLog.debug("attemptVote")
      puts "attemptVote"
      if(!@@voted)
        begin
          #room.say("Voting")
          #@@localLog.debug("Voting")
          puts "Voting"
          song.vote
          @@votesCounted = @@votesCounted + 1
          @@voted = true
          #@@localLog.debug("Voting - success")
          #room.say("Voting - success")
          puts "Voting - success"
        rescue Exception => e
          #@@localLog.debug("Voting - failed")
          #@@localLog.debug(e.to_s)
          #room.say("Voting - failed")
          #room.say(e.to_s)
          puts "Voting - failed"
          puts e.to_s
          raise e
        end
      else
        #@@localLog.debug("Already Voted.")
        room.say("Voting - done")
        puts "Voting - done"
      end
      #c.room.current_dj.remove_as_dj
      #room.say("Now we have no djs. (better add some.")
      #begin
      #  dj_cap = c.roomm.dj_capacity
      #  djs =  c.room.djs
      #  openSpots = dj_cap - djs
      #  if (openSpots > 0)
      #    #room.listeners.each{
      #    #    |l|
      #    #  begin
      #    #    l.room.become_dj
      #    #    room.say(l.name._to_s)
      #    #  rescue Exception => e
      #    #    room.say("failled 2 vote")
      #    #    room.say(e.to_s)
      #    #  end
      #    #}
      #  end
      #rescue Exception => e
      #  room.say("failled 3 vote")
      #  room.say(e.to_s)
      #end
      #@@localLog.debug("attemptVote - success")
      room.say("attemptVote - success")
      puts "attemptVote - success"
    rescue Exception => e
      @@votesFailed = @@votesFailed + 1
      #@@localLog.debug("attemptVote - failed")
      #@@localLog.debug(e.to_s)
      room.say("attemptVote - failed")
      #room.say(e.to_s)
      puts "attemptVote - failed"
      puts e.to_s
      raise e
    end
  end

  on :song_started do |song|
    #@@localLog.debug("Resetting Switch #{@@voted}")
    #room.say("Resetting Switch f#{@@voted}")
    puts "Resetting Switch #{@@voted}"
    @@voted = false
    #@@localLog.debug("Resetting Switch #{@@voted}")
    #room.say("Resetting Switch #{@@voted}")
    puts "Resetting Switch #{@@voted}"
    if (song.played_by.name == "pwn bot")
      c.room.current_dj.remove_as_dj
    end
    begin
      #room.say("song_started")
      puts "song_started"
      #@@localLog.debug("song_started")
      attemptVote(song)
      #room.say("song_started - success")
      puts "song_started - success"
      #@@localLog.debug("song_started - success")
      @@fromStart = @@fromStart + 1
      #djMagic()
    rescue Exception => e
      #@@localLog.debug("song_started - failed")
      #@@localLog.debug(e.to_s)
      #room.say("song_started - failed")
      #room.say(e.to_s)
      puts "song_started - failed"
      puts e.to_s
      @@fromStartFail = @@fromStartFail + 1
    end
  end


  on :song_ended do |song|
    begin
      room.say("song_ended")
      puts "song_ended"
      #@@localLog.debug("song_ended")
      attemptVote(song)
      room.say("song_ended - success")
      puts "song_ended - success"
      #@@localLog.debug("song_ended - success")
      @@fromEnd = @@fromEnd + 1
      #djMagic()
    rescue Exception => e
      #@@localLog.debug("song_ended - failed")
      #@@localLog.debug(e.to_s)
      room.say("song_ended - failed")
      room.say(e.to_s)
      puts "song_ended - failed"
      puts e.to_s
      @@fromEndFail = @@fromEndFail + 1
    end
  end

  on :song_voted do |song|
    if (song.votes[-1].user.name.to_s == "pwn bot")
      room.say("Voting Insurance Policy")
      @@voted = true
      #begin
      #
      #end
      #djMagic()
    end
  end

  on :dj_removed do |song|
    begin
      room.say("dj_removed")
      c.room.become_dj
      #@@localLog.debug("dj_removed - failed")
      #@@localLog.debug(e.to_s)
      room.say("dj_removed - success")
      puts "dj_removed - success"
    rescue Exception => e
      #@@localLog.debug("dj_removed - failed")
      #@@localLog.debug(e.to_s)
      room.say("dj_removed - failed")
      room.say(e.to_s)
      puts "dj_removed - failed"
      puts e.to_s
    end
  end

  on :user_spoke do |message|
    rando = 10.times.map{ 20 + Random.rand(11) }[0]
    if (message.content == "ult-boot")
      room.say("#winning #{rando}")
      c.room.current_dj.remove_as_dj
    end

    if (message.content == "ult-stats")
      room.say("attempts #{@@votesAttempted}")
      room.say("counted #{@@votesCounted}")
      room.say("failed #{@@votesFailed}")
      #room.say("on_vote #{@@fromVote}")
      #room.say("on_vote_fail #{@@fromVoteFail}")
      room.say("on_end #{@@fromEnd}")
      room.say("on_end_fail #{@@fromEndFail}")
      room.say("on_start #{@@fromStart}")
      room.say("on_start_fail #{@@fromStartFail}")
    end

    if (message.content == "ult-bot-vote")
      room.say("Manual Bot Vote")
      begin
        if (!@@voted)
          room.current_song.vote
          room.say("Manual Bot Vote - Success")
          @@voted = true
          begin
            @@fromManual = @@fromManual + 1
            djMagic()
          rescue Exception => e
            puts "djMagic - Failed"
            puts e.to_s
            @@fromManualFail = @@fromManualFail + 1
          end
        else
          room.say("Manual Bot Vote - Already Voted.")
        end
      rescue Exception => e
        room.say("Manual Bot Vote - Failed ? switch = '#{@@voted}'")
        room.say(e.to_s)
      end
    end

    if (message.content == "ult-list")
      room.say("List Testing")
      begin
        new_liss = []
        room.listeners.each{
            |l|
          new_liss.push(l.name)
        }
        room.say("Listeners => #{new_liss}")
      rescue Exception => e
        room.say("List Testing - Failed")
        room.say(e.to_s)
      end
    end

  end

=begin
  on :message_received do  |msg|
    puts "winnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnnerwinnner"
    puts msg
    puts msg.class.name
  end
=end

  #rescue Exception => e

  #end
end