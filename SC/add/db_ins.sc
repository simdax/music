Music {

	var <>doc;
	var db;
	var <dict;

	*new { |doc|
		^super.newCopyArgs(doc).init;
	}
	init {
		db = Db();
		db.user = nil;
		db.host = "localhost";
//		OSCdef(\update,	{this.update}, \update);
		this.update;
	}
	update {
		dict = db.get(doc)
	}
	doesNotUnderstand{ |sel|
		^dict[sel]
	}
}