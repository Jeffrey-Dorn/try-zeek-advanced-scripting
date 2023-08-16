title: tables
pcaps:
#Tables


* in 03 we see the creation of a two different tables. then if there is a service that doesnt exist in our existing table we will initalize an entry for that port. next we increase the counter associated with that port in our table by one. we do the same with remote hosts just instead of ports its addresses. finally we print out some info on the connections seen

* in 04 we do basically the same thing but with a more complicated tables one has two index values the other is a set of tables these work about how you would expect. for the two index table its the same as before with another index that you have to check; this is pretty easy since you can just use [index1, index2] to check for membership. the table of sets just stores every address that it runs into in the set.

* in 05 we basically do the same as 04 with a little more verbose output.

* in 06-tables-expire-func-demo we are introduced to the concept of expriring a piece of data from the table. all thats going on in this script is that use the attribute &create\_expire to timeout the elements in the table. create expire just means that the table should expire an element x time after creation. the expire\_func attribute allows us to set an expire function that will be called when it istime to expire an element in our table. the first argument in the create expire function must have the same type as the container it expires. Then it can take a variable number of arguments. this number is equal to the number of indexes in the container 
	* lets look at what happens when an entry expires. the 10 hrs pass and then it calls expire distinct\_peers it prints a bunch of information about the table and then returns an interval of 0 seconds which seems weird however this interval indicates the amount of additional time to wait before expiring the element and calling the function again

* in file 07 we see the expire function being used to report on chatty ip pairs where after an hour of its creation it will report and then every two hours after that.

* file 08 is does exatly what one would guess after the title it collects all the servies on an ip using a table of sets.
