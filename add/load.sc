+ String
{
	my_load{ |...args|
		^("../" ++ this ++ ".scd").resolveRelative.load.value(*args)
	}

}
