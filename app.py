from flask import Flask, jsonify

app = Flask(__name__)


@app.route("/")
def home():
    return "Hello, DevSecOps on AWS!"


@app.route("/health")
def health():
    return jsonify(status="ok")
