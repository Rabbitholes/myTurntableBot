#!/usr/bin/env ruby
require 'turntabler'

@@botId = ""
#@@localLog = Logger.new('ultimate.log', 0, 100 * 1024 * 1024)

# Credentials
@@bot_id = 0
@@bot_EMAIL = 'default_email'
@@bot_PASSWORD = 'default_password'
@@bot_ROOM = '51f920faeb35c10a6c3a1f97'
#@@bot_ROOM = '52015fb6eb35c109d87e7ec3'

# Variables

@@votesAttempted = 0
@@votesCounted = 0
@@votesFailed = 0

@@control = false

@@modInt = 0

# Gather Bot Id & Insert
ARGV.each do|a|
  puts "Argument: #{a}"
  @bot_id = a.to_i
  @@bot_EMAIL = 'spawnbot' + @bot_id.to_s + '@sb.gme'
  @@bot_PASSWORD = 'spawnbot' + @bot_id.to_s
  @@modInt = (a.to_i) % 2
end

# Invoke
puts "again"
puts @@bot_EMAIL
puts @@bot_PASSWORD

TT.run(@@bot_EMAIL, @@bot_PASSWORD, :room => @@bot_ROOM) do |c|
  room.say("#{@@bot_EMAIL} is online.")
    
    avLength = c.user.avatars.length
    #rando = 10.times.map{ 20 + Random.rand(11) }[0]
    avRanNum = Random.rand(avLength)
    #room.say(avLength.to_s)
    #room.say(avRanNum.to_s)
    c.user.avatars[avRanNum].set
    #room.say("av randomized")
    #    c.user.avatars.each{
        #|av|
        #room.say(av)
        #}
    
  def attemptVote(song, direction="up")
    begin
    
      @@votesAttempted = @@votesAttempted + 1
      puts "Voting"
      if(direction == "down")
          song.vote(:down)
      else
          song.vote
      end
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
    if (message.content == @@bot_EMAIL)
      room.say("attempts #{@@votesAttempted}")
      room.say("counted #{@@votesCounted}")
      room.say("failed #{@@votesFailed}")
    end

    if (message.content == "one-ring-to-rule-them-all")
        if (message.sender.name.to_s == "Rabbitholes" || message.sender.name.to_s == "cathyisawesome")
            if (@@control)
                @@control = false
                #return "The power must've been to great..."
            else
                @@control = true
                #return "...And he does not share power."
            end
        end
    end

    if (!@@control)
        if (message.content == "spawn-vote")
          begin
            attemptVote(room.current_song)
          rescue Exception => e
            puts e
          end
        end

        if (message.content == "spawn-vote #{@@modInt}")
          begin
            attemptVote(room.current_song)
          rescue Exception => e
            puts e
          end
        end
    end    
  end
    on :song_voted do |song|
        if (@@control)
            if (song.votes[-1].user.name.to_s == "Rabbitholes" || song.votes[-1].user.name.to_s == "cathyisawesome")
                #room.say(user.name.to_s)
                #room.say(song.votes[-1].to_s)
                attemptVote(room.current_song, song.votes[-1].to_s)
            end
        end
    end

end
