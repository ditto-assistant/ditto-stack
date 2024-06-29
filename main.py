import gevent.subprocess

def start_ditto_stack():
    """
    Boots the Ditto Server for API calls.
    """
    print("\n[Starting Ditto Stack...]")
    gevent.subprocess.call(["python", "assistant/main.py"])
    gevent.subprocess.call(["python", "nlp_server/main.py"])
    gevent.subprocess.call(["python", "vision_server/main.py"])

    # cd into ditto-app/ditto-client/ and run npm run electron
    gevent.subprocess.call(["npm", "run", "electron"], cwd="ditto-client")

if __name__ == "__main__":
    start_ditto_stack()