from flask import Flask
from flask_socketio import SocketIO
import logging
from flask_cors import CORS

# Set up logger
log = logging.getLogger('websocket_server')
logging.basicConfig(level=logging.INFO)

# initialize the Flask app
app = Flask(__name__)
CORS(app, resources={r"/*": {"origins": "*"}})  # Allow all origins
socketio = SocketIO(app, cors_allowed_origins="*")


@socketio.on('connect')
def handle_connect():
    print('Client connected')

@socketio.on('disconnect')
def handle_disconnect():
    print('Client disconnected')

@socketio.on('subscribe')
def handle_subscribe(data):
    channel = data['channel']
    print(f'Client subscribed to channel: {channel}')

@socketio.on('publish')
def handle_publish(data):
    channel = data['channel']
    message = data['message']
    print(f'Publishing message to channel {channel}: {message}')
    socketio.emit(channel, message)

if __name__ == '__main__':
    
    log.info("Starting websocket server on localhost:42033")
    # run localhost on port 42033
    socketio.run(app, host='0.0.0.0', port=42033)
