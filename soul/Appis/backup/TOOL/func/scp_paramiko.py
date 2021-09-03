import paramiko

def transport(addr, port, user, pwd):
    trans = paramiko.Transport(
        (addr, port)
    )

    trans.connect(
        user, pwd
    )

    return trans # paramiko.SFTPClient.from_transport(trans)

def scp_paramiko(trans, tg_path, sv_path):
    
    sftp = paramiko.SFTPClient.from_transport(trans)
    sftp.get(
        sv_path,
        tg_path
    )

    trans.close()

    return True