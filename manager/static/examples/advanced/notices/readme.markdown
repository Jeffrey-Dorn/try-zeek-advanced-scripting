#Notices

zeek doesnt know what is malicous or "bad" traffic it justs monitors activity and at most flags traffic as potentailly interesting. it is up to you to tell zeek what should set off alarm bells. the way that zeek raises flags is through the notice framework this is also how you would sound the alarm bells.


* in script 01-looking at notice records we see that local and remote are added to the Notice::Type enum this is because the $note stands for notice and has to be a notice::type. identifyer isused to show what kind of content is in the notice allows you to show relation to previous notices. finally the supress feild is for how long until another notice is generated this just helps to prevent unessicary noise. finally msg is for you to put a human readable mesage about the notice. 

* in script 02 we create a new notice with the type PortSeen. 
