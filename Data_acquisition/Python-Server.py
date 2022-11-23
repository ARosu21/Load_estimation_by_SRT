import socket 
from threading import Thread 
import random
# basado en https://www.techbeamers.com/python-tutorial-write-multithreaded-python-server/

# Multithreaded Python server : TCP Server Socket Thread Pool
class ServerThread(Thread): 
 
    def __init__(self,conn,ip,port): 
        Thread.__init__(self) 
        self.ip = ip 
        self.port = port 
        self.conn = conn
        print ("[+] New server socket thread started for " + ip + ":" + str(port) )
 
    def run(self): 
#        while True : 
#            try:
#                data = self.conn.recv(2048) 
#            except:
#                print("- Connection abruptly closed")
#                break
#            print ("- Server received data:", data)
#            if data == b'':
#                print("- Connection closed")
#                break
            # Si llegamos aquí, enviar un string de tamaño aleatorio
        data = self.conn.recv(2048) 
        #print ("- Server received data:", data.decode())
        # devolver un mensaje de tamaño aleatorio.
        for i in range(1,random.randrange(1,8192)):
            MESSAGE='x'*random.randrange(1,1460)
            self.conn.send(MESSAGE.encode())
        # Cerrar el socket y acabar el thread
        self.conn.close()

# Multithreaded Python server : TCP Server Socket Program Stub
TCP_IP = '0.0.0.0' 
TCP_PORT = 2004 
BUFFER_SIZE = 20  # Usually 1024, but we need quick response 

tcpServer = socket.socket(socket.AF_INET, socket.SOCK_STREAM) 
tcpServer.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1) 
tcpServer.bind((TCP_IP, TCP_PORT)) 
threads = [] 
 
while True: 
    tcpServer.listen(4) 
    print ("* Multithreaded Python server : Waiting for connections from TCP clients..." )
    (conn, (ip,port)) = tcpServer.accept() 
    newthread = ServerThread(conn, ip,port) 
    newthread.start() 
    threads.append(newthread) 
 
for t in threads: 
    t.join() 
