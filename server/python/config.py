from flask_socketio import send, emit
from osc_sc import send


def config(socketio):
    @socketio.on('update')
    def handle_message(message):
     	send('update', 546) 

    @socketio.on('json')
    def handle_json(json):
        send(json, json=True)

    @socketio.on('my event')
    def handle_my_custom_event(json):
        emit('my response', json)
