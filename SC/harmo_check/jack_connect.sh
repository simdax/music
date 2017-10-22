echo activation de porc!!!!\n\n\n\n\n\n\n
jack_lsp
a=$(jack_lsp | grep "Super" | grep "out0") 
echo 'gros client ' "$a"
jack_connect "$a" zynaddsubfx:midi_input
