from socket import socket, gethostname, AF_INET, SOCK_STREAM
from multiprocessing import Pool


def tcp_sock(address_list):
    with socket(AF_INET, SOCK_STREAM) as sock:
        sock.connect(address_list['address'])
        s = '{}. {}'.format(address_list['idx'], gethostname())
        sock.sendall(s.encode('utf-8'))
        rev = sock.recv(2048)
        print('server: {}'.format(rev.decode('utf-8')))
        sock.close()


def main():
    address = ('192.168.0.101', 18000)
    address_list = []
    for idx in range(100000):
        address_list.append({'idx': idx, 'address': address})

    with Pool(processes=10) as p:
        map(p.map(tcp_sock, address_list))


if __name__ == '__main__':
    main()
