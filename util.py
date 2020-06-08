from flask import current_app, render_template


class Mailer:

    @classmethod
    def send_message(cls, email, subject, template_name, **kwargs):
        htmlbody = render_template(template_name, **kwargs)
        current_app.user_manager.email_adapter.send_email_message(email, subject,
                                                                  htmlbody,
                                                                  current_app.config['USER_EMAIL_SENDER_EMAIL'],
                                                                  current_app.config['USER_EMAIL_SENDER_EMAIL'])
