+ Dictionary
{
	*newFrom { arg aCollection;
		var newCollection = this.new(aCollection.size);
		aCollection.keysValuesDo({ arg k,v;
			newCollection.put(k.asSymbol,v) });
		^newCollection
	}
}
