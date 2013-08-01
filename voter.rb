#!/usr/bin/env ruby
require 'turntabler'

# Credentials
EMAIL = 'matthew.s.schmitz@espn.com'
PASSWORD = 'rabbit~15t'
ROOM = '51f920faeb35c10a6c3a1f97' # ID only

TT.run(EMAIL, PASSWORD, :room => ROOM) do |c|
  c.room.become_dj
  room.say("Voter has become a dj!!!")
  room.say("tigers-blood")


  on :song_started do |song|
    room.say("ruby")
    song.vote
    room.say("mnot very thread safe by efualt")
  end
end
