import datetime

from flask import Blueprint, request, render_template
from flask_user import current_user, login_required

from model import db, ParkingSlots, Bookings, Feedback
from util import Mailer

# Application accessible at : http://127.0.0.1:5000
# Run: flask run --host=0.0.0.0


booking_bp = Blueprint('parkingbooking', __name__, url_prefix='/')


@login_required
@booking_bp.route('/datetime_select', methods=("GET", "POST"))
def datetime_select():
    slots = ParkingSlots.query.all()
    return render_template("booking/parkingselector.html", slots=slots)


@login_required
@booking_bp.route('/do_booking', methods=("GET", "POST"))
def do_booking():
    slots = ParkingSlots.query.all()
    delta = datetime.timedelta(hours=int(request.values['duration']))
    starttime = datetime.datetime.strptime(request.values['date'] + " " + request.values['time'], '%Y-%m-%d %H:%M')
    endtime = starttime + delta
    booked_slots = ParkingSlots.get_booked_slots(starttime, endtime)
    user_booked_slots = ParkingSlots.get_user_booked_slots(starttime, endtime, current_user.id)

    return render_template("booking/parkingslotselector.html", slots=slots, booked_slots=booked_slots,
                           user_booked_slots=user_booked_slots, starttime=starttime, endtime=endtime)


@login_required
@booking_bp.route('/cancel_slot', methods=["POST"])
def cancel_slot():
    slot_id = int(request.values['slot_id'])
    starttime = request.values['starttime']
    endtime = request.values['endtime']
    booking = Bookings.get_booking_by_slot_id_and_time(slot_id, starttime, endtime)
    db.session.delete(booking)
    db.session.commit()

    return render_template("booking/cancelled.html")


@login_required
@booking_bp.route('/select_slot', methods=("GET", "POST"))
def select_slot():
    slot_id = request.values['slot_id']
    starttime = request.values['starttime']
    endtime = request.values['endtime']
    try:
        user_id = current_user.id
        booking = Bookings(parking_slot_id=slot_id, user_id=user_id, start_time=starttime, end_time=endtime)
        db.session.add(booking)
        db.session.commit()
        slot = ParkingSlots.query.filter_by(id=slot_id).first()
        Mailer.send_message(
            current_user.email, "Parking Booking Successful", "mail/parking_confirmed.html", slot_name=slot.name,
            booking_start_time=booking.start_time, booking_end_time=booking.end_time)
        return render_template("booking/bookingcomplete.html")
    except Exception as e:
        print(e)
        return render_template("error.html")


@login_required
@booking_bp.route('/feedback')
def feedback():
    return render_template("booking/feedback.html")


@login_required
@booking_bp.route('/feedback_submitted', methods=["POST"])
def feedback_submitted():
    user_id = current_user.id
    fb = request.values['feedback']
    new_feedback = Feedback(user_id=user_id, feedback=fb)
    db.session.add(new_feedback)
    db.session.commit()
    return render_template("booking/feedbacksubmitted.html")
