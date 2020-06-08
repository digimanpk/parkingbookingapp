from flask_sqlalchemy import SQLAlchemy
from flask_user import UserMixin

db = SQLAlchemy()


class User(db.Model, UserMixin):
    __tablename__ = 'users'
    id = db.Column(db.Integer, primary_key=True)

    # User Authentication fields
    email = db.Column(db.String(255), nullable=False, unique=True)
    email_confirmed_at = db.Column(db.DateTime())
    username = db.Column(db.String(50), nullable=False, unique=True)
    password = db.Column(db.String(255), nullable=False)

    # User fields
    active = db.Column(db.Boolean()),
    first_name = db.Column(db.String(50), nullable=False)
    last_name = db.Column(db.String(50), nullable=False)
    roles = db.relationship('Role', secondary='user_roles')
    feedbacks = db.relationship('Feedback', lazy='select',
                                backref=db.backref('user', lazy='joined'))
    bookings = db.relationship('Bookings', lazy='select',
                               backref=db.backref('user', lazy='joined'))


# Define the Role data-model
class Role(db.Model):
    __tablename__ = 'roles'
    id = db.Column(db.Integer(), primary_key=True)
    name = db.Column(db.String(50), unique=True)


# Define the UserRoles association table
class UserRoles(db.Model):
    __tablename__ = 'user_roles'
    id = db.Column(db.Integer(), primary_key=True)
    user_id = db.Column(db.Integer(), db.ForeignKey('users.id', ondelete='CASCADE'))
    role_id = db.Column(db.Integer(), db.ForeignKey('roles.id', ondelete='CASCADE'))


class Bookings(db.Model):
    __tablename__ = 'bookings'
    id = db.Column(db.Integer(), primary_key=True)
    user_id = db.Column(db.Integer(), db.ForeignKey('users.id'))
    parking_slot_id = db.Column(db.Integer(), db.ForeignKey('parking_slots.id'))
    start_time = db.Column(db.DateTime())
    end_time = db.Column(db.DateTime())

    @classmethod
    def get_booking_by_slot_id_and_time(cls, slot_id, starttime, endtime):
        booking = Bookings.query.filter_by(parking_slot_id=slot_id, start_time=starttime, end_time=endtime).first()
        return booking


class ParkingSlots(db.Model):
    __tablename__ = 'parking_slots'
    id = db.Column(db.Integer(), primary_key=True)
    name = db.Column(db.String(50))
    zone = db.Column(db.String(50))
    bookings = db.relationship('Bookings', lazy='select',
                               backref=db.backref('parking_slots', lazy='joined'))

    @classmethod
    def get_booked_slots(cls, starttime, endtime):
        booked_slots = cls.query.join(Bookings).filter(
            Bookings.start_time.between(starttime, endtime) | Bookings.end_time.between(starttime, endtime)).all()

        booked_slot_ids = [slot.id for slot in booked_slots]
        return booked_slot_ids

    @classmethod
    def get_user_booked_slots(cls, starttime, endtime, user_id):
        booked_slots = cls.query.join(Bookings).filter(
            Bookings.start_time.between(starttime, endtime) | Bookings.end_time.between(starttime, endtime)).filter(
            Bookings.user_id == user_id).all()

        user_booked_slot_ids = [slot.id for slot in booked_slots]
        return user_booked_slot_ids


class Feedback(db.Model):
    __tablename__ = 'feedback'
    id = db.Column(db.Integer(), primary_key=True)
    user_id = db.Column(db.Integer(), db.ForeignKey('users.id'))
    feedback = db.Column(db.String(500))
