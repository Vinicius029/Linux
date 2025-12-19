import smtplib
from email.message import EmailMessage
import ssl

# ===== CONFIGURAÇÕES =====
SMTP_SERVER = ""
SMTP_PORT = 465
EMAIL = ""
SENHA = ""  
EMAIL_DESTINATARIO = ""

# ===== CRIAÇÃO DO EMAIL =====
msg = EmailMessage()
msg["From"] = EMAIL
msg["To"] = EMAIL_DESTINATARIO
msg["Subject"] = "Server Check"

msg.set_content("""
Este é um e-mail enviado automaticamente via Python 🚀
""")

# ===== ENVIO =====
context = ssl.create_default_context()

try:
    with smtplib.SMTP_SSL(SMTP_SERVER, SMTP_PORT, context=context, timeout=20) as server:
        server.login(EMAIL, SENHA)
        server.send_message(msg)
        server.close()

    print("E-mail enviado com sucesso!")


except Exception as e:
    print("Erro ao enviar e-mail:")
    print(e)
