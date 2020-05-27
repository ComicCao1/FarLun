/*
Research and Development System. (Designed specifically for the /tg/station 13 (Space Station 13) open source project)

///////////////Overview///////////////////
This system is a "tech tree" research and development system designed for SS13. It allows a "researcher" job (this document assumes
the "scientist" job is given this role) the tools necessary to research new and better technologies. In general, the system works
by breaking existing technology and using what I learn from to advance my knowledge of SCIENCE! As my knowledge progresses,
I can build newer (and better?) devices (which I can also, eventually, deconstruct to advance my knowledge).

A brief overview is below. For more details, see the related files.

////////////Game Use/////////////
The major research and development is performed using a combination of four machines:
- R&D Console: A computer console that allows me to manipulate the other devices that are linked to it and view/manipulate the
technologies I have researched so far.
- Protolathe: Used to make new hand-held devices and parts for larger devices. All metals and reagents as raw materials.
- Destructive Analyzer: I can put hand-held objects into it and it'll analyze them for technological advancements but it destroys
them in the process. Destroyed items will send their raw materials to a linked Protolathe (if any)
- Circuit Imprinter: Similar to the Protolathe, it allows for the construction of circuit boards. Uses glass and acid as the raw
materials.

While researching I am dealing with two different types of information: Technology Paths and Device Designs. Technology Paths
are the "Tech Trees" of the game. I start out with a number of them at the game start and they are improved by using the
Destructive Analyzer. By themselves, they don't do a whole lot. However, they unlock Device Designs. This is the information used
by the circuit imprinter and the protolathe to produce objects. It also tracks the current reliability of that particular design.

//EXISTING TECH
Each tech path should have at LEAST one item at every level (levels 1 - 20). This is to allow for a more fluid progression of the
researching. Existing tech (ie, anything I can find on the station or get from the quartermaster) shouldn't go higher then
level 5 or 7. Everything past that should be stuff I research.

*/