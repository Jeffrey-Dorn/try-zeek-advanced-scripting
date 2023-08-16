title: notices
pcaps: 
#Notices

zeek doesnt know what is malicous or "bad" traffic it justs monitors activity and at most flags traffic as potentailly interesting. it is up to you to tell zeek what should set off alarm bells. the way that zeek raises flags is through the notice framework this is also how you would sound the alarm bells.


* in script 01-looking at notice records we see that local and remote are added to the Notice::Type enum this is because the $note stands for notice and has to be a notice::type. identifyer isused to show what kind of content is in the notice allows you to show relation to previous notices. finally the supress feild is for how long until another notice is generated this just helps to prevent unessicary noise. finally msg is for you to put a human readable mesage about the notice. 

* in script 02 we create a new notice with the type PortSeen. look at line 22 and try to figure out what will be logged in the notice log and then check it out.

* in script 3 we start to expand what we can do with notices by applying the NOtice::policy hook this alows us to take actions when a Notice is raised and allows you to modicy the notice before its sent to other actions. in our script here we use it to send an email when we see a Portseen Notice. the email that is emailed defaults to the Notice::mail\_dest hoever this can be overriden with ZeekControl MailTo or email\_dest feild in the Notice:Info record (in this script thats n)

* script 4 we expand the Notice::policy to email when there is a notice that has a not of local and the sorce is in local nets then we send an email otherwise it goes to the log

* Script 5 we use the supress\_for attribute to supress the notice for an hour. what this does is stops the notice from generating again for an hour so you wont get spammed for the same notice.

