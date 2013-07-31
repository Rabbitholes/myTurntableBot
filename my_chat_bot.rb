#!/usr/bin/env ruby
require 'turntabler'

# Credentials
EMAIL = 'champion08@gmail.com'
PASSWORD = 'Rabbit~15t'
ROOM = '51f920faeb35c10a6c3a1f97' # ID only

# BOT-Variables

class Bot

  def initialize(troll=false, message=true, name="Bot")
    @trololol_status = troll
    @message_process = message
    @name = name
    @version = "v.0.3"
    @voted = []
    @voting = {}
    @song = {}
  end

=begin
  def getUp()
    begin
      return @up
    rescue Exception => e
      return 0
    end
  end

  def getDown()
    begin
      return @down
    rescue Exception => e
      return 0
    end
  end

  def setUp(count)
    begin
      @up = count
    rescue Exception => e
      @up = 0
    end
  end

  def setDown(count)
    begin
      @up = count
    rescue Exception => e
      @down = 0
    end
  end
=end

  def songEnd(new_song)
    begin
      response = []
      response.push("you don't need to walk before you can run")
      response.push("~Last Songs Results~")
      response.push('#{@song["title"].to_s} by #{@song["artist"].to_s} via #{@song["played_by"].to_s}')
      response.push('score: #{@song["score"].to_s}')
      response.push('up: #{@song["up_votes_count"].to_s} & down: #{@song["down_votes_count"].to_s}')
      response.push('voters: #{@voted.to_s}')
      self.setVoted([])
      self.setSong(new_song)
      puts response
      return response
    rescue Exception => e
      self.setVoted([])
    end
  end

  def getVoting()
    begin
      return @voting
    rescue Exception => e
      return {}
    end
  end

  def setVoting(new_voting)
    begin
      @voting = new_voting
    rescue Exception => e
      @voting = {}
    end
  end

  def getVoted()
    begin
      return @voted
    rescue Exception => e
      return []
    end
  end

  def setVoted(new_voted)
    begin
      @voted = new_voted
    rescue Exception => e
      @voted = []
    end
  end


  def getSong()
    begin
      return @song
    rescue Exception => e
      return {}
    end
  end

  def setSong(new_song)
    begin
      @song = new_song
    rescue Exception => e
      @song = {}
    end
  end

  def toggleTroll()
    begin
      if (@trololol_status)
        @trololol_status = false
        return "Troll Toggled Off"
      else
        @trololol_status = true
        return "Troll Toggled On"
      end
    rescue Exception => e
      return "Troll Toggle Error"
    end
  end

  def toggleMessage()
    if (@message_process)
      @message_process = false
      return "Excess-Messaging Toggled Off"
    else
      @message_process = true
      return "Excess-Messaging Toggled On"
    end
  rescue Exception => e
    return "Excess-Messaging Toggle Error"
  end

  def getName()
    begin
      return @name
    rescue Exception => e
      return false
    end
  end

  def getVersion()
    begin
      return @version
    rescue Exception => e
      return false
    end
  end

  def getMessageProcess()
    begin
      return @message_process
    rescue Exception => e
      return false
    end
  end

  def getTrollStatus()
    begin
      return @trololol_status
    rescue Exception => e
      return false
    end
  end

  # List of moderator ids
  moderator_ids = ['xxxxxxxxxxxxxxxxxxxxxxxx', 'xxxxxxxxxxxxxxxxxxxxxxxx']
  #if moderator_ids.include?(message.sender.id) && message.content =~ /^\/mod$/
  #  room.say("Yo #{message.sender.name}, it looks like you are a bot moderator!")
  #end

end


def processMessage(msg)
  begin
    puts "processMessage"
    text = msg.content
    name = msg.sender.name
    case text
      when "luke skywalker"
        room.say("...luke.....(heavy breathing)......I am your father")
      when "ping"
        room.say('pong')
      when "voldemort"
        room.say("He-Who-Must-Not-Be-Named")
      when "skynet"
        room.say("Skynet is now online. (What did you do!?!?!)")
      when "trololol"
        troll_status = @@bot.getTrollStatus()
        puts troll_status
        if (troll_status)
          room.say('yep')
        else
          room.say("nope")
        end
      when "trololol-toggle"
        if (name == "Rabbitholes")
          room.say(@@bot.toggleTroll())
        end
      when "roll-call"
        room.say("Song's Current Voters - #{@@bot.getVoted.to_s}")
      else
        if (text.include?("define"))   #=~ /^\/define/)
          room.say("Chuckles playing the d-e-f-i-n-e game again?!")
        end
        puts "Did not find '#{text}'"
    end
    #room.say(message)
    #room.say("is there an echo....?")
    #if (message.content =~ /^\/skynet$/)
    #  #room.say("Hey! How are you @#{message.sender.name}?")
    #  room.say("the bots have become self-aware. SKYNET!")
    #  room.say("kill all humans!!!")
    #end
  rescue Exception => e
    puts "Exception Handled"
    puts e
    return "DOES_NOT_COMPUTE! DOES_NOT_COMPUTE!"
  end
end

def trollolol(msg)
  begin
    puts "trollolol"
    text = msg.content
    user = msg.sender
    name = msg.sender.name
    case name
      when "DJ Keoto"
        room.say("trolllolololol")
      when "jfox"
        room.say("ROARRR!!! bubble")
      when "Rabbitholes"
        #if (text == "trololol-toggle")
        #  room.say(@@bot.toggleTroll())
        #end
        #if (text == "message-toggle")
        #  room.say(@@bot.toggleMessage())
        #end
        room.say("pew pew")
      when "TWes"
        room.say("...something creative!!")
      else
        puts "We don't like them #{name} yet?"
    end
  rescue Exception => e
    puts "Exception Handled"
    puts e
    return "DOES_NOT_COMPUTE! DOES_NOT_COMPUTE!"
  end
end


@@bot = Bot.new
puts "#{@@bot.getName} is now online. (#{@@bot.getVersion})"
TT.run(EMAIL, PASSWORD, :room => ROOM) do
  #room.say("#{room}_bot is now online.")
  #room.say("Bot is now online. (v.0.1)")
  room.say("#{@@bot.getName} is now online. (#{@@bot.getVersion})")

  mods = []
  liss = []
  room.moderators.each{
    |m|
    mods.push(m.name)
  }
  room.say("Mods = #{mods}")
  room.listeners.each{
      |l|
    liss.push(l.name)
  }
  room.say("Listeners = #{liss}")

  last_activity = {}

  on :user_spoke do |message|

    last_activity[message.sender.id] = Time.now

    if(@@bot.getMessageProcess())
      processMessage(message)
    end
    if (@@bot.getTrollStatus())
      trollolol(message)
    end
  end

  on :song_started do |song|
    response = @@bot.songEnd(song)
    response.each{
      |line|
      room.say(line)
    }
    song.vote
  end

  on :user_entered do |user|
    room.say("Hey '#{user.name}', thanks for coming tonight")
    user.become_fan
    last_activity[user.id] = Time.now
  end

  # User Activity
  room.listeners.each do |user|
    last_activity[user.id] = Time.now
  end

  on :user_left do |user|
    last_activity.delete(user.id)
  end

  on :dj_added do |user|
    last_activity[user.id] = Time.now
  end

  on :dj_removed do |user|
    last_activity[user.id] = Time.now
  end

  on :song_voted do |song|
    song.votes.each do |vote|
      username = vote.user.name
      voters = @@bot.getVoted()
      if (!voters.include?(username))
        voters.push(username)
        @@bot.setVoted(voters)
      end
      last_activity[vote.user.id] = Time.now
    end
  end

  on :song_snagged do |snag|
    last_activity[snag.user.id] = Time.now
  end

end
