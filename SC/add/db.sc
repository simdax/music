Db{
	classvar <>host = "simdax.fr";
	classvar <>port = 5984;
	classvar <>user = "simdax";
	classvar <>pass = "C@nigou!64";
	classvar <>db = "music";
	classvar curl = "curl -X % -u %:% http://%:%/%/%?";
	classvar curl_no_user = "curl -X % http://%:%/%/%?";

	*exec{ | verb = 'GET', cmd, options|
		var c;
		if (user.asBoolean)
		{
			c = (curl.format(verb, user, pass, host, port, db, cmd ? '_all_docs') ++ options ? "").postln;
		}
		{
			c = (curl_no_user.format(verb, host, port, db, cmd ? '_all_docs') ++ options ? "").postln;
		};
		^c.unixCmdGetStdOut;
	}
	*insert{ |doc|
		var opt = " -d '" + doc + "' -H Content-Type:application/json";
		var res = this.exec("POST", "", opt);
		^this.returns(res);
	}
	*doesNotUnderstand{ |sel ... args|
		var res = this.exec(sel.asString.toUpper, args[0], args[1]);
		^this.returns(res);
	}
	*returns{ |res|
		res.postln;
		try {
			^Event.newFrom(res.parseYAML);
		} {
			error(res.parseYAML).throw;
		}
	}
}
