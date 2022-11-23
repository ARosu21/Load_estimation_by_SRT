import socket 
import random
import time
import datetime
from threading import Thread 
# basado en https://www.techbeamers.com/python-tutorial-write-multithreaded-python-server/

#ip = socket.gethostname() 
ip = '192.168.1.138'
port = 2004
BUFFER_SIZE = 2048 
MAX_CONN = 3000
ARRIVAL_RATE = 5 #conn/s
threads = [] 

class ClientThread(Thread): 
 
    def __init__(self,ip,port): 
        Thread.__init__(self) 
        self.ip = ip 
        self.port = port 
        self.tcpClient = socket.socket(socket.AF_INET, socket.SOCK_STREAM) 
        self.tcpClient.connect((ip, port))
 
    def run(self): 
        MESSAGE='GET'
        self.tcpClient.send(MESSAGE.encode())     

        while True:
            try:
                data = self.tcpClient.recv(BUFFER_SIZE)
                #print(" Client received data:", data)
                if data == b'':
                    #print("- Connection closed")
                    break
            except:
                break

        self.tcpClient.close() 


 
for i in range(1,MAX_CONN+1):
    print("New thread (",i,") in ",datetime.datetime.now())
    newthread = ClientThread(ip,port) 
    newthread.start() 
    threads.append(newthread) 
    #time.sleep(random.expovariate(ARRIVAL_RATE))
    # Cambiado para que sea más exacto, a costa de más proceso:
    sleep=time.perf_counter() + random.expovariate(ARRIVAL_RATE)
    while time.perf_counter() < sleep:
        pass
 
for t in threads: 
    t.join() 

input("Program ended, press enter to finish...")
