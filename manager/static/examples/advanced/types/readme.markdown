title: datatypeAgain 
pcaps: 

## quick crash course

* bool: true or false represented by constants T and F. supports ++ for equality, != for inequality, && for and, || for or, and ! for negation.

* int: a signed 64-bit integer supports:  arithmetic operators (\+, \-, \*, /, %), comparison operators (==, !=, <, <=, >, >=), assignment operators (=, +=, -=), pre-increment (++), pre-decrement (--).

* count: an unsigned 64-bit integer supports same operators as int however 

* double: a double precision floating point number. doubles support the following operators: : arithmetic operators (\+, \-, \*, /), comparison operators (==, !=, <, <=, >, >=), assignment operators (=, +=, -=).

* time: the time type represents an absolute time. you cannot specift a time constant, however you can use a built in function such as current\_time or double\_to\_time to assign a value to a time variable. zeek built in functions use unix time.

* interval: writen like 6 min or 30.5 secs (a number followed by a unit of time) the whitespace between the number and unit of time and the s on unit of time is optional. intevals support the following operators: artihmetic operators(+,-),comparison operators (==, !=, <, <=, >, >=), assignment operators (=, +=, -=)

* string: string constants are created by enclosing text with ". strings cannot span multiple lines. there is support for escape sequences using \ if zeek does not recognize an escape sequence then it will ignore the backslash. assignement is done with = , +=. comparison operators (==,!=,<,<=,>,>=). you can also concatenate strings with + and find the length of a string using pipes ie |"123"| would yeild 3. substring searching is acomplished using the in or !in operators.

* port: port represents port numbers which is writen as an unsigned integer followed by either /tcp, /udp, /icmp or /unknown. there is support for comparison operators (200~==, !=, <, <=, >, >=). if you compare across protocols note unkown < tcp< udp < icmp. getting the transport protocol and numeric value of a port isnt hard as there are already build in functions.

* addr: addr represents an IP format with support for IPv4 and IPv6. IPv4 is written in dotted quad format ie 255.0.123.1 whereas a IPv6 uses colon separated hexadecimal form. then encased in square brackets ie [aaaa:bbbb:cccc:dddd:eeee:ffff:1111:2222].

* subnet:you can compare adresses for eqality and mask subnets with / for example 192.168.0.0/16 youcan check equality of subnets  as well as inlcusion by using in or !in operators.


|     Event      |     Function     |     Hook      |
|:---		 |	:----:      |    -----:     |
|Event called in one of the following three ways <ul><li>From the event engine itself (after each packet is process event queue is flushed)<li> <li>With the event statement from a script <li> <li>Via the schedule expression in a script <li><ul> |Functions can be called inside an event or hook or another function |Hooks are invoked/called similar to functions.|
|Does not execute immediately but rather gets added to an event queue which executes events in the ordered fashion.| gets executed immediately| gets executed immediately nd they do not get scheduled through an event queue.|
|CANNOT return any value |may or may not return a value |may or may not return a value |
|Multiple event handler bodies can be defined for the same event handler identifier and the body of each will be executed in turn. | Only single body of a function can be defined (Unless declared with default parameters) | Multiple Hook bodies can be defined for the same hook identifier and the body of each will be executed in turn.|
|Multiple Hook bodies can be defined for the same hook identifier and the body of each will be executed in turn.| No priority for functions| Ordering of execution can be influenced with &priority.|
|Multiple alternate event prototype declarations are allowed, but the alternates must be some subset of the first, canonical prototype and arguments must match by name and type.| If a function was previously declared with default parameters, the default expressions can be omitted when implementing the function body and they will still be used for function calls that lack those arguments.| Argument types must match for all hook handlers and any forward declaration of a given hook.| 
| event executes to completion | can return (with a value) | Exit out of a hook using either <ul> <li>break - immediate exit (short-circuit) <li><li>return - other hooks of same identifier continue to execute as per &priority ordering<li><ul>|

maybe i was a little misleading calling this a quick crash course. If you want to learn more go [here](https://docs.zeek.org/en/master/) then on the left navigate to script reference then types!

