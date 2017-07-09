from socketserver import TCPServer, BaseRequestHandler


class EchoTCPHandler(BaseRequestHandler):
    """
    这是简单TCP协议的服务器,实现的功能是Echo
    """

    def handle(self):
        self.data = self.request.recv(2048)
        print('client ip: {}\n, data: {}'.format(self.client_address[0], self.data.decode('utf-8')))
        recv_data = 'service echo: {}'.format(self.data.decode('utf-8'))
        self.request.sendall(recv_data.encode('utf-8'))


def main():
    (host, port) = ('0.0.0.0', 18000)

    server = TCPServer((host, port), EchoTCPHandler)
    server.serve_forever()


if __name__ == '__main__':
    main()
