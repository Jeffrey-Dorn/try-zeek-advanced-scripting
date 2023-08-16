title: records
pcaps: 

if you've used c structs then structs will be a breeze. structs are a collection of data the data inside the record will need a type and a name. you can initalize it in one of three ways 1 local r: RecordType = record($a = 7), 2 local r = RecordType($a = 7) and 3 local r: RecordType = [$a = 7, b=14]

in the zeek file you can see we create the record and then make a table whose contents is that record then when a new connection is made we check to see if its in the table if it isnt we initalize the record put it in the table and then update it.
