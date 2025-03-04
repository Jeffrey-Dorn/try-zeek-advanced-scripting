module training;

redef exit_only_after_terminate = T  ;

global services: table[addr, port] of count ;

global expire_distinct_peers: function( t: table[addr] of set[addr], idx: addr): interval ;

global distinct_peers: table[addr] of set[addr] &create_expire=10 sec &expire_func=expire_distinct_peers ;


event zeek_init()
    {
    print fmt ("====================================================");
    print fmt ("No: your process is not frozen");
    print fmt ("Note: in this we are using expiration function");
    print fmt ("and since we are running on a trace and not live");
    print fmt ("traffic, I've put in a ");
    print fmt ("'redef exit_only_after_terminate = T ;' ");
    print fmt ("so zeek will continue waiting until you ^C out");
    print fmt ("of this run");
    print fmt ("====================================================");
    }

event new_connection(c: connection)
{

	local orig=c$id$orig_h ;
	local resp=c$id$resp_h ;
	local service=c$id$resp_p ;


	if ([resp, service] !in services)
		services[resp, service] = 0 ;

	services[resp, service]+= 1  ;

	if (orig !in distinct_peers)
		distinct_peers[orig] = set();

	if (resp !in distinct_peers[orig])
		add distinct_peers[orig][resp];

#	n = |distinct_peers[orig]|;

}


function expire_distinct_peers(t: table[addr] of set[addr], idx: addr): interval
{

	print fmt ("uniq services seen %s", |services|);
	print fmt ("Uniq remote IPs seen %s", |distinct_peers|);

    print fmt ("");
	print fmt ("Cleaner version: please ^C to exit out of zeek") ;
    print fmt ("");

	local iplist = "" ;

	for (rh in distinct_peers)
		{
			for (i in distinct_peers[rh])
			iplist += fmt ("%s, ", i) ;

			print fmt ("%s connected to %s hosts - %s", rh, |distinct_peers[rh]|, iplist);
		}

	return 0 secs;


}
