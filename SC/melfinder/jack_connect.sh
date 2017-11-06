a=$(jack_lsp | grep "Super" | grep "out0") 
jack_connect "$a" zynaddsubfx:midi_input
