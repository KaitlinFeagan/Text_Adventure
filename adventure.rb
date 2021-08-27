def start
    puts "You are a brave adventurer in search of treasure."
    puts "You have finally arrived at your destination - an old, abandoned castle."
    puts "But beware!  Your peril is only now beginning."
    puts "You stand at the front entrance. Do you dare to enter the castle or run home crying?"

    while true
        print "> "
        choice = $stdin.gets.chomp

        if choice.include? "enter" || "castle"
            main_hallway
        elsif choice.include? "run"
            puts "Well, you're no fun.  Ending the game now.  Goodbye!"
            exit(0)
        else
            puts "I don't know what that means."
        end
    end
end

def main_hallway
    puts "You enter the castle and find yourself in a large hallway."
    puts "There are three doors: left, center, and right."
    puts "Which one will you go through?"

    while true 
        print "> "
        choice = $stdin.gets.chomp

        if choice.include? "left"
            ogre_room
        elsif choice.include? "center" || "middle"
            gold_room
        elsif choice.include? "right"
            throne_room
        elsif choice.include? "back"
            start
        else
            puts "I don't know what that means."
        end
    end
end

def ogre_room
    puts "You enter the room and encounter an ogre."
    puts "He has in his hand a large, shimmering jewel."
    puts "Do you want to attack the ogre, scare the ogre, talk to the ogre?"

    while true
        print "> "
        choice = $stdin.gets.chomp

        if choice.include? "attack" || "kill"
            puts "You let out a battle try and sucker punch the orge!"
            puts "The ogre barely flinches, but look furious."
            dead("The ogre angrily picks you up and snaps you in two like a twig.")
        elsif choice.include? "scare"
            puts "You flail your arms and yell at the ogre, hoping that he will be intimidated."
            dead("Unfortunately for you, the ogre is much scarier than you are and decides to eat you.")
        elsif choice.include? "talk" || "say"
            puts "You take the diplomatic approach and talk to the ogre."
            puts "The ogre is happy for the company."
            puts "\"Want... funny movie quote... with ogres like me...\" he grunts using his best English."
            puts "A movie quote, huh?  Do you want to make a Shrek reference, or reference another movie?"
                
            print "> "
            choice = $stdin.gets.chomp

            def reference_shrek
                shrek_quotes = ["Better out than in, I always say.", 
                            "DONKEY!?", 
                            "WHAT ARE YA DOING IN MAH SWAMP!?", 
                            "Could you not be yourself... FOR FIVE MINUTES?",
                            "Let's crash this parteh!"]
                n = rand(0..4)
                return shrek_quotes[n]
            end
            
            shrek_quote = reference_shrek

            if choice.include? "shrek" || "Shrek"
                puts "You use your best acting skills and shout, \"#{shrek_quote}\" in your best Scottish accent."
                puts "The ogre laughs at your hilarious Shrek reference"
                puts "When he is able to breathe again, the ogre says, \"Okay, you funny... Here you go.\""
                puts "He gives you the jewel for being such fun company.  See, he wasn't so bad once you got to know him. \;\)"
                win("You did it!  You take home a jewel worth a fortune.  You'll live in luxury for the rest of your days.")
            else 
                puts "The ogre isn't pleased with what you said.  He picks you up, puts you outside the castle, and slams and locks the door behind you."
                puts "How rude!"
                dead("Deus Ex Machina time!  You immediately get stuck by lightning outside and die. LOL.")
            end
        else
            puts "I don't know what that means."
        end
    end
end

def gold_room
    puts "You enter a room filled with pieces of gold everywhere!"
    puts "As you reach for the gold, you see a sign that says \"Death awaits the greedy.\""
    puts "You still want to take some gold with you... but how many pieces should you take?"
    puts "You think to yourself that 100 pieces or so would be a nice amount of money... But more would make you very rich."
    puts "So, how many pieces do you want to take?"
    
    print "> "
    choice = $stdin.gets.chomp

    if num_check(choice) == false
        dead("The math gods kill you for not typing in a number. :)")
    else 
        how_much = choice.to_i
    end 

    if how_much > 120
        dead("You decide to take a LOT of gold!  While you're shoveling coins in your hat, a dragon wakes up and sees you stealing its treasure.  
        \nIt lets out a roar and burns you to a crisp.")
    elsif how_much < 10
        puts "Huh, that's not many coins at all.  Well, at least no one can call you materialistic."
        puts "You take your #{how_much} coins and wonder if this was all worth it.  After all, money can't buy happiness, you think to yourself."
        puts "You go home and decide that trying to get treasure isn't really for you.  You take up gardening as a hobby instead."
        puts "You live to old age, never forgetting that the best things in life are free.  The End."
        exit(0)
    else
        puts "You heed the sign's warning and only take #{how_much} coins."
        puts "It's a nice amount of money, but not enough to get you in trouble, you reason."
        puts "Right before you turn to leave, you hear an angry roar.  It's a dragon!"
        puts "Terrified, you turn around and dash out the door, sprinting out of the castle."
        win("You were fast enough to get away from the dragon... And you have a nice stash of gold now on top of that! \n
        You head home, happy to have gotten some treasure.")
    end
end

def throne_room
    puts "You step into the room to your right.  Inside is a beautiful throne room with a jewel-encrusted, golden throne."
    puts "Beside the throne you see three valuable-looking treasures:  a mythril sword, a golden chalice, and a diamond-studded scepter."
    puts "Now this is what adventuring is all about!"
    puts "What do you want to take first, sword, chalice, or scepter?"

    print "> "
    choice = $stdin.gets.chomp

    if choice.include? "chalice" || "scepter"
        puts "You decide to take the #{choice} first."
        puts "As you hold the glittering #{choice} in your hand, you hear a voice behind you."
        puts "\"Taking something?\" you hear as you spin around."
        puts "In front of you is a powerful sorcerer.  He smiles menacingly as he readies a fireball."
        puts "You realize that you will have to fight!  But all you have at your disposal is the #{choice}."
        dead("You try to run from his attack, but his spell incinerates you immediately.")
    elsif choice.include? "sword"
        puts "As nice as the other things are, you decide that being armed is the most important thing.  You take the sword."
        puts "As you hold the mythril sword in your hand, you hear a voice behind you."
        puts "\"Taking something?\" you hear as you spin around."
        puts "In front of you is a powerful sorcerer.  He smiles menacingly as he readies a fireball."
        puts "You realize that you will have to fight!  Thankfully, you were savvy enough to arm yourself immediately."
        puts "You have a choice now: fight or run!"

        print "> "
        choice = $stdin.gets.chomp

        if choice.include? "fight" || "sword" || "stab" || "kill"
            puts "If it's a fight he wants, it's a fight he'll get!"
            puts "You make a mad dash at the sorcerer and stab him through the heart."
            puts "He gasps and slumps to the ground, dead."
            puts "You breathe a sign of relief, that was close!"
            win("You grab the chalice and scepter on your way out, and go home with your haul.")
        else 
            dead("You try to run, but the wizard has incredible aim and blows you up with one clean shot.")
        end
    else
        puts "You hem and haw, trying to think which item you should take first."
        puts "While you're thinking, to your surprise, you're killed in an instant!"
        dead("A sorcerer snuck up on you and killed you from behind.  Gotta be fast!")
    end
end

def num_check(thing)
    if thing == thing.to_i.to_s
        return true
    else 
        return false
    end
end

def dead(why)
    puts why
    puts "You died and your adventure ends here.  Better luck next time."
    exit(0)
end

def win(happy_ending)
    puts happy_ending
    puts """You braved the castle and found some cool treasure to take home!  You win!

            ~~~  CONGRATULATIONS!  ~~~

The end."""
    exit(0)
end

start