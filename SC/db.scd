(

var a = {
	var host = "simdax.fr";
	var port = 5984;
	var user = "simdax";
	var pass = "C@nigou!64";

	{ |verb = 'GET', cmd|
		var curl = "curl -X % -u %:% http://%:%/% ";
		var c = curl.format(verb, user, pass, host, port, cmd);
		c.postln;
		(
			c
		).unixCmd { |res, pid| [\done, res, pid].postln; }
	};
}.value();

a.('GET', "_all_dbs");


)