JackMidi{
	*check{
		if (MIDIClient.initialized)
		{}
		{MIDIClient.init}
	}
	*connect{ | in, out |
		var cmd =
		"a=$(jack_lsp | grep Super | grep out0);"
		"jack_connect" + "$a".quote + "zynaddsubfx:midi_input";
		this.check();
		cmd.unixCmd;
	}
}