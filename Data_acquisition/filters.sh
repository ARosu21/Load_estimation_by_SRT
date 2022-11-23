#!/bin/bash

echo Empezamos a filtrar...

<<COMMENT
for i in 1 2 3 4
do
	for j in 0
	do
		for k in 1 2 3 4
		do
			for l in 0 
			do
				for m in 0 1 2 3 4 
				do
					#Filtramos y ordenamos paquetes tcp
					tshark -q -r traza${i}_${j}_${k}_${l}_${m}.pcap -Y "not tcp.analysis.retransmission and not tcp.analysis.out_of_order" -E header=y -Tfields -e frame.time_epoch -e frame.time -e tcp.time_delta -e tcp.time_relative -e tcp.seq -e tcp.flags > ./trazas_filtradas/traza${i}_${j}_${k}_${l}_${m}.txt 

					#Filtramos por flag=0x002
					tshark -q -r traza${i}_${j}_${k}_${l}_${m}.pcap -Y "not tcp.analysis.retransmission and not tcp.analysis.out_of_order and tcp.flags==0x00000002" -E header=y -Tfields -e frame.time_epoch -e frame.time -e tcp.time_delta -e tcp.time_relative -e tcp.seq -e tcp.flags > ./trazas_llegada/traza_llegada${i}_${j}_${k}_${l}_${m}.txt 

					#Filtramos por flag=0x012
					tshark -q -r traza${i}_${j}_${k}_${l}_${m}.pcap -Y "not tcp.analysis.retransmission and not tcp.analysis.out_of_order and tcp.flags==0x00000012" -Tfields -e frame.time_epoch -e frame.time -e tcp.time_delta -e tcp.time_relative -e tcp.seq -e tcp.flags > traza_srt${i}_${j}_${k}_${l}_${m}.txt 

					#Sacamos los SRT de cada prueba por separado en un fichero de texto
					awk -f srt.awk traza_srt${i}_${j}_${k}_${l}_${m}.txt > ./SRT/srt${i}_${j}_${k}_${l}_${m}.txt
					
					#Sacamos los SRT de todas las pruebas juntas en un fichero de texto
					awk -f srt.awk traza_srt${i}_${j}_${k}_${l}_${m}.txt >> ./SRT/srt${i}_${j}_${k}_${l}.txt

					#Sacamos la carga media en un fichero de texto
					awk -f carga.awk carga${i}_${j}_${k}_${l}_${m}.txt >> ./Cargas_medias/carga_media${i}_${j}_${k}_${l}.txt
				done
			done
		done
	done
done
COMMENT

echo "Parte de calibración."
i=0
j=0
k=0
l=0

while [ $i -le 100 ]
do
	m=0 #Repeticiones
	while [ $m -le 4 ]
	do
		echo "Carga CPU: $i% Repeticion: $m"
		#Filtramos por flag=0x012
		tshark -q -r ./Calibrar/traza${i}_${j}_${k}_${l}_${m}.pcap -Y "not tcp.analysis.retransmission and not tcp.analysis.out_of_order and tcp.flags==0x00000012" -Tfields -e frame.time_epoch -e frame.time -e tcp.time_delta -e tcp.time_relative -e tcp.seq -e tcp.flags > ./Calibrar/Trazas_filtradas/traza_srt${i}_${j}_${k}_${l}_${m}.txt 
		
		#Sacamos los SRT de todas las pruebas juntas en un fichero de texto
		awk -f srt.awk ./Calibrar/Trazas_filtradas/traza_srt${i}_${j}_${k}_${l}_${m}.txt >> ./Calibrar/SRT/srt${i}_${j}_${k}_${l}.txt

		#Sacamos la carga media en un fichero de texto
		awk -f carga.awk ./Calibrar/carga${i}_${j}_${k}_${l}_${m}.txt >> ./Calibrar/Cargas_medias/carga_media${i}_${j}_${k}_${l}.txt
		m=$(( $m + 1 ))
	done
	i=$(( $i + 5 ))
done


echo "Parte del test."
j=0
k=0
l=0
m=0 #Minutos

while [ $m -le 5 ]
do
	i=0
	while [ $i -le 100 ]
	do
		echo "Carga CPU: $i% Minutos: $m"
		#Filtramos por flag=0x012
		tshark -q -r ./Test/${m}min/CPU${i}/traza${i}_${j}_${k}_${l}.pcap -Y "not tcp.analysis.retransmission and not tcp.analysis.out_of_order and tcp.flags==0x00000012" -Tfields -e frame.time_epoch -e frame.time -e tcp.time_delta -e tcp.time_relative -e tcp.seq -e tcp.flags > ./Test/${m}min/CPU${i}/traza_srt${i}_${j}_${k}_${l}.txt 
		
		#Sacamos los SRT de todas las pruebas juntas en un fichero de texto
		awk -f srt.awk ./Test/${m}min/CPU${i}/traza_srt${i}_${j}_${k}_${l}.txt >> ./Test/${m}min/CPU${i}/srt${i}_${j}_${k}_${l}.txt

		#Sacamos la carga media en un fichero de texto
		awk -f carga.awk ./Test/${m}min/CPU${i}/carga${i}_${j}_${k}_${l}.txt >> ./Test/${m}min/CPU${i}/carga_media${i}_${j}_${k}_${l}.txt
		i=$(( $i + 5 ))
	done
	m=$(( $m + 1 ))
done

echo "Final"
exit 1


