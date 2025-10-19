from flask import Flask
import os

# Create an instance of the Flask application
app = Flask(__name__)

# Define a route for the root URL ("/")
@app.route("/")
def hello_world():
    return '<h1><center>Flask Application Version2</center></h1>'

# Run the application if the script is executed directly
if __name__ == "__main__":

    app_port = os.getenv('APP_PORT', 8080)
    # Use port mentioned in env or else use 8080
    app.run(host='0.0.0.0',port=app_port,debug=True)
