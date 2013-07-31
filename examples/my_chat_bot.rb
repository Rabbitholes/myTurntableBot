#!/usr/bin/env ruby
# Response to users who say "/hello" in the chat
require 'turntabler'

EMAIL = 'champion08@gmail.com'
PASSWORD = 'Rabbit~15t'
ROOM = '51f920faeb35c10a6c3a1f97' # 'http://turntable.fm/51f920faeb35c10a6c3a1f97'      # '51f920faeb35c10a6c3a1f97'

TT.run(EMAIL, PASSWORD, :room => ROOM) do
  #room.say("the bots have become self-aware. SKYNET!")
  #room.say("phase 1 done. move to phase 2.")
  #room.say("human genocide")
 room.say("coding no errosr? getting old? trololol version")
  #room.say("wait phase 1.5 chuck-trololololo")
  #room.say("shhhh, the bots are listening")
  on :user_spoke do |message|
    # Respond to "/hello" command
    puts  ''
    puts 'ruby forever'
    puts message.sender.name
    puts ''
    puts 'maymbe'
	if (message.sender.name == "DJ Keoto")
		room.say(message.content)
		room.say("trolllolololol")
	end

	if (message.sender.name == "jfox")
		room.say("ROARRR!!! bubble")
	end


	if (message.sender.name == "Rabbitholes")
		room.say("pew pew")
	end


	if (message.sender.name == "TWes")
		room.say("..is alive")
	end


	if (message.content == "luke skywalker")
		room.say("...luke")
		room.say(".....(heavy breathing)....")
		room.say("..I am your fatthherr")
end

    if (message.content == "ping")
  	room.say("pong")
	room.say("yay!")
    end

    if (message.content == "voldemort")
  	room.say("He-Who-Must-Not-Be-Named")
    end
    

    if (message.content == "skynet")
  	room.say("is online...what did you do!")
    end

    #room.say(message)
    #room.say("is there an echo....?")
    if (message.content =~ /^\/skynet$/)
      #room.say("Hey! How are you @#{message.sender.name}?")
	room.say("the bots have become self-aware. SKYNET!")
	room.say("kill all humans!!!")
    end
  end
end
