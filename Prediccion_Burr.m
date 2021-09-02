close all
clear all
clc

%%
%Cargamos los datos de calibracion variando la carga de CPU
%Variables
srt_cpu=cell(2,21);
carga_cpu=cell(2,21);
nbins_cpu=cell(2,21);
count=1;i=0;j=0;k=0;l=0;

while i <= 100
    carga_m = 0;

    carga_actual = sprintf('%d',i);
    filename = sprintf('./%s/%s/%s%d_%d_%d_%d.txt','Calibrar','SRT','srt',i,j,k,l);
    fileID = fopen(filename, 'r');
    srt = textscan(fileID, '%f');

    filename1 = sprintf('./%s/%s/%s%d_%d_%d_%d.txt','Calibrar','Cargas_medias','carga_media',i,j,k,l);
    fileID1 = fopen(filename1, 'r');
    carga = textscan(fileID1, '%f');
    carga = cell2mat(carga);

    srt_cpu{1,count} = carga_actual;
    srt_cpu{2,count} = cell2mat(srt).*1e3;
    carga_cpu{1,count} = carga_actual;
    carga_cpu{2,count} = mean(carga);
    nbins_cpu{1,count} = carga_actual;
    nbins_cpu{2,count} = 2*round(sqrt(length(srt_cpu{2,count})));
    
    fclose(fileID);
    fclose(fileID1); 
    
    count = count+1;
    i=i+5;
end

%%
%Ajustes Burr
percentil_90_burr = zeros(1,18);
percentil_95_burr = zeros(1,18);
percentil_99_burr = zeros(1,18);
media_burr = zeros(1,18);
pdf_combi_burr = cell(1,18);
cdf_combi_burr = cell(1,18);
range_pdf_burr = cell(1,18);
range_cdf_burr = cell(1,18);
carga_burr = [carga_cpu{2,2:19}];

%del 5% al 90%
a1 = [0.056324 ,0.071656 ,0.058359 ,0.066805 ,0.083190 ,0.020337 ,0.132711 ,0.058587 ,0.065474 ,0.082088 ,0.064758 ,0.093216 ,0.068642 ,0.088724 ,0.096837 ,0.087226 ,0.064298 ,0.116507 ];
alpha1 = [0.016578,0.017422,0.022065,0.018270,0.028790,0.011790,0.032941,0.013055,0.012461,0.035127,0.012665,0.039533,0.011883,0.040106,0.038238,0.039606,0.011560,0.043545];
c1 = [42.231084,6.992573,4.179798,5.385618,9.903342,10.734359,8.405801,6.942952,7.606586,9.650708,7.255782,7.229880,9.433995,7.195246,7.022697,6.975487,12.224023,5.724791];
k1 = [0.103180,0.665212,1.476548,1.243674,0.681590,0.454035,0.823769,0.463932,0.371019,2.641014,0.376068,4.816053,0.257773,6.907866,5.333740,6.111641,0.205312,7.874995];

a2 = [0.015472 ,0.005838 ,0.002561 ,0.123777 ,0.061168 ,0.031065 ,0.057747 ,0.103696 ,0.179389 ,0.053376 ,0.136957 ,0.059705  ,0.110440 ,0.057008 ,0.046546 ,0.050215 ,0.083999 ,0.037021 ];
alpha2 = [0.013586,0.019813,0.050291,0.031199,0.016544,0.029117,0.015891,0.032545,0.036731,0.012990,0.038495,0.012514,0.038103,0.011455,0.011742,0.011411,0.038621,0.014394];
c2 = [8.870181,6.338168,170.736534,13.337035,5.665550,22.910543,5.246723,9.881414,7.473410,7.437963,8.137047,6.921920,8.815775,9.272193,10.317847,10.653296,8.451560,8.360708];
k2 = [0.799058,2.216715,0.050243,0.695098,1.103857,0.487402,0.987623,1.136711,1.229017,0.470307,2.794049,0.447150,3.802082,0.275783,0.357885,0.303979,7.120383,1.518850];

a3 = [0.808874 ,0.803565 ,0.864476 ,0.799189 ,0.846389 ,0.809742 ,0.799719 ,0.802601 ,0.754676 ,0.815266 ,0.779246 ,0.824033 ,0.799056 ,0.828499 ,0.824749 ,0.834462 ,0.827172 ,0.807760 ];
alpha3 = [0.036906,0.036974,0.038732,0.038617,0.043465,0.039795,0.041333,0.040563,0.041682,0.040141,0.041407,0.043543,0.042179,0.042813,0.043110,0.042316,0.042360,0.042671];
c3 = [36.840424,36.417483,21.648946,26.394937,16.987304,23.693173,20.329136,22.586150,21.370479,25.542949,24.964642,20.193708,24.738796,21.875367,22.749809,24.253342,25.125485,26.521809];
k3 = [0.615718,0.528258,1.216269,0.930418,4.769264,1.315587,2.170829,1.500758,2.187020,1.039470,1.583508,3.337324,1.988837,2.421663,2.680525,1.861485,1.742799,1.927788];

a4 = [0.116075 ,0.119304 ,0.077482 ,0.009265 ,0.010272 ,0.137259 ,0.010000 ,0.035033 ,0.002061 ,0.049166 ,0.018081 ,0.023414 ,0.021690  ,0.026311 ,0.031717 ,0.027378 ,0.024328 ,0.037431 ]; 
alpha4 = [0.037365,0.032673,0.040113,0.047005,0.045796,0.053057,0.056335,0.051750,0.060600,0.053625,0.052188,0.048000,0.050912,0.050244,0.048046,0.049844,0.050839,0.050137];
c4 = [11.568525,13.075031,5.041465,3.194511,190.251931,3.279573,3.000000,3.000000,3.000000,3.000000,21.039795,40.162156,26.644434,30.088450,46.263237,36.318871,41.547294,25.138552];
k4 = [5.048873,1.345987,4.233009,2.030358,0.041583,5.004834,4.141374,2.852390,5.140015,3.089885,0.813443,0.253178,0.603280,0.431150,0.207274,0.321090,0.315580,0.491660];

figure;
j=1;
for i=2:19
    %Rango para representar las pdf
    n_range=(max(srt_cpu{2,i})-min(srt_cpu{2,i}))/500;
    range_pdf_burr{j}=min(srt_cpu{2,i}):n_range:max(srt_cpu{2,i});
    
    %CDF de los datos SRT
    f1=figure;
    [h]=histogram(srt_cpu{2,i}, 'Normalization', 'cdf');
    cdf_srt = h.Values;
    cdf_srt(end+1)=1;
    range_cdf = h.BinEdges;
    close(f1)

    %Rango para representar las cdf
    n_range=(max(range_cdf)-min(range_cdf))/500;
    range_cdf_burr{j}=min(range_cdf):n_range:max(range_cdf);
    
    try
        pd_burr_1 =   makedist( 'Burr', 'alpha',alpha1(j),'c',c1(j),'k',k1(j));
        media1 = mean(pd_burr_1)*a1(j);
        xPdf1=pdf(pd_burr_1, range_pdf_burr{j});
        xCdf1=cdf(pd_burr_1,range_cdf_burr{j});
    catch
        pd_burr_1 = 0;
        media1 = 0;
        xPdf1=0;
        xCdf1=0;
    end
    try
        pd_burr_2 =  makedist( 'Burr', 'alpha',alpha2(j),'c',c2(j),'k',k2(j));
        media2 = mean(pd_burr_2)*a2(j);
        xPdf2=pdf(pd_burr_2, range_pdf_burr{j});
        xCdf2=cdf(pd_burr_2,range_cdf_burr{j});
    catch
        pd_burr_2 = 0;
        media2 = 0;
        xPdf2=0;
        xCdf2=0;
    end
    try
        pd_burr_3 = makedist( 'Burr', 'alpha',alpha3(j),'c',c3(j),'k',k3(j));
        media3 = mean(pd_burr_3)*a3(j);
        xPdf3=pdf(pd_burr_3, range_pdf_burr{j});
        xCdf3=cdf(pd_burr_3,range_cdf_burr{j});
    catch
        pd_burr_3 = 0;
        media3 = 0;
        xPdf3=0;
        xCdf3=0;
    end
    try
        pd_burr_4 =  makedist( 'Burr', 'alpha',alpha4(j),'c',c4(j),'k',k4(j));
        media4 = mean(pd_burr_4)*a4(j);
        xPdf4=pdf(pd_burr_4, range_pdf_burr{j});
        xCdf4=cdf(pd_burr_4,range_cdf_burr{j});
    catch
        pd_burr_4 = 0;
        media4 = 0;
        xPdf4=0;
        xCdf4=0;
    end

    %Combinamos las 4 componentes
    pdf_combi_burr{j}=a1(j)*xPdf1+a2(j)*xPdf2+a3(j)*xPdf3+a4(j)*xPdf4;
    cdf_combi_burr{j}=a1(j)*xCdf1+a2(j)*xCdf2+a3(j)*xCdf3+a4(j)*xCdf4;
    
    %Media 
    media_burr(j) = media1 + media2 + media3 + media4;
    
    %Percentil 90
    [~, closest_cdf] = min(abs(cdf_combi_burr{j}-0.90));
    percentil_90_burr(j) = range_cdf_burr{j}(closest_cdf);
    
    %Percentil 95
    [~, closest_cdf] = min(abs(cdf_combi_burr{j}-0.95));
    percentil_95_burr(j) = range_cdf_burr{j}(closest_cdf);
    
    %Percentil 99
    [~, closest_cdf] = min(abs(cdf_combi_burr{j}-0.99));
    percentil_99_burr(j) = range_cdf_burr{j}(closest_cdf);

    %Representaciones
    f1=figure;
    subplot(2,2,1)
    plot(range_pdf_burr{j},xPdf1*a1(j))
    subplot(2,2,2)
    plot(range_pdf_burr{j},xPdf2*a2(j))
    subplot(2,2,3)
    plot(range_pdf_burr{j},xPdf3*a3(j))
    subplot(2,2,4)
    plot(range_pdf_burr{j},xPdf4*a4(j))
    close(f1)
    
    
    subplot(3,6,j)
    hold on
    plot(range_pdf_burr{j},pdf_combi_burr{j})
    histogram(srt_cpu{2,i}, 'Normalization', 'pdf')
    xline(percentil_90_burr(j), '--r','Percentil 90')
    xline(percentil_95_burr(j), '--b','Percentil 95')
    xline(percentil_99_burr(j), '--g','Percentil 99')
    xline(media_burr(j),'--m','Media')
    title(['Histograma SRT carga CPU=',num2str((j*5)),'%'])
    xlabel('SRT en ms')
    ylabel('Nº de paquetes')
    
    j=j+1;
end

%%
%Regresiones 3er orden
%%%%%%%Media%%%%%%%%%%
nmin=min(media_burr);
nmax=max(media_burr);
n_media=(nmax-nmin)/500;
rango_media=nmin:n_media:nmax;

pmedia_3 = polyfit(media_burr,carga_burr,3);
ymedia_error=polyval(pmedia_3,media_burr);
errormedia_orden3=immse(carga_burr,ymedia_error);
ymedia_3=polyval(pmedia_3,rango_media);

%Representamos ajuste media burr
figure
plot(media_burr,carga_burr,'o')
hold on
plot(rango_media,ymedia_3,'g')
title('Media Burr')
ylim([0 100])
ylabel('Cargas medias CPU en %')
xlabel('Tiempos de SRT en ms')
legend({'Valores reales','Orden 3'},'Location','northwest')

%%%%%%%%%%%%Percentil 90%%%%%%%%%%
nmin=min(percentil_90_burr);
nmax=max(percentil_90_burr);
n_90=(nmax-nmin)/500;
rango_90=nmin:n_90:nmax;

p90_3 = polyfit(percentil_90_burr,carga_burr,3);
y90_error=polyval(p90_3,percentil_90_burr);
errorp90_orden3=immse(carga_burr,y90_error);
y90_3=polyval(p90_3,rango_90);

figure
plot(percentil_90_burr,carga_burr,'o')
hold on
plot(rango_90, y90_3,'g')
title('Percentil 90 Burr')
ylim([0 100])
ylabel('Cargas medias CPU en %')
xlabel('Tiempos de SRT en ms')
legend({'Valores reales','Orden 3'},'Location','northwest')

%%%%%%%%%%%%Percentil 95%%%%%%%%%%
nmin=min(percentil_95_burr);
nmax=max(percentil_95_burr);
n_95=(nmax-nmin)/500;
rango_95=nmin:n_95:nmax;

p95_3 = polyfit(percentil_95_burr,carga_burr,3);
y95_error=polyval(p95_3,percentil_95_burr);
errorp95_orden3=immse(carga_burr,y95_error);
y95_3=polyval(p95_3,rango_95);

figure
plot(percentil_95_burr,carga_burr,'o')
hold on
plot(rango_95, y95_3,'g')
title('Percentil 95 Burr')
ylim([0 100])
ylabel('Cargas medias CPU en %')
xlabel('Tiempos de SRT en ms')
legend({'Valores reales','Orden 3'},'Location','northwest')

%%%%%%%%%%%%Percentil 99%%%%%%%%%%
nmin=min(percentil_99_burr);
nmax=max(percentil_99_burr);
n_99=(nmax-nmin)/500;
rango_99=nmin:n_99:nmax;

p99_3 = polyfit(percentil_99_burr,carga_burr,3);
y99_error=polyval(p99_3,percentil_99_burr);
errorp99_orden3=immse(carga_burr,y99_error);
y99_3=polyval(p99_3,rango_99);

figure
plot(percentil_99_burr,carga_burr,'o')
hold on
plot(rango_99, y99_3,'g')
title('Percentil 99 Burr')
ylim([0 100])
ylabel('Cargas medias CPU en %')
xlabel('Tiempos de SRT en ms')
legend({'Valores reales','Orden 3'},'Location','northwest')

%%
%MAPE para la media

mape_media = mape(carga_burr,ymedia_error);
mape_90 = mape(carga_burr,y90_error);
mape_95 = mape(carga_burr,y95_error);
mape_99 = mape(carga_burr,y99_error);











