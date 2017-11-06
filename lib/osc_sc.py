import OSC
import argparse

def send(name, arguments):
    msg = OSC.OSCMessage("/" + name)
    msg.extend(arguments)
    oscClient = OSC.OSCClient()
    oscClient.sendto(msg,("localhost", 57120))
