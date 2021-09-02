BEGIN{
	tiempo_anterior = 0;
}
{
	srt_us = $7*10000000;
	print $7;
	
}
END{
}
