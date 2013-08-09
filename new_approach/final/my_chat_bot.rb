#!/usr/bin/env ruby
require 'turntabler'

# Credentials
EMAIL = 'schmimae@uni.edu'
PASSWORD = 'rabbit~15t'
ROOM = '51f920faeb35c10a6c3a1f97' # ID only
#ROOM = '52015fb6eb35c109d87e7ec3' 
# BOT
# ~personal class to keep information / do functions the API does not support/persists
class Bot
  def initialize(troll=false, message=true, name="Master-Bot")
    @trololol_status = troll
    @message_process = message
    @name = name
    @version = "v.1.0"
    @voted = []
    @voting = {}
    @song = {}
    @mods = []
    @liss = []
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

  def getMods()
    begin
      return @mods
    rescue Exception => e
      return []
    end
  end

  def setMods(mods)
    begin
      @mods = mods
    rescue Exception => e
      return []
    end
  end

  def getLiss()
    begin
      return @liss
    rescue Exception => e
      return []
    end
  end

  def setLiss(liss)
    begin
      @liss = liss
    rescue Exception => e
      return []
    end
  end
end

def processMessage(msg)
  begin
    puts "processMessage"
    text = msg.content
    name = msg.sender.name
    case text
      when "om nom nom"
        room.say("'C' is for cookiee!")
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
        #room.say("Song's Current Voters - #{@@bot.getVoted.to_s}")
        room.say("Vote Count = #{@@bot.getVoted.length}")
      when "mine"
          homie_id = msg.sender.id.to_s
          if (@@homies.has_key?(homie_id))
            room.say("Master Bot has voted #{@@homies[homie_id].to_i} times for '#{msg.sender.name.to_s}'")
          else
            room.say("Sorry homie... we don't have any vote information for you.")
          end
      when "bot-votes"
          room.say("Total_Votes => #{@@vote_count}")
      when "cathy"
          room.say("^ is awesome")
      when "babe"
        if (name == "Rabbitholes")
          room.say("^'cathy' is awesome")
        end
      # wow emotes
      when "/agree"
        room.say("You agree.You agree with Dr.Mundo.")
      when "/amaze"
        room.say("You are amazed!	 You are amazed by Dr.Mundo.")
      when "/angry"
        room.say("You raise your fist in anger.	 You raise your fist in anger at Dr.Mundo.")
      when "/apologize"
        room.say("You apologize to everyone. Sorry!	 You apologize to Dr.Mundo. Sorry!")
      when "/applaud"
        room.say("cheers! horray!")
      when "/applause"
        room.say("You applaud. Bravo!	 You applaud at Dr.Mundo. Bravo!")
      when "/attacktarget"
        room.say("You tell everyone to attack something.	 You tell everyone to attack Dr.Mundo.")
      when "/bark"
        room.say("You bark. Woof woof!	 You bark at Dr.Mundo")
      when "/bashful"
        room.say("You are bashful.	 You are so bashful...too bashful to get Dr.Mundo's attention.")
      when "/beckon"
        room.say("You beckon everyone over to you.	 You beckon Dr.Mundo over.")
      when "/beg"
        room.say("You beg everyone around you. How pathetic.	 You beg Dr.Mundo. How pathetic.")
      when "/belch"
        room.say("You let out a loud belch.	 You burp rudely in Dr.Mundo's face.")
      when "/bite"
        room.say("You look around for someone to bite.	 You bite Dr.Mundo. Ouch!")
      when "/bleed"
        room.say("I am actually going to die")
      when "/blood"
        room.say("Blood oozes from your wounds.")
      when "/blink"
        room.say("You blink your eyes.	 You blink at Dr.Mundo.")
      when "/blow"
        room.say("You blow a kiss into the wind.	 You blow a kiss to Dr.Mundo.")
      when "/blush"
        room.say("You blush.	 You blush at Dr.Mundo.")
      when "/boggle"
        room.say("You boggle at the situation.	 You boggle at Dr.Mundo.")
      when "/bonk"
        room.say("You bonk yourself on the noggin. Doh!	 You bonk Dr.Mundo on the noggin. Doh!")
      when "/bored"
        room.say("You are overcome with boredom. Oh the drudgery!	 You are terribly bored with Dr.Mundo.")
      when "/bounce"
        room.say("You bounce up and down.	 You bounce up and down in front of Dr.Mundo.")
      when "/bow"
        room.say("You bow down graciously.	 You bow before Dr.Mundo.")
      when "/bravo"
        room.say("You applaud. Bravo!	 You applaud at Dr.Mundo. Bravo!")
      when "/brb"
        room.say("You let everyone know you'll be right back	 You let Dr.Mundo know you'll be right back.")
      when "/burp"
        room.say("You let out a loud belch.	 You burp rudely in Dr.Mundo's face.")
      when "/bye"
        room.say("You wave goodbye to everyone. Farewell!	 You wave goodbye to Dr.Mundo. Farewell!")
      when "/cackle"
        room.say("You cackle maniacally at the situation.	 You cackle maniacally at Dr.Mundo.")
      when "/calm"
        room.say("You remain calm.	 You try to calm Dr.Mundo down.")
      when "/cat"
        room.say("meow")
      when "/catty"
        room.say("You sratch yourself. Ah, much better!	 You scratch Dr.Mundo. How catty!")
      when "/charge"
        room.say("You start to charge.	")
      when "/cheer"
        room.say("You cheer!	 You cheer at Dr.Mundo.")
      when "/chew"
        room.say("You begin to eat.	 You begin to eat in front of Dr.Mundo.")
      when "/chicken"
        room.say("With arms flapping, you strut around. Cluck, Cluck, Chicken!	 With arms flapping, you strut around Dr.Mundo. Cluck, Cluck, Chicken!")
      when "/chuckle"
        room.say("You let out a hearty chuckle.	 You chuckle at Dr.Mundo.")
      when "/clap"
        room.say("You clap ecitedly.	 You clap ecitedly for Dr.Mundo.")
      when "/cold"
        room.say("You let everyone know that you are cold.	 You let Dr.Mundo know that you are cold.")
      when "/comfort"
        room.say("You need to be comforted.	 You comfort Dr.Mundo.")
      when "/commend"
        room.say("You commend everyone on a job well done.	 You commend Dr.Mundo on a job well done.")
      when "/confused"
        room.say("You are hopelessly confused.	 You look at Dr.Mundo with a confused look.")
      when "/congrats"
        room.say("Clap. WOOT WOOT!")
      when "/congratulate"
        room.say("You congratulate everyone around you.	 You congratulate Dr.Mundo.")
      when "/cough"
        room.say("You let out a hacking cough.	 You cough at Dr.Mundo.")
      when "/cower"
        room.say("You cower in fear.	 You cower in fear at the sight of Dr.Mundo.")
      when "/crack"
        room.say("You crack your knuckles.	 You crack your knuckles while staring at Dr.Mundo.")
      when "/cringe"
        room.say("You cringe in fear.	 You cringe away from Dr.Mundo.")
      when "/cry"
        room.say("You cry.	 You cry on Dr.Mundo's shoulder.")
      when "/cuddle"
        room.say("You need to be cuddled.	 You cuddle up against Dr.Mundo.")
      when "/curious"
        room.say("You epress your curiosity to those around you.	 You are curious what Dr.Mundo is up to.")
      when "/curtsey"
        room.say("You curtsey.	 You curtsey before Dr.Mundo.")
      when "/dance"
        room.say("You burst into dance.	 You dance with Dr.Mundo.")
      when "/disappointed"
        room.say("I am always disapoointed.")
      when "/disappointment"
        room.say("You frown.	 You frown with disappointment at Dr.Mundo.")
      when "/doh"
        room.say("You bonk yourself on the noggin. Doh!	 You bonk Dr.Mundo on the noggin. Doh!")
      when "/doom"
        room.say("You threaten everyone with the wrath of doom.	 You threaten Dr.Mundo with the wrath of doom.")
      when "/drink"
        room.say("You raise a drink in the air before chugging it down. Cheers!	 You raise a drink to Dr.Mundo. Cheers!")
      when "/drool"
        room.say("A tendril of drool runs down your lip.	 You look at Dr.Mundo and begin to drool.")
      when "/duck"
        room.say("You duck for cover.	 You duck behind Dr.Mundo.")
      when "/eat"
        room.say("You begin to eat.	 You begin to eat in front of Dr.Mundo.")
      when "/ecited"
        room.say("You talk ecitedly with everyone.	 You talk ecitedly with Dr.Mundo.")
      when "/eye"
        room.say("You cross your eyes.	 You eye Dr.Mundo up and down.")
      when "/facepalm"
        room.say("You cover your face with your palm.	 You look over at Dr.Mundo and cover your face with your palm.")
      when "/farewell"
        room.say("You wave goodbye to everyone. Farewell!	 You wave goodbye to Dr.Mundo. Farewell!")
      when "/fart"
        room.say("You fart loudly. Whew...what stinks?	 You brush up against Dr.Mundo and fart loudly.")
      when "/fear"
        room.say("You cower in fear.	 You cower in fear at the sight of Dr.Mundo.")
      when "/feast"
        room.say("You begin to eat.	 You begin to eat in front of Dr.Mundo.")
      when "/fidget"
        room.say("You fidget.	 You fidget impatiently while waiting for Dr.Mundo.")
      when "/flap"
        room.say("With arms flapping, you strut around. Cluck, Cluck, Chicken!	 With arms flapping, you strut around Dr.Mundo. Cluck, Cluck, Chicken!")
      when "/flee"
        room.say("You yell for everyone to flee!	You yell for Dr.Mundo to flee!")
      when "/fle"
        room.say("You fle your muscles. Oooooh so strong!	 You fle at Dr.Mundo. Oooooh so strong!")
      when "/flirt"
        room.say("You flirt.	 You flirt with Dr.Mundo.")
      when "/flop"
        room.say("You flop about helplessly.	 You flop about helplessly around Dr.Mundo.")
      when "/followme"
        room.say("You motion for everyone to follow.	 You motion for Dr.Mundo to follow.")
      when "/food"
        room.say("You are hungry!	 You are hungry. Maybe Dr.Mundo has some food...")
      when "/frown"
        room.say("You frown.	 You frown with disappointment at Dr.Mundo.")
      when "/gasp"
        room.say("You gasp.	 You gasp at Dr.Mundo.")
      when "/gaze"
        room.say("You gaze off into the distance.	 You gaze eagerly at Dr.Mundo.")
      when "/giggle"
        room.say("You giggle.	 You giggle at Dr.Mundo.")
      when "/glad"
        room.say("You are filled with happiness!	 You are very happy with Dr.Mundo!")
      when "/glare"
        room.say("You glare angrily.	 You glare angrily at Dr.Mundo.")
      when "/gloat"
        room.say("You gloat over everyone's misfortune.	 You gloat over Dr.Mundo's misfortune.")
      when "/golfclap"
        room.say("You clap half heartedly, clearly unimpressed.	 You clap for Dr.Mundo, clearly unimpressed.")
      when "/goodbye"
        room.say("You wave goodbye to everyone. Farewell!	 You wave goodbye to Dr.Mundo. Farewell!")
      when "/greet"
        room.say("Hi there mate!")
      when "/greetings"
        room.say("You greet everyone warmly.	 You greet Dr.Mundo warmly.")
      when "/grin"
        room.say("You grin wickedly.	 You grin wickedly at Dr.Mundo.")
      when "/groan"
        room.say("You begin to groan.	 You look at Dr.Mundo and groan.")
      when "/grovel"
        room.say("You grovel on the ground, wallowing in subservience.	 You grovel before Dr.Mundo like a subservient peon.")
      when "/growl"
        room.say("You growl menacingly.	 You growl menacingly at Dr.Mundo.")
      when "/guffaw"
        room.say("You let out a boisterous guffaw!	 You take one look at Dr.Mundo and let out a guffaw!")
      when "/hail"
        room.say("You hail those around you.	 You hail Dr.Mundo.")
      when "/happy"
        room.say("You are filled with happiness!	 You are very happy with Dr.Mundo!")
      when "/healme"
        room.say("You call out for healing!	")
      when "/hello"
        room.say("You greet everyone with a hearty hello!	 You greet Dr.Mundo with a hearty hello!")
      when "/helpme"
        room.say("You cry out for help!	")
      when "/hi"
        room.say("You greet everyone with a hearty hello!	 You greet Dr.Mundo with a hearty hello!")
      when "/highfive"
        room.say("You put up your hand for a high five.	 You give Dr.Mundo a high five!")
      when "/hug"
        room.say("You need a hug!	 You hug Dr.Mundo.")
      when "/hungry"
        room.say("You are hungry!	 You are hungry. Maybe Dr.Mundo has some food...")
      when "/impatient"
        room.say("You fidget.	 You fidget impatiently while waiting for Dr.Mundo.")
      when "/incoming"
        room.say("You warn everyone of incoming enemies!	 You point out Dr.Mundo as an incoming enemy!")
      when "/insult"
        room.say("You think everyone around you is a son of a motherless ogre.	 You think Dr.Mundo is the son of a motherless ogre.")
      when "/introduce"
        room.say("You introduce yourself to everyone.	 You introduce yourself to Dr.Mundo.")
      when "/jk"
        room.say("You were just kidding!	 You let Dr.Mundo know that you were just kidding!")
      when "/kiss"
        room.say("You blow a kiss into the wind.	 You blow a kiss to Dr.Mundo.")
      when "/kneel"
        room.say("You kneel down.	 You kneel before Dr.Mundo.")
      when "/knuckles"
        room.say("You crack your knuckles.	 You crack your knuckles while staring at Dr.Mundo.")
      when "/laugh"
        room.say("You laugh.	 You laugh at Dr.Mundo.")
      when "/lavish"
        room.say("You praise the Light.	 You lavish praise upon Dr.Mundo.")
      when "/lay"
        room.say("sleepy")
      when "/laydown"
        room.say("You lie down.	 You lie down before Dr.Mundo.")
      when "/lick"
        room.say("You lick your lips.	 You lick Dr.Mundo.")
      when "/lie"
        room.say("These are not the droids you are looking for.")
      when "/liedown"
        room.say("You lie down.	 You lie down before Dr.Mundo.")
      when "/listen"
        room.say("You are listening!	 You listen intently to Dr.Mundo.")
      when "/lol"
        room.say("You laugh.	 You laugh at Dr.Mundo.")
      when "/lost"
        room.say("You are hopelessly lost.	 You want Dr.Mundo to know that you are hopelessly lost.")
      when "/love"
        room.say("You feel the love.	 You love Dr.Mundo.")
      when "/mad"
        room.say("You raise your fist in anger.	 You raise your fist in anger at Dr.Mundo.")
      when "/massage"
        room.say("You need a massage!	 You massage Dr.Mundo's shoulders.")
      when "/moan"
        room.say("You moan suggestively.	 You moan suggestively at Dr.Mundo.")
      when "/mock"
        room.say("You mock life and all it stands for.	 You mock the foolishness of Dr.Mundo.")
      when "/moo"
        room.say("Tauren only	 Mooooooooooo.	 You moo at Dr.Mundo. Mooooooooooo.")
      when "/moon"
        room.say("You drop your trousers and moon everyone.	 You drop your trousers and moon Dr.Mundo.")
      when "/mountspecial"
        room.say("Rear-up animation for all mounts (including flying). Works only when mounted	")
      when "/mourn"
        room.say("In quiet contemplation, you mourn the loss of the dead.	 In quiet contemplation, you mourn the death of Dr.Mundo.")
      when "/no"
        room.say("You clearly state, NO.	 You tell Dr.Mundo NO. Not going to happen.")
      when "/nod"
        room.say("You nod.	 You nod at Dr.Mundo.")
      when "/nosepick"
        room.say("With a finger deep in one nostril, you pass the time.	 You pick your nose and show it to Dr.Mundo.")
      when "/oom"
        room.say("You announce that you have low mana!")
      when "/openfire"
        room.say("You give the order to open fire.	")
      when "/panic"
        room.say("You run around in a frenzied state of panic.	 You take one look at Dr.Mundo and panic.")
      when "/party"
        room.say("You raise a drink in the air before chugging it down. Cheers!	 You raise a drink to Dr.Mundo. Cheers!")
      when "/pat"
        room.say("You need a pat.	 You gently pat Dr.Mundo.")
      when "/peer"
        room.say("You peer around, searchingly.	 You peer at Dr.Mundo searchingly.")
      when "/peon"
        room.say("You grovel on the ground, wallowing in subservience.	 You grovel before Dr.Mundo like a subservient peon.")
      when "/pest"
        room.say("You shoo the measly pests away.	 You shoo Dr.Mundo away. Be gone pest!")
      when "/pick"
        room.say("With a finger deep in one nostril, you pass the time.	 You pick your nose and show it to Dr.Mundo.")
      when "/pity"
        room.say("You pity those around you.	 You look down upon Dr.Mundo with pity.")
      when "/pizza"
        room.say("You are hungry!	 You are hungry. Maybe Dr.Mundo has some food...")
      when "/plead"
        room.say("You drop to your knees and plead in desperation.	 You plead with Dr.Mundo.")
      when "/point"
        room.say("You point over yonder.	 You point at Dr.Mundo.")
      when "/poke"
        room.say("You poke your belly and giggle.	 You poke Dr.Mundo. Hey!")
      when "/ponder"
        room.say("You ponder the situation.	 You ponder Dr.Mundo's actions.")
      when "/pounce"
        room.say("You pounce out from the shadows.	 You pounce on top of Dr.Mundo.")
      when "/praise"
        room.say("You praise the Light.	 You lavish praise upon Dr.Mundo.")
      when "/pray"
        room.say("You pray to the Gods.	 You say a prayer for Dr.Mundo.")
      when "/purr"
        room.say("You purr like a kitten.	 You purr at Dr.Mundo.")
      when "/puzzled"
        room.say("You are puzzled. What's going on here?	 You are puzzled by Dr.Mundo.")
      when "/question"
        room.say("You want to know the meaning of life.	 You question Dr.Mundo.")
      when "/raise"
        room.say("You raise your hand in the air.	 You look at Dr.Mundo and raise your hand.")
      when "/rasp"
        room.say("You make a rude gesture.	 You make a rude gesture at Dr.Mundo.")
      when "/rdy"
        room.say("yep im ready...pull already")
      when "/ready"
        room.say("You let everyone know that you are ready!	 You let Dr.Mundo know that you are ready!")
      when "/rear"
        room.say("You shake your rear.	 You shake your rear at Dr.Mundo.")
      when "/roar"
        room.say("You roar with bestial vigor. So fierce!	 You roar with bestial vigor at Dr.Mundo. So fierce!")
      when "/rofl"
        room.say("You roll on the floor laughing.	 You roll on the floor laughing at Dr.Mundo.")
      when "/rude"
        room.say("You make a rude gesture.	 You make a rude gesture at Dr.Mundo.")
      when "/salute"
        room.say("You stand at attention and salute.	 You salute Dr.Mundo with respect.")
      when "/scared"
        room.say("You are scared!	 You are scared of Dr.Mundo.")
      when "/scratch"
        room.say("You scratch yourself. Ah, much better!	 You scratch Dr.Mundo. How catty!")
      when "/sey"
        room.say("You're too sey for your tunic...so sey it hurts.	 You think Dr.Mundo is a sey devil.")
      when "/shake"
        room.say("You shake your rear.	 You shake your rear at Dr.Mundo.")
      when "/shimmy"
        room.say("You shimmy before the masses.	 You shimmy before Dr.Mundo.")
      when "/shindig"
        room.say("You raise a drink in the air before chugging it down. Cheers!	 You raise a drink to Dr.Mundo. Cheers!")
      when "/shiver"
        room.say("You shiver in your boots. Chilling!	 You shiver beside Dr.Mundo. Chilling!")
      when "/shoo"
        room.say("You shoo the measly pests away.	 You shoo Dr.Mundo away. Be gone pest!")
      when "/shrug"
        room.say("You shrug. Who knows?	 You shrug at Dr.Mundo. Who knows?")
      when "/shy"
        room.say("You smile shyly.	 You smile shyly at Dr.Mundo.")
      when "/sigh"
        room.say("You let out a long, drawn-out sigh.	 You sigh at Dr.Mundo.")
      when "/silly"
        room.say("You tell a joke.	 You tell Dr.Mundo a joke.")
      when "/slap"
        room.say("You slap yourself across the face. Ouch!	 You slap Dr.Mundo across the face. Ouch!")
      when "/sleep"
        room.say("You fall asleep. Zzzzzzz.	 You fall asleep. Zzzzzzz.")
      when "/smell"
        room.say("You smell the air around you. Wow, someone stinks!	 You smell Dr.Mundo. Wow, someone stinks!")
      when "/smile"
        room.say("You smile.	 You smile at Dr.Mundo.")
      when "/smirk"
        room.say("A sly smirk spreads across your face.	 You smirk slyly at Dr.Mundo.")
      when "/snarl"
        room.say("You bare your teeth and snarl.	 You bare your teeth and snarl at Dr.Mundo.")
      when "/snicker"
        room.say("You quietly snicker to yourself.	 You snicker at Dr.Mundo.")
      when "/sniff"
        room.say("You sniff the air around you.	 You sniff Dr.Mundo.")
      when "/snub"
        room.say("You snub all of the lowly peons around you.	 You snub Dr.Mundo.")
      when "/sob"
        room.say("You cry.	 You cry on Dr.Mundos shoulder.")
      when "/soothe"
        room.say("You need to be soothed.	 You soothe Dr.Mundo. There, there...things will be ok.")
      when "/sorry"
        room.say("You apologize to everyone. Sorry!	 You apologize to Dr.Mundo. Sorry!")
      when "/spit"
        room.say("You spit on the ground.	 You spit on Dr.Mundo.")
      when "/spoon"
        room.say("You need to be cuddled.	 You cuddle up against Dr.Mundo.")
      when "/stare"
        room.say("You stare off into the distance.	 You stare Dr.Mundo down.")
      when "/stink"
        room.say("You smell the air around you. Wow, someone stinks!	 You smell Dr.Mundo. Wow, someone stinks!")
      when "/strong"
        room.say("You fle your muscles. Oooooh so strong!	 You fle at Dr.Mundo. Oooooh so strong!")
      when "/strut"
        room.say("With arms flapping, you strut around. Cluck, Cluck, Chicken!	 With arms flapping, you strut around Dr.Mundo. Cluck, Cluck, Chicken!")
      when "/surprised"
        room.say("You are so surprised!	 You are surprised by Dr.Mundo's actions.")
      when "/surrender"
        room.say("You surrender to your opponents.	 You surrender before Dr.Mundo. Such is the agony of defeat...")
      when "/talk"
        room.say("You talk to yourself since no one else seems interested	 You want to talk things over with Dr.Mundo")
      when "/talke"
        room.say("You talk ecitedly with everyone	 You talk ecitedly with Dr.Mundo")
      when "/talkq"
        room.say("You want to know the meaning of life.	 You question Dr.Mundo.")
      when "/tap"
        room.say("You tap your foot. Hurry up already!	 You tap your foot as you wait for Dr.Mundo.")
      when "/taunt"
        room.say("You taunt everyone around you. Bring it fools!	 You make a taunting gesture at Dr.Mundo. Bring it!")
      when "/tease"
        room.say("You are such a tease.	 You tease Dr.Mundo.")
      when "/thank"
        room.say("Your welcome")
      when "/thanks"
        room.say("thank everyone around you.	 You thank Dr.Mundo.")
      when "/thirsty"
        room.say("You are so thirsty. Can anyone spare a drink?	 You let Dr.Mundo know you are thirsty. Spare a drink?")
      when "/threat"
        room.say("Better not in today's times.")
      when "/threaten"
        room.say("I will squash you into jelly! You threaten everyone with the wrath of doom.	 You threaten Dr.Mundo with the wrath of doom.")
      when "/tickle"
        room.say("You want to be tickled. Hee hee!	 You tickle Dr.Mundo. Hee hee!")
      when "/tired"
        room.say("You let everyone know that you are tired.	 You let Dr.Mundo know that you are tired.")
      when "/train"
        room.say(Choo Choo Train" animation and sound	")
      when "/ty"
        room.say("You thank everyone around you.	 You thank Dr.Mundo.")
      when "/veto"
        room.say("You veto the motion on the floor.	 You veto Dr.Mundo's motion.")
      when "/victory"
        room.say("You bask in the glory of victory.	 You bask in the glory of victory with Dr.Mundo.")
      when "/violin"
        room.say("You begin to play the world's smallest violin.	 You play the world's smallest violin for Dr.Mundo.")
      when "/volunteer"
        room.say("You raise your hand in the air.	 You look at Dr.Mundo and raise your hand.")
      when "/wait"
        room.say("You ask everyone to wait.	Dr.Mundo asks Dr.Mundo to wait.")
      when "/wave"
        room.say("You beckon everyone over to you.	 You wave at Dr.Mundo.")
      when "/weep"
        room.say("You cry.	 You cry on Dr.Mundo's shoulder.")
      when "/welcome"
        room.say("You welcome everyone.	 You welcome Dr.Mundo.")
      when "/whine"
        room.say("You whine pathetically.	 You whine pathetically at Dr.Mundo.")
      when "/whistle"
        room.say("You let forth a sharp whistle.	 You whistle at Dr.Mundo.")
      when "/wicked"
        room.say("mhuhahaha")
      when "/wickedly"
        room.say("You grin wickedly.	 You grin wickedly at Dr.Mundo.")
      when "/wink"
        room.say("You wink slyly.	 You wink slyly at Dr.Mundo.")
      when "/woot"
        room.say("You cheer!	 You cheer at Dr.Mundo.")
      when "/work"
        room.say("You begin to work.	 You work with Dr.Mundo.")
      when "/wrath"
        room.say("You threaten everyone with the wrath of doom.	 You threaten Dr.Mundo with the wrath of doom.")
      when "/yawn"
        room.say("You yawn sleepily.	 You yawn sleepily at Dr.Mundo.")
      when "/yay"
        room.say("You are filled with happiness!	 You are very happy with Dr.Mundo!")
      when "/yes"
        room.say("You nod.	 You nod at Dr.Mundo.")
      when "/yw"
        room.say("You were happy to help.	 You were happy to help Dr.Mundo.")
      else
        if (text.include?("define"))   #=~ /^\/define/)
          room.say("Chuckles playing the d-e-f-i-n-e game again?!")
        end
        puts "Did not find '#{text}'"
    end
  rescue Exception => e
    puts "Exception Handled"
    puts e
    room.say("DOES_NOT_COMPUTE! DOES_NOT_COMPUTE!")
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
        room.say("pew pew")
      when "cathyisawesome"
        room.say("pQew peQew")
      when "Dascarecrow"
        room.say("/wrists")
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

# Global Variables
@@vote_count = 1
@@homies = {}
@@last_activity = {}

@@bot = Bot.new
puts "#{@@bot.getName} is now online. (#{@@bot.getVersion})"

TT.run(EMAIL, PASSWORD, :room => ROOM) do |c|
  room.say("#{@@bot.getName} is now online. (#{@@bot.getVersion})")
  # Load Mods/Listeners
  new_mods = []
  room.moderators.each{
    |m|
    new_mods.push(m.name)
  }
  @@bot.setMods(new_mods)
  new_liss = []
  room.listeners.each{
      |l|
    new_liss.push(l.name)
  }
  @@bot.setLiss(new_liss)
  #room.say("Listeners = #{liss}")
  #room.say("Mods = #{mods}")

  on :user_spoke do |message|
    @@last_activity[message.sender.id] = Time.now
    if(@@bot.getMessageProcess())
      if (message.content == "force-bot-vote")
        room.say("master bot is voting")
        begin
          #c.room.current_song.vote
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
      elsif (message.content == "last-song-stats")
        begin
          lastSong = c.room.songs_played[-2]
          if (lastSong.nil?)
            room.say("No Current Last-Song Stats.")
          else
            room.say("~Last Songs Results~")
            room.say("#{lastSong.title.to_s} by #{lastSong.artist.to_s} via #{lastSong.played_by.name.to_s}")
            room.say("score: #{lastSong.score.to_s}")
          end
        rescue Exception => e
          room.say("Song Persistence Error. Comon Rabbit")
        end
      elsif (message.content == "song-stats")
        begin
          lastSong = c.room.songs_played[-1]
          if (lastSong.nil?)
            room.say("No Current Song Stats.")
          else
            room.say("~Song Stats~")
            room.say("#{lastSong.title.to_s} by #{lastSong.artist.to_s} via #{lastSong.played_by.name.to_s}")
            room.say("score: #{lastSong.score.to_s}")
              #room.say("voters: #{@@bot.getVoted.to_s}")
          end
        rescue Exception => e
          room.say("Song Persistence Error. Comon Rabbit")
        end
=begin
      elsif (message.content == "songs-played")
        songs = c.room.songs_played
        if (songs.length <= 0)
          room.say("No songs currently persisted. Deep-Grab>?")
        end
        c.room.songs_played{
          |s|
          puts s.title

          room.say("#{s.title.to_s} by #{s.artist.to_s} via #{s.played_by.name.to_s}")
        }
=end
      elsif (message.content == "magic")
        if (message.sender.name == "Rabbitholes")
          room.say("attempting to make us all have massive votes")
          magicUser = c.user_by_name('Rabbitholes')
          magicUser.remove_as_dj
          room.say("Rabbitholes nooooo!!!")
        end
      elsif (message.content == "bot-dj")
        begin
          c.room.become_dj
          room.say("Yep yep!")
        rescue Exceotion => e
          room.say("Is there room?")
        end
      elsif (message.content == "bot-dj-boo")
        begin
          magicUser = c.user_by_name("Dr.Mundo")
          magicUser.remove_as_dj
          room.say("Done.")
        rescue Exceotion => e
          room.say("Was I to being with?")
        end
      elsif (message.content == "magic-boot")
        if (message.sender.name == "Rabbitholes")
          room.say("attempting to make us all have massive amounts of points")
          djName = room.current_dj.name.to_s
          room.say("#{djName} ... you'll thank me later!!")
          c.room.current_dj.remove_as_dj
          room.say("#{djName} ... dj again!! ")
        end
      elsif (message.content == "spawn_master")
        begin
          puts "spawning_master"
          room.say("spawning_master")
          system("bash spawner_runner.sh")
          room.say("spawned_master")
          puts "spawned_master"
        rescue Exception => e
          puts e.to_s
        end
      else
        processMessage(message)
      end
    end
    if (@@bot.getTrollStatus())
      trollolol(message)
    end
  end

  on :song_started do |song|
    # Display Last Songs Results
    begin
      lastSong = c.room.songs_played[-2]
      if (lastSong.nil?)
        room.say("No songs currently persisted. Deep-Grab>?")
      else
        room.say("~Last Songs Results~")
        room.say("#{lastSong.title.to_s} by #{lastSong.artist.to_s} via #{lastSong.played_by.name.to_s}")
        room.say("score: #{lastSong.score.to_s}")
        room.say("votes: #{@@bot.getVoted.length}")
        #room.say("up_votes: #{lastSong.up_votes_count.to_s}")
        #room.say("down_votes: #{lastSong.down_votes_count.to_s}")
          #room.say("voters: #{@@bot.getVoted.to_s}")
      end
    rescue Exception => e
      room.say("Song Persistence Error. Comon Rabbit")
    end
    @@bot.setVoted([])

    # Vote for New Song
    #song.vote
    homie_id = song.played_by.id.to_s
    if (@@homies.has_key?(homie_id))
      @@homies[homie_id] = @@homies[homie_id].to_i + 1
    else
      @@homies[homie_id] = 1
    end
    @@vote_count = @@vote_count + 1
  end

  on :user_entered do |user|
    room.say("Hey '#{user.name}', thanks for coming tonight")
    begin
      user.become_fan
    rescue Exception => e
      puts "You are already their fan!"
    end
    @@last_activity[user.id] = Time.now
  end

  #
  # User Activity
  #
  room.listeners.each do |user|
    @@last_activity[user.id] = Time.now
  end

  on :user_left do |user|
    @@last_activity.delete(user.id)
  end

  on :dj_added do |user|
    @@last_activity[user.id] = Time.now
  end

  on :dj_removed do |user|
    @@last_activity[user.id] = Time.now
  end

  on :song_voted do |song|
    song.votes.each do |vote|
      username = vote.user.name
      voters = @@bot.getVoted()
      if (!voters.include?(username))
        voters.push(username)
        @@bot.setVoted(voters)
      end
      @@last_activity[vote.user.id] = Time.now
    end
  end

  on :song_snagged do |snag|
    @@last_activity[snag.user.id] = Time.now
  end

end
