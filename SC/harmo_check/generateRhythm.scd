{ | nb |
	var res = [];
	case
	{nb == 0}{ 4.partition(rand(4)) }
	{
		res = res.add(partition.(nb - 1));
		res = res.add(partition.(nb - 1));
		res.flat;
	};
};
