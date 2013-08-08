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

# Gather Bot Id & Insert
ARGV.each do|a|
  puts "Argument: #{a}"
  @bot_id = a.to_i
  @@bot_EMAIL = 'spawnbot' + @bot_id.to_s + '@sb.gme'
  @@bot_PASSWORD = 'spawnbot' + @bot_id.to_s
end

# Invoke
puts "again"
puts @@bot_EMAIL
puts @@bot_PASSWORD

TT.run(@@bot_EMAIL, @@bot_PASSWORD, :room => @@bot_ROOM) do |c|
    room.say("#{@@bot_EMAIL} is online.")
    room.say("auto-boot")
    length = c.room.current_song.length.to_s
    played = c.room.current_song.seconds_played.to_s
    room.say("length #{length}")
    room.say("played #{played}")
    room.say("wat")
    
    exit
    return
    break

    #    c.user.avatars.each{
        #|av|
        #room.say(av)
        #}


end
