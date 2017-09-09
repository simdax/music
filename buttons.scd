(
var a = { |array|
	var first;
	var i = 0;
	while {array[i + 1].notNil && (array[i] == array[i + 1])}{i = i + 1};
	if (i == (array.size - 1))
	{array.collect(0)}
	{
		first = (array[i + 1] - array[i]).sign * -1;
		array = array.differentiate.sign;
		array[0] = first;
		array.inject([], {|a, b|
			if(b == 0){b = a.last};
			a ++ b;
		});
	}
};
//tests
a.([2]).postln;
a.([2, 2]).postln;
a.([2, 2, 1]).postln;
a.([1, 2, 2, 1]).postln;
a;
)