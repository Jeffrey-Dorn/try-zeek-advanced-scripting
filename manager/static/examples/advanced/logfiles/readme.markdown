title: logging framework
pcaps: 
Logging Framework
================

* the Logging framework allows you to control what gets logged. there are three main abstractions. one is streams where it corresponds to one log. filters filter what the steam writes defaulting with one filter that logs everything. finally there are writers which are responsible for the output format default is ascii writer (tab-separated ASCII files). using these three abstractions you can modify zeeks loggin in lots of ways.

01 the hook is executed when the con log is generated. we then check to see if the response port is in the filtered ports log if it is then we break from the hook which stops the log from being written

02 when zeek init is called we create a new log stream the first parameter is the id enum and the second is a record that defines what goes in the log. this function returns a boolean based on if it can sucessfully create the stream. get filter gets the filter that is on an existing stream, the first parameter is naming the stream that you want to get the filter of and the second is the name of filter that you want add filters is simmillar to add stream the first paramter is the id of the stream filter the second is a record that defines the logging parameters. then its written in when the entry expires from summary popoulating aconn\_info log before wrting since it writtes a record to the log.

03 is very simmilar to 02 just expanding the conn\_info record so that the ip is also logged

04 is a more memory efficent version of the previous examples. it uses an opaque of cardinality these data structures are desribed in the section probabalistic structs. all thats needed for this program is that hosts is used to count the number of unique hosts.


