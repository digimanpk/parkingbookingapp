import os

basedir = os.path.abspath(os.path.dirname(__file__))


class Config(object):
    DEBUG = True
    TESTING = False
    CSRF_ENABLED = True
    SECRET_KEY = 'ABCDYUTYUTYUTYYTTYUTYUTYUYUUYUTYUXCVB!@3423432423423423423o99'
    SQLALCHEMY_DATABASE_URI = "postgresql+psycopg2://postgres:mysecretpassword@192.168.8.100/parking_one"
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SQLALCHEMY_ECHO = True

    USER_ENABLE_USERNAME = True
    USER_ENABLE_CHANGE_PASSWORD = True
    USER_ENABLE_REGISTER = True
    USER_AFTER_LOGOUT_ENDPOINT = True
    USER_AUTO_LOGIN_AFTER_REGISTER = True
    USER_EMAIL_SENDER_EMAIL = "admin@parkingapp.test"
    USER_AFTER_LOGOUT_ENDPOINT = 'user.login'
    USER_AFTER_LOGIN_ENDPOINT = 'menu'

    USER_APP_NAME = 'Parking Booking App'

    # Flask-Mail SMTP server settings
    MAIL_SERVER = 'smtp.gmail.com'
    MAIL_PORT = 465
    MAIL_USE_SSL = True
    MAIL_USE_TLS = False
    MAIL_USERNAME = ''
    MAIL_PASSWORD = ''
    MAIL_DEFAULT_SENDER = 'admin@parkingbooking.app'

    PARKING_SLOT_TIMES: {
        1: "1 HR",
        2: "2 HRS",
        3: "3 HRS",
        4: "4 HRS"
    }
