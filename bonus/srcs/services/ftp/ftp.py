import os

from pyftpdlib.authorizers import DummyAuthorizer
from pyftpdlib.handlers import FTPHandler
from pyftpdlib.servers import FTPServer

def main():
    # Instantiate a dummy authorizer for managing 'virtual' users
    authorizer = DummyAuthorizer()

    # Define a new user having full r/w permissions and a read-only
    # anonymous user
    authorizer.add_user(os.environ['FTP_USER'], os.environ['FTP_PASS'], '/var/www/html/wordpress', perm='elradfmwMT')
    authorizer.add_anonymous(os.getcwd())

    # Instantiate FTP handler class
    handler = FTPHandler
    handler.authorizer = authorizer
    handler.permit_foreign_addresses = True

    # Define a customized banner (string returned when client connects)
    handler.banner = "CLIENT CONNECTED"
    handler.passive_ports = range(5000, 5100)

    # Instantiate FTP server class and listen on 0.0.0.0:2121
    address = ('', 21)
    server = FTPServer(address, handler)

    # set a limit for connections
    server.max_cons = 256
    server.max_cons_per_ip = 5

    # start ftp server
    server.serve_forever()

if __name__ == '__main__':
    main()
