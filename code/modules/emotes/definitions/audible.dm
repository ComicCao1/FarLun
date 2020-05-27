/decl/emote/audible
	key = "burp"
	emote_message_3p = "USER burps."
	message_type = AUDIBLE_MESSAGE
	var/emote_sound
	var/list/male = list()  // male emote sounds
	var/list/female = list()// female emote sounds
	var/volume = 50         // the volume of the emote
	var/neuter_sound = TRUE

/decl/emote/audible/do_extra(var/atom/user)
	var/playme
	if(emote_sound)
		playme = emote_sound
	if(male.len && female.len)  // gendered emote
		if(user.gender == FEMALE)		playme = pick(female)
		else							playme = pick(male)
	if(playme)		playsound(user.loc, playme, volume, 0)

/decl/emote/audible/deathgasp_alien
	key = "deathgasp"
	emote_message_3p = "USER lets out a waning guttural screech, green blood bubbling from its maw."

/decl/emote/audible/whimper
	key ="whimper"
	emote_message_3p = "USER whimpers."

/decl/emote/audible/gasp
	key ="gasp"
	emote_message_3p = "USER gasps."
	conscious = 0
	male = list('sound/emotes/gasp/gasp_m_1.ogg','sound/emotes/gasp/gasp_m_2.ogg','sound/emotes/gasp/gasp_m_3.ogg','sound/emotes/gasp/gasp_m_4.ogg','sound/emotes/gasp/gasp_m_5.ogg')
	female = list('sound/emotes/gasp/gasp_f_1.ogg','sound/emotes/gasp/gasp_f_2.ogg','sound/emotes/gasp/gasp_f_3.ogg','sound/emotes/gasp/gasp_f_4.ogg','sound/emotes/gasp/gasp_f_5.ogg')

/decl/emote/audible/scretch
	key ="scretch"
	emote_message_3p = "USER scretches."

/decl/emote/audible/choke
	key ="choke"
	emote_message_3p = "USER chokes."
	conscious = 0

/decl/emote/audible/gnarl
	key ="gnarl"
	emote_message_3p = "USER gnarls and shows its teeth."

/decl/emote/audible/chirp
	key ="chirp"
	emote_message_3p = "USER chirps!"
	emote_sound = 'sound/misc/nymphchirp.ogg'

/decl/emote/audible/alarm
	key = "alarm"
	emote_message_1p = "I sound an alarm."
	emote_message_3p = "USER sounds an alarm."

/decl/emote/audible/alert
	key = "alert"
	emote_message_1p = "I let out a distressed noise."
	emote_message_3p = "USER lets out a distressed noise."

/decl/emote/audible/notice
	key = "notice"
	emote_message_1p = "I play a loud tone."
	emote_message_3p = "USER plays a loud tone."

/decl/emote/audible/whistle
	key = "whistle"
	emote_message_1p = "I whistle."
	emote_message_3p = "USER whistles."

/decl/emote/audible/boop
	key = "boop"
	emote_message_1p = "I boop."
	emote_message_3p = "USER boops."

/decl/emote/audible/sneeze
	key = "sneeze"
	emote_message_3p = "USER sneezes."
	male = list('sound/emotes/sneeze/sneeze_m_1.ogg','sound/emotes/sneeze/sneeze_m_2.ogg','sound/emotes/sneeze/sneeze_m_3.ogg')
	male = list('sound/emotes/sneeze/sneeze_f_1.ogg','sound/emotes/sneeze/sneeze_f_2.ogg','sound/emotes/sneeze/sneeze_f_3.ogg')

/decl/emote/audible/sniff
	key = "sniff"
	emote_message_3p = "USER sniffs."
	male = list('sound/emotes/sniff/sniff_1.ogg','sound/emotes/sniff/sniff_2.ogg','sound/emotes/sniff/sniff_3.ogg','sound/emotes/sniff/sniff_4.ogg')
	female = list('sound/emotes/sniff/sniff_1.ogg','sound/emotes/sniff/sniff_2.ogg','sound/emotes/sniff/sniff_3.ogg','sound/emotes/sniff/sniff_4.ogg')
	// ^ these are the same since it's a non-vocal thing, but it doesn't use emote_sound because there's multiple

/decl/emote/audible/snore  // the fact people record themselves sleeping to make sfx is kinda weird
	key = "snore"
	emote_message_3p = "USER snores."
	conscious = 0
	male = list('sound/emotes/snore/snore_m_1.ogg','sound/emotes/snore/snore_m_2.ogg','sound/emotes/snore/snore_m_3.ogg')
	female = list('sound/emotes/snore/snore_f_1.ogg','sound/emotes/snore/snore_f_2.ogg','sound/emotes/snore/snore_f_3.ogg')

/decl/emote/audible/whimper
	key = "whimper"
	emote_message_3p = "USER whimpers."

/decl/emote/audible/yawn
	key = "yawn"
	emote_message_3p = "USER yawns."

/decl/emote/audible/clap
	key = "clap"
	emote_message_3p = "USER claps."

/decl/emote/audible/chuckle
	key = "chuckle"
	emote_message_3p = "USER chuckles."
	male = list('sound/emotes/chuckle/chuckle_m_1.ogg','sound/emotes/chuckle/chuckle_m_2.ogg','sound/emotes/chuckle/chuckle_m_3.ogg')
	female = list('sound/emotes/chuckle/chuckle_f_1.ogg','sound/emotes/chuckle/chuckle_f_2.ogg','sound/emotes/chuckle/chuckle_f_3.ogg')
	volume = 45

/decl/emote/audible/cough
	key = "cough"
	emote_message_3p = "USER coughs!"
	conscious = 0

/decl/emote/audible/cry
	key = "cry"
	emote_message_3p = "USER cries."

/decl/emote/audible/sigh
	key = "sigh"
	emote_message_3p = "USER sighs."

/decl/emote/audible/laugh
	key = "laugh"
	emote_message_3p = "USER laughs."
	male = list('sound/emotes/laugh/laugh_m_1.ogg','sound/emotes/laugh/laugh_m_2.ogg','sound/emotes/laugh/laugh_m_3.ogg')
	female = list('sound/emotes/laugh/laugh_f_1.ogg','sound/emotes/laugh/laugh_f_2.ogg','sound/emotes/laugh/laugh_f_3.ogg')
	volume = 55

/decl/emote/audible/mumble
	key = "mumble"
	emote_message_3p = "USER mumbles!"

/decl/emote/audible/grumble
	key = "grumble"
	emote_message_3p = "USER grumbles!"

/decl/emote/audible/groan
	key = "groan"
	emote_message_3p = "USER groans!"
	conscious = 0
	male = list('sound/emotes/groan/groan_m_1.ogg','sound/emotes/groan/groan_m_2.ogg','sound/emotes/groan/groan_m_3.ogg')
	female = list('sound/emotes/groan/groan_f_1.ogg','sound/emotes/groan/groan_f_2.ogg','sound/emotes/groan/groan_f_3.ogg')
	volume = 40

/decl/emote/audible/moan
	key = "moan"
	emote_message_3p = "USER moans!"
	conscious = 0
	male = list('sound/emotes/moan/moan_m_1.ogg','sound/emotes/moan/moan_m_2.ogg','sound/emotes/moan/moan_m_3.ogg')
	female = list('sound/emotes/moan/moan_f_1.ogg','sound/emotes/moan/moan_f_2.ogg','sound/emotes/moan/moan_f_3.ogg')
	volume = 40

/decl/emote/audible/giggle
	key = "giggle"
	emote_message_3p = "USER giggles." // audio is the same as chuckle, because same difference
	male = list('sound/emotes/chuckle/chuckle_m_1.ogg','sound/emotes/chuckle/chuckle_m_2.ogg','sound/emotes/chuckle/chuckle_m_3.ogg')
	female = list('sound/emotes/chuckle/chuckle_f_1.ogg','sound/emotes/chuckle/chuckle_f_2.ogg','sound/emotes/chuckle/chuckle_f_3.ogg')

/decl/emote/audible/scream
	key = "scream"
	emote_message_3p = "USER screams!"
	male = list('sound/emotes/scream/scream_m_1.ogg','sound/emotes/scream/scream_m_2.ogg','sound/emotes/scream/scream_m_3.ogg','sound/emotes/scream/scream_m_4.ogg')
	female = list('sound/emotes/scream/scream_f_1.ogg','sound/emotes/scream/scream_f_2.ogg','sound/emotes/scream/scream_f_3.ogg','sound/emotes/scream/scream_f_4.ogg')
	volume = 60     // screams are louder

/decl/emote/audible/grunt
	key = "grunt"
	emote_message_3p = "USER grunts."

/decl/emote/audible/bug_hiss
	key ="hiss"
	emote_message_3p = "USER hisses."
	emote_sound = 'sound/voice/BugHiss.ogg'

/decl/emote/audible/bug_buzz
	key ="buzz"
	emote_message_3p = "USER buzzes its wings."
	emote_sound = 'sound/voice/BugBuzz.ogg'

/decl/emote/audible/bug_chitter
	key ="chitter"
	emote_message_3p = "USER chitters."
	emote_sound = 'sound/voice/Bug.ogg'
