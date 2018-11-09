from django.core.mail import send_mail,send_mass_mail

class SendEmail(object):
    subject = '重置密码'
    message = '请单击此连接重置您的密码'
    from_email = '485176679@qq.com'

    def send(self,to_user):
        message = self.message + 'resetpassword'
        send_mail(subject=self.subject,message=message,from_email=self.from_email,recipient_list=[to_user,])
