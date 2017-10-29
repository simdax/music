Colors {
	*new{ | color |

	}
}

Console{
	*log{ |txt, color, n = ""|
		var cmd = ("echo % " + "\\033[%m %".quote).format(n, color, txt);
		cmd.systemCmd();
	}
}