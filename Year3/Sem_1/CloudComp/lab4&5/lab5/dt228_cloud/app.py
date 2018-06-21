from flask import Flask, render_template
app = Flask(__name__)

@app.route("/")
def hello(name=None):
    return render_template('hello.html', name=name)

@app.route("/hello")
def sayHello():
	return "hello\n"

@app.route('/user/<username>')
def show_user_profile(username):
    return 'User %s' % username

@app.route("/post/80")
def post():
	return "Post 80\n"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080, debug=True)
