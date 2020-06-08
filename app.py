from config import Config
from flask import Flask, render_template
from flask import Flask, render_template
from flask_user import login_required, UserManager

import admin
import booking
from model import db, User


# Application accessible at : http://127.0.0.1:5000
# Run: flask run --host=0.0.0.0

def create_app():
    """ Flask application factory """

    # Create Flask app load app.config
    app = Flask(__name__)
    app.config.from_object(__name__ + '.Config')

    db.init_app(app)
    user_manager = UserManager(app, db, User)

    app.register_blueprint(booking.booking_bp)
    app.register_blueprint(admin.admin_bp)

    @app.route('/')
    def index():
        return render_template("index.html")

    @login_required
    @app.route('/menu')
    def menu():
        return render_template("menu.html")

    return app
