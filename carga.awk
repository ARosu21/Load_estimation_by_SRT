BEGIN{
}
{
	if(NR > 3){
		gsub(",",".",$12);
		carga = 100 - $12;
	}
		
	
	carga_total += carga;
}
END{
	carga_media = carga_total / (NR-3); #Number of rows

	print carga_media;

}
