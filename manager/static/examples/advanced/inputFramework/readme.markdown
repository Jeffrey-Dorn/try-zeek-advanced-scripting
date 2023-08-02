
INPUT framework
The input framework allows Zeek to import large amounts of data from external files. By default, Zeek input reads a tab-separated ASCII file.

01, we see in the export section that there are two records, one with the name IDX and the other with the name value. These two records are necessary for creating a table that will contain the contents of the input file. there is also a blacklist which is gonna be the table that the data will go into. The blacklist file line is just getting the path to blacklist. the file is given the current working directory

03 this is pretty simillar to 01; however the big difference is in the input::add\_table line where we use $mode=Input::REREAD. this mode allows for the input file to be reread whenever a change is made to it.

04 in 04, the new thing is the event line. the line event is linked to the input table by using $ev = [eventname] in the input::add\_table command. this event runs before an entry is added to the table. TPE is the type of modification made. This can be NEW, CHANGE, or REMOVED. left stores the index, and right is the contents, so you can access the upcoming contents by indexing the blacklist\_file with the ip that you want

05 file 05 just shows you the 3 different types of types that can be returned. you can get this output by opening the CURRENT.24hrs\_ZEEK file and modifying, deleting, or adding an entry. what do you think a modification of an IP address is? if you change the ip to one that doesn't exist in the table, it will be new and deleted because the IP is the index for the table, so modifying it will create a new table entry. then there will be a deletion of the old IP address because that no longer exists in the table. However, if you change the ip to one that is in the file, just further. If you change the ip to one that, however, if you change the other two fields, you just get a change.

