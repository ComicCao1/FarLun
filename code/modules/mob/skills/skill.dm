GLOBAL_LIST_EMPTY(skills)

/decl/hierarchy/skill
	var/ID = "none"					// ID of this skill. Needs to be unique.
	name = "None" 				// Name of the skill. This is what the player sees.
	var/desc = "Placeholder skill" 	// Generic description of this skill.

   	// Names for different skill values, in order from 1 up.
	var/levels = list( 		"Unskilled"			= "Unskilled Description",
							"Basic"				= "Basic Description",
							"Trained"			= "Trained Description",
							"Experienced"		= "Experienced Description",
							"Master"		= "Professional Description")
	var/difficulty = SKILL_AVERAGE   //Used to compute how expensive the skill is
	var/default_max = SKILL_ADEPT    //Makes the skill capped at this value in selection unless overriden at job level.

/decl/hierarchy/skill/proc/get_cost(var/level)
	switch(level)
		if(SKILL_BASIC, SKILL_ADEPT)
			return difficulty
		if(SKILL_EXPERT, SKILL_PROF)
			return 2*difficulty
		else
			return 0

//Do not attempt to get_decl any of these except /decl/hierarchy/skill from decls_repository. Use the children variable or GLOB.skills instead.
/decl/hierarchy/skill/New(var/full_init = TRUE)
	..(full_init)
	if(full_init)
		if(!GLOB.skills.len)
			for(var/decl/hierarchy/skill/C in children)
				GLOB.skills += C.children
		else
			log_error("<span class='warning'>Warning: multiple instances of /decl/hierarchy/skill have been created!</span>")

/decl/hierarchy/skill/dd_SortValue()
	return ID

/decl/hierarchy/skill/organizational
	name = "Organizational"
	ID	 = "1"
	difficulty = SKILL_EASY
	default_max = SKILL_MAX

/decl/hierarchy/skill/general
	name = "General"
	ID	 = "2"
	difficulty = SKILL_EASY
	default_max = SKILL_MAX

/decl/hierarchy/skill/service
	name = "Service"
	ID	 = "service"
	difficulty = SKILL_EASY
	default_max = SKILL_MAX

/decl/hierarchy/skill/security
	name = "Security"
	ID	 = "security"

/decl/hierarchy/skill/engineering
	name = "Engineering"
	ID	 = "engineering"

/decl/hierarchy/skill/research
	name = "Research"
	ID	 = "research"

/decl/hierarchy/skill/medical
	name = "Medical"
	ID	 = "medical"
	difficulty = SKILL_HARD

// ONLY SKILL DEFINITIONS BELOW THIS LINE
// Category: Organizational

/decl/hierarchy/skill/organizational/bureaucracy
	ID = "bureaucracy"
	name = "Bureaucracy"
	desc = "My ability to write and complete paperwork, navigate complex organiztions, and understand laws and regulations."
	levels = list( "Unskilled"			= "I can usually fill out basic paperwork, if with a few errors. I have a vague understanding of the law, gleaned mostly from the news and personal experience.",
						"Basic"				= "I am familiar with the paperwork needed to do my job, and can navigate it well. I have some understanding of the law as it applies to I and those around you.",
						"Trained"			= "I can navigate most paperwork thrown at you, even if I am unfamiliar with it. I have a good working understanding of the law and any regulations or procedures relevant to me.",
						"Experienced"		= "With my experience, I can easily create paperwork for any eventuality, and write reports which are clear and understandable. I have an excellent knowledge of the law, possibly including formal legal training.",
						"Master"		= "I can make paperwork dance to my bidding, and navigate the most byzantine bureaucratic structures with ease and familiarity. My reports are works of literature. My knowledge of the law is both broad and intimate, and I may be certified to practice law.")

/decl/hierarchy/skill/organizational/finance
	ID = "finance"
	name = "Finance"
	desc = "My ability to manage money and investments."
	levels = list( "Unskilled"			= "My understanding of money starts and ends with personal finance. While I am able to perform basic transactions, I get lost in the details, and can find myself ripped off on occasion.",
						"Basic"				= "I have some limited understanding of financial transactions, and will generally be able to keep accurate records. I have little experience with investment, and managing large sums of money will likely go poorly for you.",
						"Trained"			= "I am good at managing accounts, keeping records, and arranging transactions. I have some familiarity with mortgages, insurance, stocks, and bonds, but may be stumped when facing more complicated financial devices.",
						"Experienced"		= "With my experience, I am familiar with any financial entities I may run across, and are a shrewd judge of value. More often than not, investments I make will pan out well.",
						"Master"		= "I have an excellent knowledge of finance, will often make brilliant investments, and have an instinctive feel for interstellar economics. Financial instruments are weapons in my hands. I likely have professional experience in the finance industry.")

// Category: General

/decl/hierarchy/skill/general/EVA
	ID = "EVA"
	name = "Extra-vehicular activity"
	desc = "This skill describes my skill and knowledge of space-suits and working in vacuum."
	levels = list( "Unskilled"			= "I have basic safety training common to people who work in space: I know how to put on and seal my internals, and I can probably struggle into a space suit if I really need to, though you'll be clumsy at it. I'm still prone to mistakes that may leave I trying to breathe vacuum.",
						"Basic"				= "I have had thorough basic training in EVA operations, and are unlikely to make novice mistakes. However, I have little experience working in vacuum.",
						"Trained"			= "I can comfortably use a space suit and do so regularly in the course of my work. Checking my internals is second nature to me, and I don't panic in an emergency.",
						"Experienced"		= "I can use all kinds of space suits, including specialized versions. My years of experience in EVA keep I from being disoriented in space, and I have experience using a jetpack to move around.",
						"Master"		= "I am just as much at home in a vacuum as in atmosphere. I probably do my job almost entirely EVA.")

/decl/hierarchy/skill/general/mech
	ID = "mech"
	name = "Exosuit Operation"
	desc = "Describes my experience and understanding of operating heavy machinery, which includes mechs and other large exosuits. Used in piloting mechs."
	levels = list( "Unskilled"			= "I know what a mech is, and if I see one I can recognize which type it is. If my department uses exosuits, I know roughly what their capabilities are. If I were to get into one, you'd have about fifty-fifty odds of getting it moving in the direction I wanted it to go.",
						"Basic"				= "I can drive an exosuit safely, but I specialize in only one type of mech that my department regularly uses. I'm not an expert and I fumble the controls sometimes, but you're going where I want to go and you're pretty sure I know what those buttons do.",
						"Trained"			= "I am quite comfortable using the type of exosuit you're most familiar with. I may spend entire shifts piloting one, and you're familiar with its functions. I can do basic maintenance. I can use most types of exosuits, unless they're very exotic or specialized.",
						"Experienced"		= "I can use any type of mech comfortably and automatically. to me, a mech is more like a second skin than a vehicle. I can maintain, repair, and probably build exosuits.",
						"Master"		= "I am a professional exosuit technician, and are well-versed in construction and maintenance procedures. I can design and construct exosuits suitable for any needs.")
	difficulty = SKILL_AVERAGE

/decl/hierarchy/skill/general/pilot
	ID = "pilot"
	name = "Piloting"
	desc = "Describes my experience and understanding of piloting spacecraft, from small and short-range pods to corvette sized vessels."
	levels = list( "Unskilled"			= "I know what a spacecraft is, and I might have an abstract understanding of the differences between various ships. If my department is involved in the use of spacecraft, I know roughly what their capabilities are. I might be able to fly a spacecraft in a videogame. If I were to take the Helm of a smaller vessel, I might be able to move it with proper guidance.",
						"Basic"				= "I can pilot a small, short-range craft safely, but larger ships are out of my area of expertise. I am by no means an expert, and probably don't have much training. Skills of this level are typical for deck crew.",
						"Trained"			= "I am a trained pilot, and can safely operate anything from a small craft to a corvette. I can spend extended periods of time piloting a spacecraft, and you're versed in the abilities of different ships, and what makes them function. I can do basic maintenance on smaller vessels, and perform most basic maneuvers. I can use armed spacecraft. I can make basic calculations relating to piloting. Skills of this level are typical for newer pilots. I have probably received formal piloting training.",
						"Experienced"		= "I am an experienced pilot, and can safely take the helm of many types of craft. I could probably live in a spacecraft, and you're very well versed in essentially everything related to space-faring vessels. Not only can I fly a ship, but I can perform difficult maneuvers, and make most calculations related to piloting a spacecraft. I can maintain a ship. Skills of this level are typical for very experienced pilots. I have received formal piloting training.",
						"Master"		= "Not only are I an exceptional pilot, but I have mastered peripheral functions such as stellar navigation and bluespace jump plotting. I have experience performing complex maneuvers, managing squadrons of small craft, and operating in hostile environments.")
	difficulty = SKILL_AVERAGE
	default_max = SKILL_ADEPT

/decl/hierarchy/skill/general/hauling
	ID = "hauling"
	name = "Athletics"
	desc = "My ability to perform tasks requiring great strength, dexterity, or endurance."
	levels = list( "Unskilled"			= "I am not used to manual labor, tire easily, and are likely not in great shape. Extended heavy labor may be dangerous for you.",
						"Basic"				= "I have some familiarity with manual labor, and are in reasonable physical shape. Tasks requiring great dexterity or strength may still elude you.",
						"Trained"			= "I have sufficient strength and dexterity for even very strenuous tasks, and can work for a long time without tiring.",
						"Experienced"		= "I have experience with heavy work in trying physical conditions, and are in excellent shape. I visit the gym frequently.",
						"Master"		= "In addition to my excellent strength and endurance, I have a lot of experience with the specific physical demands of my job. I may have competitive experience with some form of athletics.")

/decl/hierarchy/skill/general/computer
	ID = "computer"
	name = "Information Technology"
	desc = "Describes my understanding of computers, software and communication. Not a requirement for using computers, but definitely helps. Used in telecommunications and programming of computers and AIs."
	levels = list( "Unskilled"			= "I know how to use the computers and communication devices that I grew up with. I can use a computer console, a handheld or wall-mounted radio, and my headset, as well as my PDA. I know what an AI is, but I may see them as either \"people made of silicon\" or \"only machines\"; I know they have to obey their laws, but I don't know much about how or why they work.",
						"Basic"				= "I know the basics of programming, but you're not very good at it and couldn't do it professionally. I have a pretty good idea of what makes AIs tick. I understand how information is stored in a computer, and I can fix simple computer problems. I'm computer-literate, but I still make mistakes. If I tried to subvert the AI, I might make mistakes in wording my new laws.",
						"Trained"			= "At this level, you're probably working with computers on a daily basis. I understand and can repair the telecommunications network. My understanding of AI programming and psychology lets I fix problems with the AIs or cyborgs--or create problems, if I so desire. I can program computers and AIs and change their laws effectively.",
						"Experienced"		= "I have years of experience with computer networks, AI systems, telecommunications, and sysadmin tasks. I know the systems used on a daily basis intimately, and can diagnose complex problems.",
						"Master"		= "People are probably starting to wonder whether I might be a computer myself. Computer code is my first language; I relate to AIs as easily as (probably more easily than) organics. I could build a telecommunications network from the ground up.")

// Category: Service

/decl/hierarchy/skill/service/botany
	ID = "botany"
	name = "Botany"
	desc = "Describes how good a character is at growing and maintaining plants."
	levels = list( "Unskilled"			= "I know next to nothing about plants. While I can attempt to plant, weed, or harvest, I am just as likely to kill the plant instead.",
						"Basic"				= "I have done some gardening. I can water, weed, fertilize, plant, and harvest, and I can recognize and deal with pests. I may be a hobby gardener.",
						"Trained"			= "I am proficient at botany, and can grow plants for food or oxygen production. My plants will generally survive and prosper. I know the basics of manipulating plant genes.",
						"Experienced"		= "I'm a botanist or farmer, capable of running a facility's hydroponics farms or doing botanical research. I am adept at creating custom hybrids and modified strains.",
						"Master"		= "I'm a specialized botanist. I can care for even the most exotic, fragile, or dangerous plants. I can use gene manipulation machinery with precision, and are often able to avoid the degradation of samples.")

/decl/hierarchy/skill/service/cooking
	ID = "cooking"
	name = "Cooking"
	desc = "Describes a character's skill at preparing meals and other consumable goods. This includes mixing alcoholic beverages."
	levels = list( "Unskilled"			= "I barely know anything about cooking, and stick to vending machines when I can. The microwave is a device of black magic to me, and I avoid it when possible.",
						"Basic"				= "I can make simple meals and do the cooking for my family. Things like spaghetti, grilled cheese, or simple mixed drinks are my usual fare.",
						"Trained"			= "I can make most meals while following instructions, and they generally turn out well. I have some experience with hosting, catering, and/or bartending.",
						"Experienced"		= "I can cook professionally, keeping an entire crew fed easily. My food is tasty and I don't have a problem with tricky or complicated dishes. I can be depended on to make just about any commonly-served drink.",
						"Master"		= "Not only are I good at cooking and mixing drinks, but I can manage a kitchen staff and cater for special events. I can safely prepare exotic foods and drinks that would be poisonous if prepared incorrectly.")

// Category: Security

/decl/hierarchy/skill/security/combat
	ID = "combat"
	name = "Close Combat"
	desc = "This skill describes my training in hand-to-hand combat or melee weapon usage. While expertise in this area is rare in the era of firearms, experts still exist among athletes."
	levels = list( "Unskilled"			= "I can throw a punch or a kick, but it'll knock I off-balance. I'm inexperienced and have probably never been in a serious hand-to-hand fight. In a fight, I might panic and run, grab whatever's nearby and blindly strike out with it, or (if the other guy is just as much of a beginner as I am) make a fool out of myself.",
						"Basic"				= "I either have some experience with fistfights, or I have some training in a martial art. I can handle myself if I really have to, and if you're a security officer, can handle a stun baton at least well enough to get the handcuffs onto a criminal.",
						"Trained"			= "I have had close-combat training, and can easily defeat unskilled opponents. Close combat may not be my specialty, and I don't engage in it more than needed, but I know how to handle myself in a fight.",
						"Experienced"		= "I'm good at hand-to-hand combat. I have trained explicitly in a martial art or as a close combatant as part of a military or police unit. I can use weaponry competently and I can think strategically and quickly in a melee. I'm in good shape and I spend time training.",
						"Master"		= "I specialize in hand-to-hand combat. I'm well-trained in a practical martial art, and in good shape. I spend a lot of time practicing. I can take on just about anyone, use just about any weapon, and usually come out on top. I may be a professional athlete or special forces member.")

/decl/hierarchy/skill/security/weapons
	ID = "weapons"
	name = "Weapons Expertise"
	desc = "This skill describes my expertise with and knowledge of weapons. A low level in this skill implies knowledge of simple weapons, for example flashes. A high level in this skill implies knowledge of complex weapons, such as unconfigured grenades, riot shields, pulse rifles or bombs. A low-medium level in this skill is typical for security officers, a high level of this skill is typical for special agents and soldiers."
	levels = list( "Unskilled"			= "I know how to recognize a weapon when I see one. I can point a gun and shoot it, though results vary wildly. I might forget the safety, I can't control burst recoil well, and I don't have trained reflexes for gun fighting.",
						"Basic"				= "I know how to handle weapons safely, and you're comfortable using simple weapons. My aim is decent and I can usually be trusted not to do anything stupid with a weapon I am familiar with, but my training isn't automatic yet and my performance will degrade in high-stress situations.",
						"Trained"			= "I have had extensive weapons training, or have used weapons in combat. My aim is better now. I am familiar with most types of weapons and can use them in a pinch. I have an understanding of tactics, and can be trusted to stay calm under fire. I may have military or police experience and I probably carry a weapon on the job.",
						"Experienced"		= "I have used firearms and other ranged weapons in high-stress situations, and my skills have become automatic. My aim is good.",
						"Master"		= "I am an exceptional shot with a variety of weapons, from simple to exotic. I use a weapon as naturally as though it were a part of my own body. I may be a sniper or special forces operator of some kind.")

/decl/hierarchy/skill/security/weapons/get_cost(var/level)
	switch(level)
		if(SKILL_BASIC)
			return difficulty
		if(SKILL_ADEPT)
			return 2*difficulty
		if(SKILL_EXPERT, SKILL_PROF)
			return 4*difficulty
		else
			return 0

/decl/hierarchy/skill/security/forensics
	ID = "forensics"
	name = "Forensics"
	desc = "Describes my skill at performing forensic examinations and identifying vital evidence. Does not cover analytical abilities, and as such isn't the only indicator for my investigation skill. Note that in order to perform autopsy, the surgery skill is also required."
	levels = list( "Unskilled"			= "I know that detectives solve crimes. I may have some idea that it's bad to contaminate a crime scene, but you're not too clear on the details.",
						"Basic"				= "I know how to avoid contaminating a crime scene. I know how to bag the evidence without contaminating it unduly.",
						"Trained"			= "I am trained in collecting forensic evidence - fibers, fingerprints, the works. I know how autopsies are done, and might've assisted performing one.",
						"Experienced"		= "I'm a pathologist, or detective. I have seen my share of bizarre cases, and spent a lot of time putting pieces of forensic puzzle together, so you're faster now.",
						"Master"		= "I'm a big name in forensic science. I might be an investigator who cracked a famous case, or I published papers on new methods of forensics. Either way, if there's a forensic trail, I will find it, period.")


/decl/hierarchy/skill/security/forensics/get_cost(var/level)
	switch(level)
		if(SKILL_BASIC, SKILL_ADEPT, SKILL_EXPERT)
			return difficulty * 2
		if(SKILL_PROF)
			return 3 * difficulty
		else
			return 0

// Category: Engineering

/decl/hierarchy/skill/engineering/construction
	ID = "construction"
	name = "Construction"
	desc = "My ability to construct various buildings, such as walls, floors, tables and so on. Note that constructing devices such as APCs additionally requires the Electronics skill. A low level of this skill is typical for janitors, a high level of this skill is typical for engineers."
	levels = list( "Unskilled"			= "I can move furniture, assemble or disassemble chairs and tables (sometimes they even stay assembled), bash my way through a window, open a crate, or pry open an unpowered airlock. I can recognize and use basic hand tools and inflatable barriers, though not very well.",
						"Basic"				= "I can dismantle or build a wall or window, build furniture, redecorate a room, and replace floor tiles and carpeting. I can safely use a welder without burning my eyes, and using hand tools is second nature to me.",
						"Trained"			= "I can build, repair, or dismantle most things, but will occasionally make mistakes and have things not come out the way I expected.",
						"Experienced"		= "I know how to seal a breach, rebuild broken piping, and repair major damage. I know the basics of structural engineering.",
						"Master"		= "I am a construction worker or engineer. I could pretty much rebuild the installation or ship from the ground up, given supplies, and you're efficient and skilled at repairing damage.")
	difficulty = SKILL_EASY

/decl/hierarchy/skill/engineering/electrical
	ID = "electrical"
	name = "Electrical Engineering"
	desc = "This skill describes my knowledge of electronics and the underlying physics. A low level of this skill implies I know how to lay out wiring and configure powernets, a high level of this skill is required for working complex electronic devices such as circuits or bots."
	levels = list( "Unskilled"			= "I know that electrical wires are dangerous and getting shocked is bad; I can see and report electrical malfunctions such as broken wires or malfunctioning APCs. I can change a light bulb, and I know how to replace a battery or charge up the equipment I normally use.",
						"Basic"				= "I can do basic wiring; I can lay cable for solars or the engine. I can repair broken wiring and build simple electrical equipment like light fixtures or APCs. I know the basics of circuits and understand how to protect myself from electrical shock. I can probably hack a vending machine.",
						"Trained"			= "I can repair and build electrical equipment and do so on a regular basis. I can troubleshoot an electrical system and monitor the installation power grid. I can probably hack an airlock.",
						"Experienced"		= "I can repair, build, and diagnose any electrical devices with ease. I know my way around APCs, SMES units, and monitoring software, and take apart or hack most objects.",
						"Master"		= "I am an electrical engineer or the equivalent. I can design, upgrade, and modify electrical equipment and I am good at maximizing the efficiency of my power network. I can hack anything on the installation I can deal with power outages and electrical problems easily and efficiently.")

/decl/hierarchy/skill/engineering/atmos
	ID = "atmos"
	name = "Atmospherics"
	desc = "Describes my knowledge of piping, air distribution and gas dynamics."
	levels = list( "Unskilled"			= "I know that the air monitors flash orange when the air is bad and red when it's deadly. I know that a flashing fire door means danger on the other side. I know that some gases are poisonous, that pressure has to be kept in a safe range, and that most creatures need oxygen to live. I can use a fire extinguisher or deploy an inflatable barrier.",
						"Basic"				= "I know how to read an air monitor, how to use an air pump, how to analyze the atmosphere in a space, and how to help seal a breach. I can lay piping and work with gas tanks and canisters. If I work with the engine, I can set up the cooling system. I can use a fire extinguisher easily and place inflatable barriers so that they allow convenient access and airtight breach containment.",
						"Trained"			= "I can run the atmospherics system. I know how to monitor the air quality across the installation detect problems, and fix them. I'm trained in dealing with fires, breaches, and gas leaks, and may have exosuit or fire gear training.",
						"Experienced"		= "My atmospherics experience lets I find, diagnose, and fix breaches efficiently. I can manage complex atmospherics systems without fear of making mistakes, and are proficient with all monitoring and pumping equipment at my disposal.",
						"Master"		= "I am an atmospherics specialist. I monitor, modify, and optimize the installation atmospherics system, and I can quickly and easily deal with emergencies. I can modify atmospherics systems to do pretty much whatever I want them to. I can easily handle a fire or breach, and are proficient at securing an area and rescuing civilians, but you're equally likely to have simply prevented it from happening in the first place.")

/decl/hierarchy/skill/engineering/engines
	ID = "engines"
	name = "Engines"
	desc = "Describes my knowledge of the various engine types common on space stations, such as the PACMAN, singularity, supermatter or RUST engine."
	levels = list( "Unskilled"			= "I know that \"delamination\" is a bad thing and that I should stay away from the singularity. I know the engine provides power, but you're unclear on the specifics. If I were to try to set up the engine, I would need someone to talk I through every detail--and even then, you'd probably make deadly mistakes.",
						"Basic"				= "I know the basic theoretical principles of engine operation. I can try to set up the engine by myself, but I am likely to need some assistance and supervision, otherwise I am likely to make mistakes. I am fully capable of running a PACMAN-type generator.",
						"Trained"			= "I can set up the engine, and I probably won't botch it up too badly. I know how to protect myself from radiation in the engine room. I can read the engine monitors and keep the engine going. An engine malfunction may stump you, but I can probably work out how to fix it... let's just hope I do so quickly enough to prevent serious damage.",
						"Experienced"		= "I have years of experience with engines, and can set them up quickly and reliably. I'm familiar with engine types other than the one I work with. ",
						"Master"		= "My engine is my baby and I know every minute detail of its workings. I can optimize the engine and I probably have my own favorite custom setup. I could build an engine from the ground up. When things go wrong, I know exactly what has happened and how to fix the problem. I can safely handle singularities and supermatter.")
	difficulty = SKILL_HARD

// Category: Research

/decl/hierarchy/skill/research/devices
	ID = "devices"
	name = "Complex Devices"
	desc = "Describes the ability to assemble complex devices, such as computers, circuits, printers, robots or gas tank assemblies (bombs). Note that if a device requires electronics or programming, those skills are also required in addition to this skill."
	levels = list( "Unskilled"			= "I know how to use the technology that was present in whatever society I grew up in. I know how to tell when something is malfunctioning, but I have to call tech support to get it fixed.",
						"Basic"				= "I use and repair high-tech equipment in the course of my daily work. I can fix simple problems, and I know how to use a circuit printer or autolathe. I can build simple robots such as cleanbots and medibots.",
						"Trained"			= "I can build or repair an exosuit or cyborg chassis, use a protolathe and destructive analyzer, and build prosthetic limbs. I can safely transfer an MMI or posibrain into a cyborg chassis.",
						"Experienced"		= "I have years of experience building or reverse-engineering complex devices. My use of the lathes and destructive analyzers is efficient and methodical. I can design contraptions to order, and likely sell those designs at a profit.",
						"Master"		= "I am an inventor or researcher. I can design, build, and modify equipment that most people don't even know exists. I am at home in the lab and the workshop and you've never met a gadget I couldn't take apart, put back together, and replicate.")

/decl/hierarchy/skill/research/science
	ID = "science"
	name = "Science"
	desc = "My experience and knowledge with scientific methods and processes."
	levels = list( "Unskilled"			= "I know what science is and probably have a vague idea of the scientific method from my high school science classes.",
						"Basic"				= "I keep up with scientific discoveries. I know a little about most fields of research. I have learned basic laboratory skills. I may read about science as a hobby; or I may be working in a field related to science and have learned about science that way. I could design a simple experiment.",
						"Trained"			= "I am a scientist, perhaps a graduate student or post-graduate researcher. I can design an experiment, analyze my results, publish my data, and integrate what you've learned with the research of other scientists. My laboratory skills are reliable, and I know how to find information I need when I research a new scientific topic.",
						"Experienced"		= "I am a junior researcher. I can formulate my own questions, use the tools at hand to test my hypotheses, and investigate entirely new phenomena. I likely have a track record of success in publishing my conclusions and attracting funding.",
						"Master"		= "I am a professional researcher, and I have made multiple new discoveries in my field. My experiments are well-designed. I am known as an authority in my specialty and my papers often appear in prestigious journals. I may be coordinating the research efforts of a team of scientists, and likely know how to make my findings appealing to investors.")

// Category: Medical

/decl/hierarchy/skill/medical/medical
	ID = "medical"
	name = "Medicine"
	desc = "Covers an understanding of the human body and medicine. At a low level, this skill gives a basic understanding of applying common types of medicine, and a rough understanding of medical devices like the health analyzer. At a high level, this skill grants exact knowledge of all the medicine available on the installation, as well as the ability to use complex medical devices like the body scanner or mass spectrometer."
	levels = list( "Unskilled"			= "I know basic first aid, such as how to apply a bandage or ointment to an injury. I can use an autoinjector designed for civilian use, probably by reading the directions printed on it. I can tell when someone is badly hurt and needs a doctor; I can see whether someone has a badly broken bone, is having trouble breathing, or is unconscious. I may not be able to tell the difference between unconscious and dead.",
						"Basic"				= "I have taken a first-aid training, nursing, or EMT course. I can stop bleeding, do CPR, apply a splint, take someone's pulse, apply trauma and burn treatments, and read a handheld health scanner. I probably know that Dylovene helps poisoning and Dexalin helps people with breathing problems; I can use a syringe or start an IV. I have been briefed on the symptoms of common emergencies like a punctured lung, appendicitis, alcohol poisoning, or broken bones, and though I can't treat them, I know that they need a doctor's attention. I can recognize most emergencies as emergencies and safely stabilize and transport a patient.",
						"Trained"			= "I am an experienced EMT, an experienced nurse, or a medical resident. I know how to treat most illnesses and injuries, though exotic illnesses and unusual injuries may still stump you. I have probably begun to specialize in some sub-field of medicine. In emergencies, I can think fast enough to keep my patients alive, and even when I can't treat a patient, I know how to find someone who can. I can use a full-body scanner, and I know something's off about a patient with an alien parasite or cortical borer.",
						"Experienced"		= "I am a senior nurse or paramedic, or a practicing doctor. I know how to use all of the medical devices available to treat a patient. My deep knowledge of the body and medications will let I diagnose and come up with a course of treatment for most ailments. I can perform a full-body scan thoroughly and find important information.",
						"Master"		= "I am an experienced doctor or an expert nurse or EMT. I have seen almost everything there is to see when it comes to injuries and illness and even when it comes to something I haven't seen, I can apply my wide knowledge base to put together a treatment. In a pinch, I can do just about any medicine-related task, but my specialty, whatever it may be, is where I really shine.")

/decl/hierarchy/skill/medical/anatomy
	ID = "anatomy"
	name = "Anatomy"
	desc = "Gives I a detailed insight of the human body. A high skill in this is required to perform surgery. This skill may also help in examining alien biology."
	levels = list( "Unskilled"			= "I know what organs, bones, and such are, and I know roughly where they are. I know that someone who's badly hurt or sick may need surgery.",
						"Basic"				= "I have taken an anatomy class and you've spent at least some time poking around inside actual people. I know where everything is, more or less. I could assist in surgery, if I have the required medical skills. If I have the forensics knowledge, I could perform an autopsy. If I really had to, I could probably perform basic surgery such as an appendectomy, but you're not yet a qualified surgeon and I really shouldn't--not unless it's an emergency. If you're a xenobiologist, I know how to take out slime cores.",
						"Trained"			= "I have some training in anatomy. Diagnosing broken bones, damaged ligaments, shrapnel wounds, and other trauma is straightforward for you. I can splint limbs with a good chance of success, operate a defibrillator competently, and perform CPR well. Surgery is still outside my training.",
						"Experienced"		= "I'm a surgical resident, or an experienced medical doctor. I can put together broken bones, fix a damaged lung, patch up a liver, or remove an appendix without problems. But tricky surgeries, with an unstable patient or delicate manipulation of vital organs like the heart and brain, are at the edge of my ability, and I prefer to leave them to specialized surgeons. I can recognize when someone's anatomy is noticeably unusual. I'm trained in working with several species, but you're probably better at surgery on my own species.",
						"Master"		= "I am an experienced surgeon. I can handle anything that gets rolled, pushed, or dragged into the OR, and I can keep a patient alive and stable even if there's no one to assist you. I can handle severe trauma cases or multiple organ failure, repair brain damage, and perform heart surgery. By now, you've probably specialized in one field, where I may have made new contributions to surgical technique. I can detect even small variations in the anatomy of a patient--even a changeling probably wouldn't slip by my notice, provided I could get one on the operating table.")

/decl/hierarchy/skill/medical/virology
	ID = "virology"
	name = "Virology"
	desc = "This skill implies an understanding of microorganisms and their effects on humans."
	levels = list( "Unskilled"			= "I know that diseases are contagious; you've probably heard I should wash my hands to stop their spread. I know that if you're sick, I can go to Medical and get treatment.",
						"Basic"				= "I know how viruses work, and I can use the machinery in the virology lab to analyze a virus or create an antibody. I know the principles of quarantine and I know how to keep a virus from spreading. I know that spaceacillin will help the body fight off a virus. However, you're not specialized in virology, and I probably don't have a whole lot of experience in dealing with viruses. If I am a medical doctor, I know how to treat symptoms and keep sick patients stable.",
						"Trained"			= "I know the full process of creating antibodies for a viral strain. I will generally be able to contain an infection and see that it is treated quickly.",
						"Experienced"		= "I know how to analyze, modify, and cure viruses, and could probably do so even without most of the equipment in the virology lab. I know how to trigger mutations in a virus and how to isolate genes. If I really wanted to, I could create a deadly virus, provided I got lucky with the mutations.",
						"Master"		= "I am a specialized virologist - either a medical doctor or a scientific researcher. I may be well-known in the field, having published in prestigious journals; or I may be a mad scientist working away in secret. I know how to use a virus as a tool or a weapon. I can cure any epidemic and if I wanted to, I could start one so deadly and contagious that my targets wouldn't know what hit them.")

/decl/hierarchy/skill/medical/chemistry
	ID = "chemistry"
	name = "Chemistry"
	desc = "Experience with mixing chemicals, and an understanding of what the effect will be. This doesn't cover an understanding of the effect of chemicals on the human body, as such the medical skill is also required for medical chemists."
	levels = list( "Unskilled"			= "I know that chemists work with chemicals; I know that they can make medicine or poison or useful chemicals. I probably know what an element is and have a vague idea of what a chemical reaction is from some chemistry class in my high school days.",
						"Basic"				= "I can make basic chemicals or medication--things like space cleaner or anti-toxin. I have some training in safety and I won't blow up the lab... probably.",
						"Trained"			= "I can accurately measure out reagents, grind powders, and perform chemical reactions. I may still lose some product on occasion, but are unlikely to endanger myself or those around you.",
						"Experienced"		= "I work as a chemist, or else I am a doctor with training in chemistry. If I am a research chemist, I can create most useful chemicals; if I am a pharmacist, I can make most medications. At this stage, you're working mostly by-the-book. I can weaponize my chemicals by making grenades, smoke bombs, and similar devices.",
						"Master"		= "I specialized in chemistry or pharmaceuticals; I am either a medical researcher or professional chemist. I can create custom mixes and make even the trickiest of medications easily. I understand how my pharmaceuticals interact with the bodies of my patients. I am probably the originator of at least one new chemical innovation.")
