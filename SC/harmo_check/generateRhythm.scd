{ | nb |
	var res = [];
	case
	{nb == 0}{ 4.partition(1 + rand(2)) }
	{
		res = res.add(thisFunction.(nb - 1));
		res = res.add(thisFunction.(nb - 1));
		res.flat;
	};
};
