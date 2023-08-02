#Events
##about events
events are the backbone of zeek. they are simmilar to functions we handle events with event handlers which are defined just like functions with two differences one you cannot return anything and two you cannot call the handler instead events get called in one of three ways
        * the event engine
        * using the event statement in a script which immediatlely invokes the event handler
        * using the schedule expression in a script this delays the invocation of the handler for a specified interval
read more[here](https://docs.zeek.org/en/current/script-reference/types.html#event)

you can have multiple handlers for a given event and you can change the execution order using the &priority attribute.

##file breakdown
file 01 is simple and is just there to help you learn a little bit about the connection record.

file 02 is basically the same however it is the connection info when the connection is removed as such there is a lot more data here compare it to the output from file 01

file 03 shows more built in events

file 07 creates a new event handler to create our own event so far we have just been adding new handlers for already existing events. since you cant call an event we use the event statement in order to execute our new event.

file 08 shows the other way we can invoke an event using the schedule expression.
~                                                                                         
