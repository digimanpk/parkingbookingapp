from flask import Blueprint, render_template
from flask_user import roles_required

from model import ParkingSlots, Bookings, Feedback

admin_bp = Blueprint('admin', __name__, url_prefix='/admin')


# Admin Specific Routes

@roles_required("Admin")
@admin_bp.route('/view_booking')
def view_booking():
    all_parking_slots = ParkingSlots.query.join(Bookings).all()
    return render_template("admin/viewparking-admin.html", slots=all_parking_slots)


@roles_required("Admin")
@admin_bp.route('/view_feedback')
def view_feedback():
    fb = Feedback.query.all()
    return render_template("admin/viewfeedback-admin.html", feedbacks=fb)
