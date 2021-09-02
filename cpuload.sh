#Bucle para cargar solo CPU calibración
i=0
while [ $i -le 100 ]
do
	for n in 0 1 2 3 4
	do
		echo "Calibración CPU al $i% por $n vez."
		j=0
		k=0
		l=0

		stress-ng -c 4 -l $i &
		pid=$!
		sleep 5

		python3 Python-Server_200OK.py &
		pid1=$!
		sleep 1

		tshark -i eth0 -q -f "tcp port 2004 and (tcp[tcpflags]&(tcp-syn|tcp-fin)!=0)" -F pcap -w ./Calibrar/traza${i}_${j}_${k}_${l}_${n}.pcap & 
		pid2=$!
		sleep 1

		ssh kali@192.168.1.1 python3 /home/kali/Desktop/Python-PoissonClient.py &
		pid_client=$!

		mpstat 2 > ./Calibrar/carga${i}_${j}_${k}_${l}_${n}.txt &
		pid3=$!

		sleep 10m
		
		kill $pid 
		kill $pid1
		kill $pid2
		kill $pid3
		kill $pid_client
		sleep 5
	done
	
	i=$(( $i + 5 ))
done

#Bucle para cargar solo CPU
m=1
while [ $m -le 5 ]
do 
	i=0
	while [ $i -le 100 ]
	do
		echo "Test CPU al $i% durante $m minutos."
		j=0
		k=0
		l=0

		stress-ng -c 4 -l $i &
		pid=$!
		sleep 5

		python3 Python-Server_200OK.py &
		pid1=$!
		sleep 1

		tshark -i eth0 -q -f "tcp port 2004 and (tcp[tcpflags]&(tcp-syn|tcp-fin)!=0)" -F pcap -w ./Test/${m}min/CPU${i}/traza${i}_${j}_${k}_${l}.pcap & 
		pid2=$!
		sleep 1

		ssh kali@192.168.1.1 python3 /home/kali/Desktop/Python-PoissonClient.py &
		pid_client=$!

		mpstat 2 > ./Test/${m}min/CPU${i}/carga${i}_${j}_${k}_${l}.txt &
		pid3=$!

		sleep ${m}m
		
		kill $pid 
		kill $pid1
		kill $pid2
		kill $pid3
		kill $pid_client
		sleep 5
		
		i=$(( $i + 5 ))
	done
	m=$(( $m + 1 ))
done
echo "Final."
exit 1