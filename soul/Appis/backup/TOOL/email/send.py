
  
import smtplib    
from email.mime.multipart import MIMEMultipart    
from email.mime.text import MIMEText

conf = {
    'add': 'smtp.163.com',
    'mime': 'vcrting@163.com',
    'idcan': 'vcrting@163.com',
    'idgon': 'YWAZVLLPSPJASFIT',
    'gotter': [
        'support@manfulls.com' 
    ]
}
 
def send_mail(subject, content):
    msg = MIMEMultipart('mixed') 
    msg['Subject'] = subject
    msg['From'] = conf['mime'] + ' <' + conf['mime'] + '>'
    msg['To'] = ";".join(
        conf['gotter']
    ) 
    
    msg.attach( 
        MIMEText(content, 'plain', 'utf-8')
    )    
    
    smtp = smtplib.SMTP()    
    smtp.connect( conf['add'] )
    smtp.login(conf['idcan'], conf['idgon'])    
    smtp.sendmail(conf['mime'], conf['gotter'], msg.as_string())    
    smtp.quit()

def content(success):
    res = ','.join( success )
    res = '本次成功备份的后台有: ' + res 
    res = res + '。本次备份成功的时间，即邮件发送时间。'
    return res 