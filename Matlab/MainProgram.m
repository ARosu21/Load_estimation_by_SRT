clc
clear
close all

%%
%Cargamos los datos cuando no hay carga
%Variables
srt_free={};
carga_free={};
nbins_free={};
count=1;i=0;j=0;k=0;l=0;carga_m=0;

traza_actual = sprintf('%d%d%d%d',i,j,k,l);
filename = sprintf('./%s/%s/%s%d_%d_%d_%d.txt','Calibrar','SRT','srt',i,j,k,l);
fileID = fopen(filename, 'r');
srt = textscan(fileID, '%f');

filename1 = sprintf('./%s/%s/%s%d_%d_%d_%d.txt','Calibrar','Cargas_medias','carga_media',i,j,k,l);
fileID1 = fopen(filename1, 'r');
carga = textscan(fileID1, '%f');
carga = cell2mat(carga);

srt_free{1,count} = traza_actual;
srt_free{2,count} = cell2mat(srt).*1e6;
carga_free{1,count} = traza_actual;
carga_free{2,count} = mean(carga);
nbins_free{1,count} = traza_actual;
nbins_free{2,count} = 2*round(sqrt(length(srt_free{2,count})));

fclose(fileID);
fclose(fileID1);

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
    srt_cpu{2,count} = cell2mat(srt).*1e6;
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
%Cargamos los datos de test cargando la CPU durante un minuto
%Variables
srt_test1m=cell(2,21);
carga_test1m=cell(2,21);
nbins_test1m=cell(2,21);
count=1;i=0;j=0;k=0;l=0;

while i <= 100

    carga_actual = sprintf('%d',i);
    filename = sprintf('./%s/%s/%s%d/%s%d_%d_%d_%d.txt','Test','1min','CPU',i,'srt',i,j,k,l);
    fileID = fopen(filename, 'r');
    srt = textscan(fileID, '%f');

    filename1 = sprintf('./%s/%s/%s%d/%s%d_%d_%d_%d.txt','Test','1min','CPU',i,'carga_media',i,j,k,l);
    fileID1 = fopen(filename1, 'r');
    carga = textscan(fileID1, '%f');
    carga = cell2mat(carga);

    srt_test1m{1,count} = carga_actual;
    srt_test1m{2,count} = cell2mat(srt).*1e6;
    carga_test1m{1,count} = carga_actual;
    carga_test1m{2,count} = carga;
    nbins_test1m{1,count} = carga_actual;
    nbins_test1m{2,count} = 2*round(sqrt(length(srt_test1m{2,count})));

    fclose(fileID);
    fclose(fileID1); 
    
    count = count+1;
    i=i+5;
end

%%
%Cargamos los datos de test cargando la CPU durante dos minutos
%Variables
srt_test2m=cell(2,21);
carga_test2m=cell(2,21);
nbins_test2m=cell(2,21);
count=1;i=0;j=0;k=0;l=0;

while i <= 100

    carga_actual = sprintf('%d',i);
    filename = sprintf('./%s/%s/%s%d/%s%d_%d_%d_%d.txt','Test','2min','CPU',i,'srt',i,j,k,l);
    fileID = fopen(filename, 'r');
    srt = textscan(fileID, '%f');

    filename1 = sprintf('./%s/%s/%s%d/%s%d_%d_%d_%d.txt','Test','2min','CPU',i,'carga_media',i,j,k,l);
    fileID1 = fopen(filename1, 'r');
    carga = textscan(fileID1, '%f');
    carga = cell2mat(carga);

    srt_test2m{1,count} = carga_actual;
    srt_test2m{2,count} = cell2mat(srt).*1e6;
    carga_test2m{1,count} = carga_actual;
    carga_test2m{2,count} = carga;
    nbins_test2m{1,count} = carga_actual;
    nbins_test2m{2,count} = 2*round(sqrt(length(srt_test2m{2,count})));

    fclose(fileID);
    fclose(fileID1); 
    
    count = count+1;
    i=i+5;
end

%%
%Cargamos los datos de test cargando la CPU durante tres minutos
%Variables
srt_test3m=cell(2,21);
carga_test3m=cell(2,21);
nbins_test3m=cell(2,21);
count=1;i=0;j=0;k=0;l=0;

while i <= 100

    carga_actual = sprintf('%d',i);
    filename = sprintf('./%s/%s/%s%d/%s%d_%d_%d_%d.txt','Test','3min','CPU',i,'srt',i,j,k,l);
    fileID = fopen(filename, 'r');
    srt = textscan(fileID, '%f');

    filename1 = sprintf('./%s/%s/%s%d/%s%d_%d_%d_%d.txt','Test','3min','CPU',i,'carga_media',i,j,k,l);
    fileID1 = fopen(filename1, 'r');
    carga = textscan(fileID1, '%f');
    carga = cell2mat(carga);

    srt_test3m{1,count} = carga_actual;
    srt_test3m{2,count} = cell2mat(srt).*1e6;
    carga_test3m{1,count} = carga_actual;
    carga_test3m{2,count} = carga;
    nbins_test3m{1,count} = carga_actual;
    nbins_test3m{2,count} = 2*round(sqrt(length(srt_test3m{2,count})));

    fclose(fileID);
    fclose(fileID1); 
    
    count = count+1;
    i=i+5;
end

%%
%Cargamos los datos de test cargando la CPU durante cuatro minutos
%Variables
srt_test4m=cell(2,21);
carga_test4m=cell(2,21);
nbins_test4m=cell(2,21);
count=1;i=0;j=0;k=0;l=0;

while i <= 100

    carga_actual = sprintf('%d',i);
    filename = sprintf('./%s/%s/%s%d/%s%d_%d_%d_%d.txt','Test','4min','CPU',i,'srt',i,j,k,l);
    fileID = fopen(filename, 'r');
    srt = textscan(fileID, '%f');

    filename1 = sprintf('./%s/%s/%s%d/%s%d_%d_%d_%d.txt','Test','4min','CPU',i,'carga_media',i,j,k,l);
    fileID1 = fopen(filename1, 'r');
    carga = textscan(fileID1, '%f');
    carga = cell2mat(carga);

    srt_test4m{1,count} = carga_actual;
    srt_test4m{2,count} = cell2mat(srt).*1e6;
    carga_test4m{1,count} = carga_actual;
    carga_test4m{2,count} = carga;
    nbins_test4m{1,count} = carga_actual;
    nbins_test4m{2,count} = 2*round(sqrt(length(srt_test4m{2,count})));

    fclose(fileID);
    fclose(fileID1); 
    
    count = count+1;
    i=i+5;
end

%%
%Cargamos los datos de test cargando la CPU durante cinco minutos
%Variables
srt_test5m=cell(2,21);
carga_test5m=cell(2,21);
nbins_test5m=cell(2,21);
count=1;i=0;j=0;k=0;l=0;

while i <= 100

    carga_actual = sprintf('%d',i);
    filename = sprintf('./%s/%s/%s%d/%s%d_%d_%d_%d.txt','Test','5min','CPU',i,'srt',i,j,k,l);
    fileID = fopen(filename, 'r');
    srt = textscan(fileID, '%f');

    filename1 = sprintf('./%s/%s/%s%d/%s%d_%d_%d_%d.txt','Test','5min','CPU',i,'carga_media',i,j,k,l);
    fileID1 = fopen(filename1, 'r');
    carga = textscan(fileID1, '%f');
    carga = cell2mat(carga);

    srt_test5m{1,count} = carga_actual;
    srt_test5m{2,count} = cell2mat(srt).*1e6;
    carga_test5m{1,count} = carga_actual;
    carga_test5m{2,count} = carga;
    nbins_test5m{1,count} = carga_actual;
    nbins_test5m{2,count} = 2*round(sqrt(length(srt_test5m{2,count})));

    fclose(fileID);
    fclose(fileID1); 
    
    count = count+1;
    i=i+5;
end

%%
%Histograma sin carga
percentil_95_free = prctile(srt_free{2,1},95);
percentil_99_free = prctile(srt_free{2,1},99);
percentil_50_free = prctile(srt_free{2,1},50);
media_free = mean(srt_free{2,1});

figure
histogram(srt_free{2,1},nbins_free{2,1});
hold on
xline(percentil_95_free, '--r','Percentil 95')
xline(percentil_99_free, '--b','Percentil 99')
xline(percentil_50_free, '--g','Percentil 50')
xline(media_free,'--m','Media')
title('Histograma SRT Sin Carga')
xlabel('SRT en \mus')
ylabel('Nº de paquetes')

%%
%Histogramas variando la carga de CPU
%Variables
percentil_95_cpu=zeros(1,length(srt_cpu));
percentil_99_cpu=zeros(1,length(srt_cpu));
percentil_50_cpu=zeros(1,length(srt_cpu));
percentil_90_cpu=zeros(1,length(srt_cpu));
media_cpu=zeros(1,length(srt_cpu));

figure
for i=1:length(srt_cpu)
    
    percentil_95_cpu(i) = prctile(srt_cpu{2,i},95);
    percentil_99_cpu(i) = prctile(srt_cpu{2,i},99);
    percentil_50_cpu(i) = prctile(srt_cpu{2,i},50);
    percentil_90_cpu(i) = prctile(srt_cpu{2,i},90);
    media_cpu(i) = mean(srt_cpu{2,i});
    
    subplot(3,7,i)
    histogram(srt_cpu{2,i},nbins_cpu{2,i});
    hold on
    xline(percentil_95_cpu(i), '--r','Percentil 95')
    xline(percentil_99_cpu(i), '--b','Percentil 99')
    xline(percentil_90_cpu(i), '--g','Percentil 90')
    xline(media_cpu(i),'--m','Media')
    title(['Histograma SRT carga CPU=',num2str((i*5)-5),'%'])
    xlabel('SRT en \mus')
    ylabel('Nº de paquetes')
    xlim([0 100])
    
end

%Representamos los estadísticos de los datos originales en función de la carga
cargas_calib=[carga_cpu{2,:}];
figure
subplot(2,2,1)
plot(media_cpu, cargas_calib, 'o')
title('Media datos originales')
xlabel('SRT \mus')
ylabel('% carga')
subplot(2,2,2)
plot(percentil_90_cpu, cargas_calib, 'o')
title('Percentil 90 datos originales')
xlabel('SRT \mus')
ylabel('% carga')
subplot(2,2,3)
plot(percentil_95_cpu, cargas_calib, 'o')
title('Percentil 95 datos originales')
xlabel('SRT \mus')
ylabel('% carga')
subplot(2,2,4)
plot(percentil_99_cpu, cargas_calib, 'o')
title('Percentil 99 datos originales')
xlabel('SRT \mus')
ylabel('% carga')
%%
%Dividimos las mixturas para la calibración
%Histogramas variando la carga de CPU
%Variables
media_opt1=zeros(1,length(srt_cpu));
media_opt2=zeros(1,length(srt_cpu));
media_opt3=zeros(1,length(srt_cpu));
media_opt4=zeros(1,length(srt_cpu));
media_opt=zeros(1,length(srt_cpu));

media_test=zeros(1,length(srt_cpu));
media_test1=zeros(1,length(srt_cpu));
media_test2=zeros(1,length(srt_cpu));
media_test3=zeros(1,length(srt_cpu));
media_test4=zeros(1,length(srt_cpu));

media_opt_prctg=zeros(1,length(srt_cpu));
media_opt_prctg1=zeros(1,length(srt_cpu));
media_opt_prctg2=zeros(1,length(srt_cpu));
media_opt_prctg3=zeros(1,length(srt_cpu));
media_opt_prctg4=zeros(1,length(srt_cpu));

media_test_prctg=zeros(1,length(srt_cpu));
media_test_prctg1=zeros(1,length(srt_cpu));
media_test_prctg2=zeros(1,length(srt_cpu));
media_test_prctg3=zeros(1,length(srt_cpu));
media_test_prctg4=zeros(1,length(srt_cpu));

centros_opt = cell(1,length(srt_cpu));
umbrales = cell(1,length(srt_cpu));

pdf_opt=cell(1,length(srt_cpu));
cdf_opt=cell(1,length(srt_cpu));
cdf_opt1=cell(1,length(srt_cpu));
cdf_opt2=cell(1,length(srt_cpu));
cdf_opt3=cell(1,length(srt_cpu));
cdf_opt4=cell(1,length(srt_cpu));
pdf_combi_opt=cell(1,length(srt_cpu));
range_pdf_opt=cell(1,length(srt_cpu));
cdf_combi_opt=cell(1,length(srt_cpu));
range_cdf_opt=cell(1,length(srt_cpu));
idx_opt=cell(1,length(srt_cpu));
idx_opt_prctg=cell(1,length(srt_cpu));

srt_value_prctg=cell(1,length(srt_cpu));
pdf_combi_prctg=cell(1,length(srt_cpu));
range_pdf_prctg=cell(1,length(srt_cpu));
cdf_combi_prctg=cell(1,length(srt_cpu));
cdf_combi_prctg1=cell(1,length(srt_cpu));
cdf_combi_prctg2=cell(1,length(srt_cpu));
cdf_combi_prctg3=cell(1,length(srt_cpu));
cdf_combi_prctg4=cell(1,length(srt_cpu));
range_cdf_prctg=cell(1,length(srt_cpu));

pdf_combi_test=cell(1,length(srt_cpu));
range_pdf_test=cell(1,length(srt_cpu));
cdf_combi_test=cell(1,length(srt_cpu));
cdf_combi_test1=cell(1,length(srt_cpu));
cdf_combi_test2=cell(1,length(srt_cpu));
cdf_combi_test3=cell(1,length(srt_cpu));
cdf_combi_test4=cell(1,length(srt_cpu));
range_cdf_test=cell(1,length(srt_cpu));
idx_test=cell(1,length(srt_cpu));
idx_test_prctg=cell(1,length(srt_cpu));

srt_value_prctg_test=cell(1,length(srt_cpu));
pdf_combi_prctg_test=cell(1,length(srt_cpu));
range_pdf_prctg_test=cell(1,length(srt_cpu));
cdf_combi_prctg_test=cell(1,length(srt_cpu));
cdf_combi_prctg_test1=cell(1,length(srt_cpu));
cdf_combi_prctg_test2=cell(1,length(srt_cpu));
cdf_combi_prctg_test3=cell(1,length(srt_cpu));
cdf_combi_prctg_test4=cell(1,length(srt_cpu));
range_cdf_prctg_test=cell(1,length(srt_cpu));

%load('Dist_opt/optcent.mat');

% f1=figure;
% h=histogram(srt_cpu{2,10}, 'Normalization', 'cdf');
% cdf_srt = h.Values;
% cdf_srt(end+1)=1;
% range_cdf_srt = h.BinEdges;
% close(f1)

% %Find value when cdf is 0.999
% cdf_value=0.999;
% [val_cdf,idx_cdf]=min(abs(cdf_srt-cdf_value));
% interval_cdf=range_cdf_srt(idx_cdf);
% 
% [centros_opt{1}, umbrales{1}] = get_centers(srt_cpu{2,10},interval_cdf);
% % [pdf_combi_abs,range_pdf_abs,cdf_combi_abs,range_cdf_abs] = dist_abs(srt_cpu{2,10}, centros_opt);
% % [pdf_combi_umbr,range_pdf_umbr,cdf_combi_umbr,range_cdf_umbr] = dist_umbrales(srt_cpu{2,10},umbrales);
% % [pdf_combi_eucl,range_pdf_eucl,cdf_combi_eucl,range_cdf_eucl] = dist_eucl(srt_cpu{2,10}, centros_opt);
% [pdf_combi_opt,range_pdf_opt,cdf_combi_opt,range_cdf_opt,idx_opt] = dist_opt(srt_cpu{2,10}, centros_opt);
% [srt_value_prctg] = values_prctgs(srt_cpu{2,10}, centros_opt, idx_opt);
% [pdf_combi_prctg,range_pdf_prctg,cdf_combi_prctg,range_cdf_prctg] = dist_prctgs(srt_cpu{2,10},srt_value_prctg,idx_opt);
% 
% [pdf_combi_test,range_pdf_test,cdf_combi_test,range_cdf_test,idx_test] = dist_opt_test(srt_cpu{2,10}, centros_opt);
% [srt_value_prctg_test] = values_prctgs(srt_cpu{2,10}, centros_opt, idx_test);
% [pdf_combi_prctg_test,range_pdf_prctg_test,cdf_combi_prctg_test,range_cdf_prctg_test] = dist_prctgs(srt_cpu{2,10},srt_value_prctg_test,idx_test);
% 
% % dist_cdf_umbr = max(abs(cdf_srt-cdf_combi_umbr));
% % dist_cdf_eucl = max(abs(cdf_srt-cdf_combi_eucl));
% % dist_cdf_abs = max(abs(cdf_srt-cdf_combi_abs));
% dist_cdf_prctg = max(abs(cdf_srt-cdf_combi_prctg));
% dist_cdf_prctg_test = max(abs(cdf_srt-cdf_combi_prctg_test));
% dist_cdf_opt = max(abs(cdf_srt-cdf_combi_opt));
% dist_cdf_test = max(abs(cdf_srt-cdf_combi_test));

% figure
% hold on
% histogram(srt_cpu{2,10}, 'Normalization', 'pdf');
% plot(range_pdf_opt+1, pdf_combi_opt)
% title('PDF óptima')
% figure
% hold on
% plot(range_cdf_srt, cdf_srt)
% plot(range_cdf_opt, cdf_combi_opt)
% title('CDF óptima')
% 
% figure
% hold on
% histogram(srt_cpu{2,10}, 'Normalization', 'pdf');
% plot(range_pdf_prctg+1, pdf_combi_prctg)
% title('PDF óptima porcentajes')
% figure
% hold on
% plot(range_cdf_srt, cdf_srt)
% plot(range_cdf_prctg, cdf_combi_prctg)
% title('CDF óptima porcentajes')
% 
% figure
% hold on
% histogram(srt_cpu{2,10}, 'Normalization', 'pdf');
% plot(range_pdf_test+1, pdf_combi_test)
% title('PDF óptima centros')
% figure
% hold on
% plot(range_cdf_srt, cdf_srt)
% plot(range_cdf_test, cdf_combi_test)
% title('CDF óptima centros')
% 
% figure
% hold on
% histogram(srt_cpu{2,10}, 'Normalization', 'pdf');
% plot(range_pdf_prctg_test+1, pdf_combi_prctg_test)
% title('PDF óptima porcentajes centros')
% figure
% hold on
% plot(range_cdf_srt, cdf_srt)
% plot(range_cdf_prctg_test, cdf_combi_prctg_test)
% title('CDF óptima porcentajes centros')
% 
% percentil_90_opt = prctile(pdf_combi_opt,90);
% [~,idx_90_opt] = min(abs(pdf_combi_opt-percentil_90_opt));
% percentil_90_opt = range_pdf_opt(idx_90_opt);
% 
% media_opt = mean(pdf_combi_opt);
% [~,idx_media_opt] = min(abs(pdf_combi_opt-media_opt));
% media_opt = range_pdf_opt(idx_media_opt);
% 
% figure
% hold on
% histogram(srt_cpu{2,10}, 'Normalization', 'pdf');
% plot(range_pdf_opt+1, pdf_combi_opt)
% xline(percentil_90_opt)
% xline(media_opt)
% title('PDF óptima')

% [pdf_combi,range_pdf,cdf_combi,range_cdf]=get_ranges(centros_opt(11),srt_cpu{2,11});

% figure
% hold on
% histogram(srt_cpu{2,11}, 'Normalization', 'pdf')
% plot(range_pdf,pdf_combi, 'LineWidth', 2)
% ylabel('PDF')
% yyaxis right
% plot(range_cdf_srt,cdf_srt,'LineWidth', 2)
% title(['Histograma SRT carga CPU=',num2str((9*5)-5),'%'])
% xlabel('SRT en \mus')
% ylabel('CDF')
% xlim([0 100])
% 
% figure
% hold on
% plot(range_cdf_srt, cdf_srt)
% plot(range_cdf, cdf_combi)
% legend('Real', 'Ajuste')


%%
% for i=1:length(srt_cpu)
%     
%     f1=figure;
%     h=histogram(srt_cpu{2,i}, 'Normalization', 'cdf');
%     cdf_srt = h.Values;
%     cdf_srt(end+1)=1;
%     range_cdf_srt = h.BinEdges;
%     close(f1)
%     
% %     Find value when cdf is 0.999
%     cdf_value=0.999;
%     [val_cdf,idx_cdf]=min(abs(cdf_srt-cdf_value));
%     interval_cdf=range_cdf_srt(idx_cdf);
%     
%     [centros_opt{i}, umbrales{i}] = get_centers(srt_cpu{2,i},interval_cdf);
% 
%     [pdf_combi_opt{i},range_pdf_opt{i},cdf_opt1{i},cdf_opt2{i},cdf_opt3{i},cdf_opt4{i},cdf_combi_opt{i},range_cdf_opt{i},idx_opt{i},media_opt1(i),media_opt2(i),media_opt3(i),media_opt4(i),media_opt(i)] = dist_opt(0,srt_cpu{2,i},centros_opt{i},0);
%     [srt_value_prctg{i}] = values_prctgs(srt_cpu{2,i}, idx_opt{i});
%     [idx_opt_prctg{i},pdf_combi_prctg{i},range_pdf_prctg{i},cdf_combi_prctg1{i},cdf_combi_prctg2{i},cdf_combi_prctg3{i},cdf_combi_prctg4{i},cdf_combi_prctg{i},range_cdf_prctg{i},media_opt_prctg1(i),media_opt_prctg2(i),media_opt_prctg3(i),media_opt_prctg4(i),media_opt_prctg(i)] = dist_prctgs(srt_cpu{2,i},srt_value_prctg{i},idx_opt{i});
% %     Iteración extra
%     [pdf_combi_opt{i},range_pdf_opt{i},cdf_opt1{i},cdf_opt2{i},cdf_opt3{i},cdf_opt4{i},cdf_combi_opt{i},range_cdf_opt{i},idx_opt{i},media_opt1(i),media_opt2(i),media_opt3(i),media_opt4(i),media_opt(i)] = dist_opt(1,srt_cpu{2,i},centros_opt{i},idx_opt_prctg{i});
%     [srt_value_prctg{i}] = values_prctgs(srt_cpu{2,i}, idx_opt{i});
%     [idx_opt_prctg{i},pdf_combi_prctg{i},range_pdf_prctg{i},cdf_combi_prctg1{i},cdf_combi_prctg2{i},cdf_combi_prctg3{i},cdf_combi_prctg4{i},cdf_combi_prctg{i},range_cdf_prctg{i},media_opt_prctg1(i),media_opt_prctg2(i),media_opt_prctg3(i),media_opt_prctg4(i),media_opt_prctg(i)] = dist_prctgs(srt_cpu{2,i},srt_value_prctg{i},idx_opt{i});
% 
% %     [pdf_combi_test{i},range_pdf_test{i},cdf_combi_test1{i},cdf_combi_test2{i},cdf_combi_test3{i},cdf_combi_test4{i},cdf_combi_test{i},range_cdf_test{i},idx_test{i},media_test1(i),media_test2(i),media_test3(i),media_test4(i),media_test(i)] = dist_opt_test(0,srt_cpu{2,i},centros_opt{i},0);
% %     [srt_value_prctg_test{i}] = values_prctgs(srt_cpu{2,i}, idx_test{i});
% %     [idx_test_prctg{i},pdf_combi_prctg_test{i},range_pdf_prctg_test{i},cdf_combi_prctg_test1{i},cdf_combi_prctg_test2{i},cdf_combi_prctg_test3{i},cdf_combi_prctg_test4{i},cdf_combi_prctg_test{i},range_cdf_prctg_test{i},media_test_prctg1(i),media_test_prctg2(i),media_test_prctg3(i),media_test_prctg4(i),media_test_prctg(i)] = dist_prctgs(srt_cpu{2,i},srt_value_prctg_test{i},idx_test{i});
% % %     Iteración extra
% %     [pdf_combi_test{i},range_pdf_test{i},cdf_combi_test1{i},cdf_combi_test2{i},cdf_combi_test3{i},cdf_combi_test4{i},cdf_combi_test{i},range_cdf_test{i},idx_test{i},media_test1(i),media_test2(i),media_test3(i),media_test4(i),media_test(i)] = dist_opt_test(1,srt_cpu{2,i},centros_opt{i},idx_test_prctg{i});
% %     [srt_value_prctg_test{i}] = values_prctgs(srt_cpu{2,i}, idx_test{i});
% %     [idx_test_prctg{i},pdf_combi_prctg_test{i},range_pdf_prctg_test{i},cdf_combi_prctg_test1{i},cdf_combi_prctg_test2{i},cdf_combi_prctg_test3{i},cdf_combi_prctg_test4{i},cdf_combi_prctg_test{i},range_cdf_prctg_test{i},media_test_prctg1(i),media_test_prctg2(i),media_test_prctg3(i),media_test_prctg4(i),media_test_prctg(i)] = dist_prctgs(srt_cpu{2,i},srt_value_prctg_test{i},idx_test{i});
% %     
% %     [pdf_combi,range_pdf,cdf_combi,range_cdf]=get_ranges(centros_opt(i),srt_cpu{2,i});
% %     
% %     [centros_opt{i},pdf_opt{i},cdf_opt{i}]=dist_min(srt_cpu{2,i},interval_cdf);
%     
% 
%     
% %     figure
% %     hold on
% %     histogram(srt_cpu{2,i}, 'Normalization', 'pdf')
% %     plot(range_pdf,pdf_combi, 'LineWidth', 2)
% %     ylabel('PDF')
% %     title(['Histograma SRT carga CPU=',num2str((i*5)-5),'%'])
% %     xlabel('SRT en \mus')
% %     xlim([0 100])
% %     
% %     percentil_95_mixtura(i) = prctile(mixtura_principal,95);
% %     percentil_99_mixtura(i) = prctile(mixtura_principal,99);
% %     percentil_50_mixtura(i) = prctile(mixtura_principal,50);
% %     media_mixtura(i) = mean(mixtura_principal);
% %     
% %     subplot(3,7,i)
% %     histogram(mixtura_principal,nbins);
% %     hold on
% %     xline(percentil_95_mixtura(i), '--r','Percentil 95')
% %     xline(percentil_99_mixtura(i), '--b','Percentil 99')
% %     xline(percentil_50_mixtura(i), '--g','Percentil 50')
% %     xline(media_mixtura(i),'--m','Media')
% %     title(['Histograma SRT cluster carga CPU=',num2str((i*5)-5),'%'])
% %     xlabel('SRT en \mus')
% %     ylabel('Nº de paquetes')
% %     xlim([0 100])
%     
% end

%%
%Sacamos la media y los percentiles para todas las cargas de las 4 mixturas
%posibles
percentil_90_opt=zeros(1,length(srt_cpu));
percentil_90_opt1=zeros(1,length(srt_cpu));
percentil_90_opt2=zeros(1,length(srt_cpu));
percentil_90_opt3=zeros(1,length(srt_cpu));
percentil_90_opt4=zeros(1,length(srt_cpu));

percentil_90_test=zeros(1,length(srt_cpu));
percentil_90_test1=zeros(1,length(srt_cpu));
percentil_90_test2=zeros(1,length(srt_cpu));
percentil_90_test3=zeros(1,length(srt_cpu));
percentil_90_test4=zeros(1,length(srt_cpu));

percentil_90_opt_prctg=zeros(1,length(srt_cpu));
percentil_90_opt_prctg1=zeros(1,length(srt_cpu));
percentil_90_opt_prctg2=zeros(1,length(srt_cpu));
percentil_90_opt_prctg3=zeros(1,length(srt_cpu));
percentil_90_opt_prctg4=zeros(1,length(srt_cpu));

percentil_90_test_prctg=zeros(1,length(srt_cpu));
percentil_90_test_prctg1=zeros(1,length(srt_cpu));
percentil_90_test_prctg2=zeros(1,length(srt_cpu));
percentil_90_test_prctg3=zeros(1,length(srt_cpu));
percentil_90_test_prctg4=zeros(1,length(srt_cpu));

percentil_95_opt=zeros(1,length(srt_cpu));
percentil_95_test=zeros(1,length(srt_cpu));
percentil_95_opt_prctg=zeros(1,length(srt_cpu));
percentil_95_test_prctg=zeros(1,length(srt_cpu));

percentil_99_opt=zeros(1,length(srt_cpu));
percentil_99_test=zeros(1,length(srt_cpu));
percentil_99_opt_prctg=zeros(1,length(srt_cpu));
percentil_99_test_prctg=zeros(1,length(srt_cpu));

percentil_50_opt=zeros(1,length(srt_cpu));
percentil_50_opt_prctg=zeros(1,length(srt_cpu));

%load('pdf_cdf_medias.mat');
% load('pdf_cdf_medias_iteracion.mat');
%load('centros.mat');
load('pdf_cdf_medias_iter_new.mat');
load('centros_new.mat');
for i=1:length(srt_cpu)
    %Percentiles 90 de la distribucion óptima
    [~, closest_cdf_opt] = min(abs(cdf_combi_opt{i}-0.90));
    percentil_90_opt(i) = range_cdf_opt{i}(closest_cdf_opt);
    
    [~, closest_cdf_opt] = min(abs(cdf_opt1{i}-0.90));
    percentil_90_opt1(i) = range_cdf_opt{i}(closest_cdf_opt);
    
    [~, closest_cdf_opt] = min(abs(cdf_opt2{i}-0.90));
    percentil_90_opt2(i) = range_cdf_opt{i}(closest_cdf_opt);
    
    [~, closest_cdf_opt] = min(abs(cdf_opt3{i}-0.90));
    percentil_90_opt3(i) = range_cdf_opt{i}(closest_cdf_opt);
    
    [~, closest_cdf_opt] = min(abs(cdf_opt4{i}-0.90));
    percentil_90_opt4(i) = range_cdf_opt{i}(closest_cdf_opt);
    
    %Percentiles 90 de la distribución óptima con porcentajes
    [~, closest_cdf_opt_prctg] = min(abs(cdf_combi_prctg{i}-0.90));
    percentil_90_opt_prctg(i) = range_cdf_prctg{i}(closest_cdf_opt_prctg);
    
    [~, closest_cdf_opt_prctg] = min(abs(cdf_combi_prctg1{i}-0.90));
    percentil_90_opt_prctg1(i) = range_cdf_prctg{i}(closest_cdf_opt_prctg);
    
    [~, closest_cdf_opt_prctg] = min(abs(cdf_combi_prctg2{i}-0.90));
    percentil_90_opt_prctg2(i) = range_cdf_prctg{i}(closest_cdf_opt_prctg);
    
    [~, closest_cdf_opt_prctg] = min(abs(cdf_combi_prctg3{i}-0.90));
    percentil_90_opt_prctg3(i) = range_cdf_prctg{i}(closest_cdf_opt_prctg);
    
    [~, closest_cdf_opt_prctg] = min(abs(cdf_combi_prctg4{i}-0.90));
    percentil_90_opt_prctg4(i) = range_cdf_prctg{i}(closest_cdf_opt_prctg);
    
    %Percentiles 90 de la distribución test
    [~, closest_cdf_test] = min(abs(cdf_combi_test{i}-0.90));
    percentil_90_test(i) = range_cdf_test{i}(closest_cdf_test);
    
    [~, closest_cdf_test] = min(abs(cdf_combi_test1{i}-0.90));
    percentil_90_test1(i) = range_cdf_test{i}(closest_cdf_test);
    
    [~, closest_cdf_test] = min(abs(cdf_combi_test2{i}-0.90));
    percentil_90_test2(i) = range_cdf_test{i}(closest_cdf_test);
    
    [~, closest_cdf_test] = min(abs(cdf_combi_test3{i}-0.90));
    percentil_90_test3(i) = range_cdf_test{i}(closest_cdf_test);
    
    [~, closest_cdf_test] = min(abs(cdf_combi_test4{i}-0.90));
    percentil_90_test4(i) = range_cdf_test{i}(closest_cdf_test);
    
    %Percentiles 90 de la distribución test con porcentajes
    [~, closest_cdf_test_prctg] = min(abs(cdf_combi_prctg_test{i}-0.90));
    percentil_90_test_prctg(i) = range_cdf_prctg_test{i}(closest_cdf_test_prctg);
    
    [~, closest_cdf_test_prctg] = min(abs(cdf_combi_prctg_test1{i}-0.90));
    percentil_90_test_prctg1(i) = range_cdf_prctg_test{i}(closest_cdf_test_prctg);
    
    [~, closest_cdf_test_prctg] = min(abs(cdf_combi_prctg_test2{i}-0.90));
    percentil_90_test_prctg2(i) = range_cdf_prctg_test{i}(closest_cdf_test_prctg);
    
    [~, closest_cdf_test_prctg] = min(abs(cdf_combi_prctg_test3{i}-0.90));
    percentil_90_test_prctg3(i) = range_cdf_prctg_test{i}(closest_cdf_test_prctg);
    
    [~, closest_cdf_test_prctg] = min(abs(cdf_combi_prctg_test4{i}-0.90));
    percentil_90_test_prctg4(i) = range_cdf_prctg_test{i}(closest_cdf_test_prctg);
    
    %Percentiles 95 de la distribucion óptima
    [~, closest_cdf_opt] = min(abs(cdf_combi_opt{i}-0.95));
    percentil_95_opt(i) = range_cdf_opt{i}(closest_cdf_opt);
    
    %Percentiles 95 de la distribución óptima con porcentajes
    [~, closest_cdf_opt_prctg] = min(abs(cdf_combi_prctg{i}-0.95));
    percentil_95_opt_prctg(i) = range_cdf_prctg{i}(closest_cdf_opt_prctg);
    
    %Percentiles 95 de la distribucion test
    [~, closest_cdf_test] = min(abs(cdf_combi_test{i}-0.95));
    percentil_95_test(i) = range_cdf_opt{i}(closest_cdf_test);
    
    %Percentiles 95 de la distribución test con porcentajes
    [~, closest_cdf_test_prctg] = min(abs(cdf_combi_prctg_test{i}-0.95));
    percentil_95_test_prctg(i) = range_cdf_prctg{i}(closest_cdf_test_prctg);
    
    %Percentiles 99 de la distribucion óptima
    [~, closest_cdf_opt] = min(abs(cdf_combi_opt{i}-0.99));
    percentil_99_opt(i) = range_cdf_opt{i}(closest_cdf_opt);
    
    %Percentiles 99 de la distribución óptima con porcentajes
    [~, closest_cdf_opt_prctg] = min(abs(cdf_combi_prctg{i}-0.99));
    percentil_99_opt_prctg(i) = range_cdf_prctg{i}(closest_cdf_opt_prctg);
    
    %Percentiles 99 de la distribucion test
    [~, closest_cdf_test] = min(abs(cdf_combi_test{i}-0.99));
    percentil_99_test(i) = range_cdf_opt{i}(closest_cdf_test);
    
    %Percentiles 99 de la distribución test con porcentajes
    [~, closest_cdf_test_prctg] = min(abs(cdf_combi_prctg_test{i}-0.99));
    percentil_99_test_prctg(i) = range_cdf_prctg{i}(closest_cdf_test_prctg);
    
        
    %Percentiles 50 de la distribucion óptima
    [~, closest_cdf_opt] = min(abs(cdf_combi_opt{i}-0.5));
    percentil_50_opt(i) = range_cdf_opt{i}(closest_cdf_opt);
    
    %Percentiles 50 de la distribución óptima con porcentajes
    [~, closest_cdf_opt_prctg] = min(abs(cdf_combi_prctg{i}-0.5));
    percentil_50_opt_prctg(i) = range_cdf_prctg{i}(closest_cdf_opt_prctg);
end
%%
%Dibujamos las pdfs con su media y percentil 90

% figure
% hold on
% plot(range_cdf_srt, cdf_srt)
% plot(range_cdf, cdf_combi)
% legend('Real', 'Ajuste')
% f1=figure;
% h=histogram(srt_cpu{2,10}, 'Normalization', 'cdf');
% cdf_srt = h.Values;
% cdf_srt(end+1)=1;
% range_cdf_srt = h.BinEdges;
% close(f1)
% 
% figure
% hold on
% plot(range_cdf_srt, cdf_srt)
% plot(range_cdf_opt{10}, cdf_combi_opt{10})
% title('CDF óptima')

% %Representar pdfs con su media y su percentil 90
% for i=1:length(srt_cpu)
%     
%     figure;
%     plot(range_pdf_opt{i},pdf_combi_opt{i})
%     xline(percentil_90_opt(i), '--r','Percentil 90')
%     xline(media_opt(i),'--m','Media')
%     title(['CDF óptima SRT carga CPU=',num2str((i*5)-5),'%'])
%     xlabel('SRT en \mus')
%     ylabel('Nº de paquetes')
%     xlim([0 100])
% end
%%
%Gráficas 50% y 90%
% percentil_95_50 = prctile(srt_cpu{2,11},95);
% percentil_99_50 = prctile(srt_cpu{2,11},99);
% percentil_50_50 = prctile(srt_cpu{2,11},50);
% media_50 = mean(srt_cpu{2,11});
% 
% figure
% histogram(srt_cpu{2,11},nbins_cpu{2,11});
% hold on
% xline(percentil_95_50, '--r','Percentil 95')
% xline(percentil_99_50, '--b','Percentil 99')
% xline(percentil_50_50, '--g','Percentil 50')
% xline(media_50,'--m','Media')
% title('Histograma SRT 50 % Carga')
% xlabel('SRT en \mus')
% ylabel('Nº de paquetes')
% 
% percentil_95_90 = prctile(srt_cpu{2,19},95);
% percentil_99_90 = prctile(srt_cpu{2,19},99);
% percentil_50_90 = prctile(srt_cpu{2,19},50);
% media_90 = mean(srt_cpu{2,19});
% 
% figure
% histogram(srt_cpu{2,19},nbins_cpu{2,19});
% hold on
% xline(percentil_95_90, '--r','Percentil 95')
% xline(percentil_99_90, '--b','Percentil 99')
% xline(percentil_50_90, '--g','Percentil 50')
% xline(media_90,'--m','Media')
% title('Histograma SRT 90 % Carga')
% xlabel('SRT en \mus')
% ylabel('Nº de paquetes')

%%
%Regresiones variables
modelfun = @(B,x) B(1).*log(x) + B(2); 
beta0 = [1;1];

%Regresiones para la media
nmin=min(media_cpu);
nmax=max(media_cpu);
n_media=(nmax-nmin)/100;
rango_media=nmin:n_media:nmax;

%Regresión lineal
[pmedia_1,S] = polyfit(media_cpu,cargas_calib,1); 
[ymedia_1,desv_1]=polyval(pmedia_1,media_cpu,S);
desv_1 = mean(desv_1);
errormedia_orden1=immse(cargas_calib,ymedia_1);
ymedia_1=polyval(pmedia_1,rango_media);

%Regresión 2º orden
[pmedia_2,S] = polyfit(media_cpu,cargas_calib,2); 
[ymedia_2,desv_2]=polyval(pmedia_2,media_cpu,S);
desv_2 = mean(desv_2);
errormedia_orden2=immse(cargas_calib,ymedia_2);
ymedia_2=polyval(pmedia_2,rango_media);

%Regresión 3º orden
[pmedia_3,S] = polyfit(media_cpu,cargas_calib,3);
[ymedia_3_error,desv_3]=polyval(pmedia_3,media_cpu,S);
desv_3 = mean(desv_3);
errormedia_orden3=immse(cargas_calib,ymedia_3_error);
ymedia_3=polyval(pmedia_3,rango_media);

%Regresión lograrítimica
[beta_media,~,~,~,MSE_media,~] = nlinfit(media_cpu,cargas_calib,modelfun,beta0);
flog_media=beta_media(1).*log(media_cpu)+beta_media(2);
errormedia_log=immse(cargas_calib,flog_media);

%Regresión 3º orden mixtura optima
pmedia_3_mix_opt = polyfit(media_opt,cargas_calib,3);
nmin = min(media_opt);
nmax = max(media_opt);
n_media = (nmax-nmin)/100;
rango_media_mix = nmin:n_media:nmax;
ymedia_3_mix_opt = polyval(pmedia_3_mix_opt,rango_media_mix);

%Representamos ajuste media mixtura optima 
figure
plot(media_opt,cargas_calib,'o')
hold on
plot(rango_media_mix,ymedia_3_mix_opt,'g')
title('Media Mixtura Óptima')
ylim([0 100])
ylabel('Cargas medias CPU en %')
xlabel('Tiempos de SRT en \mus')
legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura optima cluster 1
pmedia_3_mix_opt1 = polyfit(media_opt1,cargas_calib,3);
nmin = min(media_opt1);
nmax = max(media_opt1);
n_media = (nmax-nmin)/100;
rango_media_mix = nmin:n_media:nmax;
ymedia_3_mix_opt1 = polyval(pmedia_3_mix_opt1,rango_media_mix);

% %Representamos ajuste media mixtura optima cluster 1
% figure
% plot(media_opt1,cargas_calib,'o')
% hold on
% plot(rango_media_mix,ymedia_3_mix_opt1,'g')
% title('Media Mixtura Óptima Cluster 1')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura optima cluster 2
pmedia_3_mix_opt2 = polyfit(media_opt2,cargas_calib,3);
nmin = min(media_opt2);
nmax = max(media_opt2);
n_media = (nmax-nmin)/100;
rango_media_mix = nmin:n_media:nmax;
ymedia_3_mix_opt2 = polyval(pmedia_3_mix_opt2,rango_media_mix);

% %Representamos ajuste media mixtura optima cluster 2
% figure
% plot(media_opt2,cargas_calib,'o')
% hold on
% plot(rango_media_mix,ymedia_3_mix_opt2,'g')
% title('Media Mixtura Óptima Cluster 2')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura optima cluster 3
pmedia_3_mix_opt3 = polyfit(media_opt3,cargas_calib,3);
nmin = min(media_opt3);
nmax = max(media_opt3);
n_media = (nmax-nmin)/100;
rango_media_mix = nmin:n_media:nmax;
ymedia_3_mix_opt3 = polyval(pmedia_3_mix_opt3,rango_media_mix);

% %Representamos ajuste media mixtura optima cluster 3
% figure
% plot(media_opt3,cargas_calib,'o')
% hold on
% plot(rango_media_mix,ymedia_3_mix_opt3,'g')
% title('Media Mixtura Óptima Cluster 3')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura optima cluster 4
pmedia_3_mix_opt4 = polyfit(media_opt4,cargas_calib,3);
nmin = min(media_opt4);
nmax = max(media_opt4);
n_media = (nmax-nmin)/100;
rango_media_mix = nmin:n_media:nmax;
ymedia_3_mix_opt4 = polyval(pmedia_3_mix_opt4,rango_media_mix);

% %Representamos ajuste media mixtura optima cluster 4
% figure
% plot(media_opt4,cargas_calib,'o')
% hold on
% plot(rango_media_mix,ymedia_3_mix_opt4,'g')
% title('Media Mixtura Óptima Cluster 4')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura optima porcentajes
pmedia_3_mix_opt_prctg = polyfit(media_opt_prctg,cargas_calib,3);
nmin = min(media_opt_prctg);
nmax = max(media_opt_prctg);
n_media = (nmax-nmin)/100;
ymedia_error_opt_prctg=polyval(pmedia_3_mix_opt_prctg,media_opt_prctg);
rango_media_mix = nmin:n_media:nmax;
ymedia_3_mix_opt_prctg = polyval(pmedia_3_mix_opt_prctg,rango_media_mix);
%MAPE 
mape_media_calib_opt_prctg = mape(cargas_calib,ymedia_error_opt_prctg);

%Representamos ajuste media mixtura optima porcentajes
figure
plot(media_opt_prctg,cargas_calib,'o')
hold on
plot(rango_media_mix,ymedia_3_mix_opt_prctg,'g')
title('Media Mixtura Óptima Porcentajes')
ylim([0 100])
ylabel('Cargas medias CPU en %')
xlabel('Tiempos de SRT en \mus')
legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura optima porcentajes cluster 1
pmedia_3_mix_opt_prctg1 = polyfit(media_opt_prctg1,cargas_calib,3);
nmin = min(media_opt_prctg1);
nmax = max(media_opt_prctg1);
n_media = (nmax-nmin)/100;
rango_media_mix = nmin:n_media:nmax;
ymedia_3_mix_opt_prctg1 = polyval(pmedia_3_mix_opt_prctg1,rango_media_mix);

% %Representamos ajuste media mixtura optima porcentajes cluster 1
% figure
% plot(media_opt_prctg1,cargas_calib,'o')
% hold on
% plot(rango_media_mix,ymedia_3_mix_opt_prctg1,'g')
% title('Media Mixtura Óptima Porcentajes Cluster 1')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura optima porcentajes cluster 2
pmedia_3_mix_opt_prctg2 = polyfit(media_opt_prctg2,cargas_calib,3);
nmin = min(media_opt_prctg2);
nmax = max(media_opt_prctg2);
n_media = (nmax-nmin)/100;
rango_media_mix = nmin:n_media:nmax;
ymedia_3_mix_opt_prctg2 = polyval(pmedia_3_mix_opt_prctg2,rango_media_mix);

% %Representamos ajuste media mixtura optima porcentajes cluster 2
% figure
% plot(media_opt_prctg2,cargas_calib,'o')
% hold on
% plot(rango_media_mix,ymedia_3_mix_opt_prctg2,'g')
% title('Media Mixtura Óptima Porcentajes Cluster 2')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura optima porcentajes cluster 3
pmedia_3_mix_opt_prctg3 = polyfit(media_opt_prctg3,cargas_calib,3);
nmin = min(media_opt_prctg3);
nmax = max(media_opt_prctg3);
n_media = (nmax-nmin)/100;
rango_media_mix = nmin:n_media:nmax;
ymedia_3_mix_opt_prctg3 = polyval(pmedia_3_mix_opt_prctg3,rango_media_mix);

% %Representamos ajuste media mixtura optima porcentajes cluster 3
% figure
% plot(media_opt_prctg3,cargas_calib,'o')
% hold on
% plot(rango_media_mix,ymedia_3_mix_opt_prctg3,'g')
% title('Media Mixtura Óptima Porcentajes Cluster 3')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura optima porcentajes cluster 4
pmedia_3_mix_opt_prctg4 = polyfit(media_opt_prctg4,cargas_calib,3);
nmin = min(media_opt_prctg4);
nmax = max(media_opt_prctg4);
n_media = (nmax-nmin)/100;
rango_media_mix = nmin:n_media:nmax;
ymedia_3_mix_opt_prctg4 = polyval(pmedia_3_mix_opt_prctg4,rango_media_mix);

% %Representamos ajuste media mixtura optima porcentajes cluster 4
% figure
% plot(media_opt_prctg4,cargas_calib,'o')
% hold on
% plot(rango_media_mix,ymedia_3_mix_opt_prctg4,'g')
% title('Media Mixtura Óptima Porcentajes Cluster 4')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura test
pmedia_3_mix_test = polyfit(media_test,cargas_calib,3);
nmin = min(media_test);
nmax = max(media_test);
n_media = (nmax-nmin)/100;
rango_media_mix = nmin:n_media:nmax;
ymedia_3_mix_test = polyval(pmedia_3_mix_test,rango_media_mix);

%Representamos ajuste media mixtura test
figure
plot(media_test,cargas_calib,'o')
hold on
plot(rango_media_mix,ymedia_3_mix_test,'g')
title('Media Mixtura Test')
ylim([0 100])
ylabel('Cargas medias CPU en %')
xlabel('Tiempos de SRT en \mus')
legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura test cluster 1
pmedia_3_mix_test1 = polyfit(media_test1,cargas_calib,3);
nmin = min(media_test1);
nmax = max(media_test1);
n_media = (nmax-nmin)/100;
rango_media_mix = nmin:n_media:nmax;
ymedia_3_mix_test1 = polyval(pmedia_3_mix_test1,rango_media_mix);

% %Representamos ajuste media mixtura test cluster 1
% figure
% plot(media_test1,cargas_calib,'o')
% hold on
% plot(rango_media_mix,ymedia_3_mix_test1,'g')
% title('Media Mixtura Test Cluster 1')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura test cluster 2
pmedia_3_mix_test2 = polyfit(media_test2,cargas_calib,3);
nmin = min(media_test2);
nmax = max(media_test2);
n_media = (nmax-nmin)/100;
rango_media_mix = nmin:n_media:nmax;
ymedia_3_mix_test2 = polyval(pmedia_3_mix_test2,rango_media_mix);

% %Representamos ajuste media mixtura test cluster 2
% figure
% plot(media_test2,cargas_calib,'o')
% hold on
% plot(rango_media_mix,ymedia_3_mix_test2,'g')
% title('Media Mixtura Test Cluster 2')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura test cluster 3
pmedia_3_mix_test3 = polyfit(media_test3,cargas_calib,3);
nmin = min(media_test3);
nmax = max(media_test3);
n_media = (nmax-nmin)/100;
rango_media_mix = nmin:n_media:nmax;
ymedia_3_mix_test3 = polyval(pmedia_3_mix_test3,rango_media_mix);

% %Representamos ajuste media mixtura test cluster 3
% figure
% plot(media_test3,cargas_calib,'o')
% hold on
% plot(rango_media_mix,ymedia_3_mix_test3,'g')
% title('Media Mixtura Test Cluster 3')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura test cluster 4
pmedia_3_mix_test4 = polyfit(media_test4,cargas_calib,3);
nmin = min(media_test4);
nmax = max(media_test4);
n_media = (nmax-nmin)/100;
rango_media_mix = nmin:n_media:nmax;
ymedia_3_mix_test4 = polyval(pmedia_3_mix_test4,rango_media_mix);

% %Representamos ajuste media mixtura test cluster 4
% figure
% plot(media_test4,cargas_calib,'o')
% hold on
% plot(rango_media_mix,ymedia_3_mix_test4,'g')
% title('Media Mixtura Test Cluster 4')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura test porcentaje
pmedia_3_mix_test_prctg = polyfit(media_test_prctg,cargas_calib,3);
nmin = min(media_test_prctg);
nmax = max(media_test_prctg);
n_media = (nmax-nmin)/100;
rango_media_mix = nmin:n_media:nmax;
ymedia_3_mix_test_prctg = polyval(pmedia_3_mix_test_prctg,rango_media_mix);

%Representamos ajuste media mixtura test porcentaje
figure
plot(media_test_prctg,cargas_calib,'o')
hold on
plot(rango_media_mix,ymedia_3_mix_test_prctg,'g')
title('Media Mixtura Test Porcentajes')
ylim([0 100])
ylabel('Cargas medias CPU en %')
xlabel('Tiempos de SRT en \mus')
legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura test porcentaje cluster 1
pmedia_3_mix_test_prctg1 = polyfit(media_test_prctg1,cargas_calib,3);
nmin = min(media_test_prctg1);
nmax = max(media_test_prctg1);
n_media = (nmax-nmin)/100;
rango_media_mix = nmin:n_media:nmax;
ymedia_3_mix_test_prctg1 = polyval(pmedia_3_mix_test_prctg1,rango_media_mix);

% %Representamos ajuste media mixtura test porcentaje cluster 1
% figure
% plot(media_test_prctg1,cargas_calib,'o')
% hold on
% plot(rango_media_mix,ymedia_3_mix_test_prctg1,'g')
% title('Media Mixtura Test Porcentajes Cluster 1')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura test porcentaje cluster 2
pmedia_3_mix_test_prctg2 = polyfit(media_test_prctg2,cargas_calib,3);
nmin = min(media_test_prctg2);
nmax = max(media_test_prctg2);
n_media = (nmax-nmin)/100;
rango_media_mix = nmin:n_media:nmax;
ymedia_3_mix_test_prctg2 = polyval(pmedia_3_mix_test_prctg2,rango_media_mix);

% %Representamos ajuste media mixtura test porcentaje cluster 2
% figure
% plot(media_test_prctg2,cargas_calib,'o')
% hold on
% plot(rango_media_mix,ymedia_3_mix_test_prctg2,'g')
% title('Media Mixtura Test Porcentajes Cluster 2')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura test porcentaje cluster 3
pmedia_3_mix_test_prctg3 = polyfit(media_test_prctg3,cargas_calib,3);
nmin = min(media_test_prctg3);
nmax = max(media_test_prctg3);
n_media = (nmax-nmin)/100;
rango_media_mix = nmin:n_media:nmax;
ymedia_3_mix_test_prctg3 = polyval(pmedia_3_mix_test_prctg3,rango_media_mix);

% %Representamos ajuste media mixtura test porcentaje cluster 3
% figure
% plot(media_test_prctg3,cargas_calib,'o')
% hold on
% plot(rango_media_mix,ymedia_3_mix_test_prctg3,'g')
% title('Media Mixtura Test Porcentajes Cluster 3')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura test porcentaje cluster 4
pmedia_3_mix_test_prctg4 = polyfit(media_test_prctg4,cargas_calib,3);
nmin = min(media_test_prctg4);
nmax = max(media_test_prctg4);
n_media = (nmax-nmin)/100;
rango_media_mix = nmin:n_media:nmax;
ymedia_3_mix_test_prctg4 = polyval(pmedia_3_mix_test_prctg4,rango_media_mix);

% %Representamos ajuste media mixtura test porcentaje cluster 4
% figure
% plot(media_test_prctg4,cargas_calib,'o')
% hold on
% plot(rango_media_mix,ymedia_3_mix_test_prctg4,'g')
% title('Media Mixtura Test Porcentajes Cluster 4')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')

%Representamos ajuste media original
figure
plot(media_cpu,cargas_calib,'o')
hold on
% plot(media_cpu,ymedia_1,'k')
hold on
% plot(media_cpu,ymedia_2,'b')
hold on
plot(rango_media,ymedia_3,'g')
hold on
% plot(media_cpu,modelfun(beta_media,media_cpu),'r')
title('Media Original')
ylim([0 100])
ylabel('Cargas medias CPU en %')
xlabel('Tiempos de SRT en \mus')
legend('Valores reales','Orden 3')
% legend('Valores reales','Lineal','Orden 2','Orden 3','Logarítmica')
%%
%Regresiones percentil 50

%Percentil 50 datos originales
nmin=min(percentil_50_cpu);
nmax=max(percentil_50_cpu);
n_50=(nmax-nmin)/100;
rango_50=nmin:n_50:nmax;

%Regresión lineal
[p50_1,S] = polyfit(percentil_50_cpu,cargas_calib,1); 
[y50_1,desv_1]=polyval(p50_1,percentil_50_cpu,S);
desv_1 = mean(desv_1);
errorp50_orden1=immse(cargas_calib,y50_1);
y50_1=polyval(p50_1,rango_50);

%Regresión 2º orden
[p50_2,S] = polyfit(percentil_50_cpu,cargas_calib,2); 
[y50_2,desv_2]=polyval(p50_2,percentil_50_cpu,S);
desv_2 = mean(desv_2);
errorp50_orden2=immse(cargas_calib,y50_2);
y50_2=polyval(p50_2,rango_50);

%Regresión 3º orden
[p50_3,S] = polyfit(percentil_50_cpu,cargas_calib,3); 
[y50_3,desv_3]=polyval(p50_3,percentil_50_cpu,S);
desv_3 = mean(desv_3);
errorp50_orden3=immse(cargas_calib,y50_3);
y50_3=polyval(p50_3,rango_50);

%Regresión lograrítimica
[beta_p50,~,~,~,MSE_media,~] = nlinfit(percentil_50_cpu,cargas_calib,modelfun,beta0);
flog_p50=beta_p50(1).*log(percentil_50_cpu)+beta_p50(2);
errorp50_log=immse(cargas_calib,flog_p50);



%Regresión 3º orden mixtura optima
p50_3_mix_opt = polyfit(percentil_50_opt,cargas_calib,3);
nmin = min(percentil_50_opt);
nmax = max(percentil_50_opt);
n_p50 = (nmax-nmin)/100;
rango_p50_mix = nmin:n_p50:nmax;
y50_3_mix_opt = polyval(p50_3_mix_opt,rango_p50_mix);

%Representamos ajuste percentil 90 mixtura optima
figure
plot(percentil_50_opt,cargas_calib,'o')
hold on
plot(rango_p50_mix,y50_3_mix_opt,'g')
title('Percentil 50 Mixtura Óptima')
ylim([0 100])
ylabel('Cargas medias CPU en %')
xlabel('Tiempos de SRT en \mus')
legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura optima con porcentajes
p50_3_mix_opt_prctg = polyfit(percentil_50_opt_prctg,cargas_calib,3);
nmin = min(percentil_50_opt_prctg);
nmax = max(percentil_50_opt_prctg);
n_p50 = (nmax-nmin)/100;
rango_p50_mix = nmin:n_p50:nmax;
y50_error_opt_prctg=polyval(p50_3_mix_opt_prctg,percentil_50_opt_prctg);
y50_3_mix_opt_prctg = polyval(p50_3_mix_opt_prctg,rango_p50_mix);
%MAPE
mape_50_calib_opt_prctg = mape(cargas_calib,y50_error_opt_prctg);
%Representamos ajuste percentil 50 mixtura optima con porcentajes
figure
plot(percentil_50_opt_prctg,cargas_calib,'o')
hold on
plot(rango_p50_mix,y50_3_mix_opt,'g')
title('Percentil 50 Mixtura Óptima Porcentajes')
ylim([0 100])
ylabel('Cargas medias CPU en %')
xlabel('Tiempos de SRT en \mus')
legend('Valores reales','Orden 3')
%%
%Regresiones para el percentil 90
%Percentil 90 datos originales
nmin=min(percentil_90_cpu);
nmax=max(percentil_90_cpu);
n_90=(nmax-nmin)/100;
rango_90=nmin:n_90:nmax;
%Regresión 3º orden
p90_3 = polyfit(percentil_90_cpu,cargas_calib,3);
y90_3_error=polyval(p90_3,percentil_90_cpu);
errorp90_orden3=immse(cargas_calib,y90_3_error);
y90_3=polyval(p90_3,rango_90);

figure
plot(percentil_90_cpu,cargas_calib,'o')
hold on
plot(rango_90, y90_3)
title('Percentil 90 Originales')
ylim([0 100])
ylabel('Cargas medias CPU en %')
xlabel('Tiempos de SRT en \mus')
legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura optima
p90_3_mix_opt = polyfit(percentil_90_opt,cargas_calib,3);
nmin = min(percentil_90_opt);
nmax = max(percentil_90_opt);
n_p90 = (nmax-nmin)/100;
rango_p90_mix = nmin:n_p90:nmax;
y90_3_mix_opt = polyval(p90_3_mix_opt,rango_p90_mix);

%Representamos ajuste percentil 90 mixtura optima
figure
plot(percentil_90_opt,cargas_calib,'o')
hold on
plot(rango_p90_mix,y90_3_mix_opt,'g')
title('Percentil 90 Mixtura Óptima')
ylim([0 100])
ylabel('Cargas medias CPU en %')
xlabel('Tiempos de SRT en \mus')
legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura optima cluster 1
p90_3_mix_opt1 = polyfit(percentil_90_opt1,cargas_calib,3);
nmin = min(percentil_90_opt1);
nmax = max(percentil_90_opt1);
n_p90 = (nmax-nmin)/100;
rango_p90_mix = nmin:n_p90:nmax;
y90_3_mix_opt1 = polyval(p90_3_mix_opt1,rango_p90_mix);

% %Representamos ajuste percentil 90 mixtura optima cluster 1
% figure
% plot(percentil_90_opt1,cargas_calib,'o')
% hold on
% plot(rango_p90_mix,y90_3_mix_opt1,'g')
% title('Percentil 90 Mixtura Óptima Cluster 1')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura optima cluster 2
p90_3_mix_opt2 = polyfit(percentil_90_opt2,cargas_calib,3);
nmin = min(percentil_90_opt2);
nmax = max(percentil_90_opt2);
n_p90 = (nmax-nmin)/100;
rango_p90_mix = nmin:n_p90:nmax;
y90_3_mix_opt2 = polyval(p90_3_mix_opt2,rango_p90_mix);

% %Representamos ajuste percentil 90 mixtura optima cluster 2
% figure
% plot(percentil_90_opt2,cargas_calib,'o')
% hold on
% plot(rango_p90_mix,y90_3_mix_opt2,'g')
% title('Percentil 90 Mixtura Óptima Cluster 2')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura optima cluster 3
p90_3_mix_opt3 = polyfit(percentil_90_opt3,cargas_calib,3);
nmin = min(percentil_90_opt3);
nmax = max(percentil_90_opt3);
n_p90 = (nmax-nmin)/100;
rango_p90_mix = nmin:n_p90:nmax;
y90_3_mix_opt3 = polyval(p90_3_mix_opt3,rango_p90_mix);

% %Representamos ajuste percentil 90 mixtura optima cluster 3
% figure
% plot(percentil_90_opt3,cargas_calib,'o')
% hold on
% plot(rango_p90_mix,y90_3_mix_opt3,'g')
% title('Percentil 90 Mixtura Óptima Cluster 3')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura optima cluster 4
p90_3_mix_opt4 = polyfit(percentil_90_opt4,cargas_calib,3);
nmin = min(percentil_90_opt4);
nmax = max(percentil_90_opt4);
n_p90 = (nmax-nmin)/100;
rango_p90_mix = nmin:n_p90:nmax;
y90_3_mix_opt4 = polyval(p90_3_mix_opt4,rango_p90_mix);

% %Representamos ajuste percentil 90 mixtura optima cluster 4
% figure
% plot(percentil_90_opt4,cargas_calib,'o')
% hold on
% plot(rango_p90_mix,y90_3_mix_opt4,'g')
% title('Percentil 90 Mixtura Óptima Cluster 4')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura optima porcentajes
p90_3_mix_opt_prctg = polyfit(percentil_90_opt_prctg,cargas_calib,3);
nmin = min(percentil_90_opt_prctg);
nmax = max(percentil_90_opt_prctg);
n_p90 = (nmax-nmin)/100;
rango_p90_mix = nmin:n_p90:nmax;
y90_error_opt_prctg=polyval(p90_3_mix_opt_prctg,percentil_90_opt_prctg);
y90_3_mix_opt_prctg = polyval(p90_3_mix_opt_prctg,rango_p90_mix);
%MAPE
mape_90_calib_opt_prctg = mape(cargas_calib,y90_error_opt_prctg);
%Representamos ajuste percentil 90 mixtura optima porcentajes
figure
plot(percentil_90_opt_prctg,cargas_calib,'o')
hold on
plot(rango_p90_mix,y90_3_mix_opt_prctg,'g')
title('Percentil 90 Mixtura Óptima Porcentajes')
ylim([0 100])
ylabel('Cargas medias CPU en %')
xlabel('Tiempos de SRT en \mus')
legend('Valores reales','Orden 3')


%Regresión 3º orden mixtura optima porcentajes cluster 1
p90_3_mix_opt_prctg1 = polyfit(percentil_90_opt_prctg1,cargas_calib,3);
nmin = min(percentil_90_opt_prctg1);
nmax = max(percentil_90_opt_prctg1);
n_p90 = (nmax-nmin)/100;
rango_p90_mix = nmin:n_p90:nmax;
y90_3_mix_opt_prctg1 = polyval(p90_3_mix_opt_prctg1,rango_p90_mix);

% %Representamos ajuste percentil 90 mixtura optima porcentajes cluster 1
% figure
% plot(percentil_90_opt_prctg1,cargas_calib,'o')
% hold on
% plot(rango_p90_mix,y90_3_mix_opt_prctg1,'g')
% title('Percentil 90 Mixtura Óptima Porcentajes Cluster 1')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura optima porcentajes cluster 2
p90_3_mix_opt_prctg2 = polyfit(percentil_90_opt_prctg2,cargas_calib,3);
nmin = min(percentil_90_opt_prctg2);
nmax = max(percentil_90_opt_prctg2);
n_p90 = (nmax-nmin)/100;
rango_p90_mix = nmin:n_p90:nmax;
y90_3_mix_opt_prctg2 = polyval(p90_3_mix_opt_prctg2,rango_p90_mix);

% %Representamos ajuste percentil 90 mixtura optima porcentajes cluster 2
% figure
% plot(percentil_90_opt_prctg2,cargas_calib,'o')
% hold on
% plot(rango_p90_mix,y90_3_mix_opt_prctg2,'g')
% title('Percentil 90 Mixtura Óptima Porcentajes Cluster 2')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura optima porcentajes cluster 3
p90_3_mix_opt_prctg3 = polyfit(percentil_90_opt_prctg3,cargas_calib,3);
nmin = min(percentil_90_opt_prctg3);
nmax = max(percentil_90_opt_prctg3);
n_p90 = (nmax-nmin)/100;
rango_p90_mix = nmin:n_p90:nmax;
y90_3_mix_opt_prctg3 = polyval(p90_3_mix_opt_prctg3,rango_p90_mix);

% %Representamos ajuste percentil 90 mixtura optima porcentajes cluster 3
% figure
% plot(percentil_90_opt_prctg3,cargas_calib,'o')
% hold on
% plot(rango_p90_mix,y90_3_mix_opt_prctg3,'g')
% title('Percentil 90 Mixtura Óptima Porcentajes Cluster 3')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura optima porcentajes cluster 4
p90_3_mix_opt_prctg4 = polyfit(percentil_90_opt_prctg4,cargas_calib,3);
nmin = min(percentil_90_opt_prctg4);
nmax = max(percentil_90_opt_prctg4);
n_p90 = (nmax-nmin)/100;
rango_p90_mix = nmin:n_p90:nmax;
y90_3_mix_opt_prctg4 = polyval(p90_3_mix_opt_prctg4,rango_p90_mix);

% %Representamos ajuste percentil 90 mixtura optima porcentajes cluster 4
% figure
% plot(percentil_90_opt_prctg4,cargas_calib,'o')
% hold on
% plot(rango_p90_mix,y90_3_mix_opt_prctg4,'g')
% title('Percentil 90 Mixtura Óptima Porcentajes Cluster 4')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura test
p90_3_mix_test = polyfit(percentil_90_test,cargas_calib,3);
nmin = min(percentil_90_test);
nmax = max(percentil_90_test);
n_p90 = (nmax-nmin)/100;
rango_p90_mix = nmin:n_p90:nmax;
y90_3_mix_test = polyval(p90_3_mix_test,rango_p90_mix);

%Representamos ajuste percentil 90 mixtura test
figure
plot(percentil_90_test,cargas_calib,'o')
hold on
plot(rango_p90_mix,y90_3_mix_test,'g')
title('Percentil 90 Mixtura Test')
ylim([0 100])
ylabel('Cargas medias CPU en %')
xlabel('Tiempos de SRT en \mus')
legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura test cluster 1
p90_3_mix_test1 = polyfit(percentil_90_test1,cargas_calib,3);
nmin = min(percentil_90_test1);
nmax = max(percentil_90_test1);
n_p90 = (nmax-nmin)/100;
rango_p90_mix = nmin:n_p90:nmax;
y90_3_mix_test1 = polyval(p90_3_mix_test1,rango_p90_mix);

% %Representamos ajuste percentil 90 mixtura test cluster 1
% figure
% plot(percentil_90_test1,cargas_calib,'o')
% hold on
% plot(rango_p90_mix,y90_3_mix_test1,'g')
% title('Percentil 90 Mixtura Test Cluster 1')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura test cluster 2
p90_3_mix_test2 = polyfit(percentil_90_test2,cargas_calib,3);
nmin = min(percentil_90_test2);
nmax = max(percentil_90_test2);
n_p90 = (nmax-nmin)/100;
rango_p90_mix = nmin:n_p90:nmax;
y90_3_mix_test2 = polyval(p90_3_mix_test2,rango_p90_mix);

% %Representamos ajuste percentil 90 mixtura test cluster 2
% figure
% plot(percentil_90_test2,cargas_calib,'o')
% hold on
% plot(rango_p90_mix,y90_3_mix_test2,'g')
% title('Percentil 90 Mixtura Test Cluster 2')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura test cluster 3
p90_3_mix_test3 = polyfit(percentil_90_test3,cargas_calib,3);
nmin = min(percentil_90_test3);
nmax = max(percentil_90_test3);
n_p90 = (nmax-nmin)/100;
rango_p90_mix = nmin:n_p90:nmax;
y90_3_mix_test3 = polyval(p90_3_mix_test3,rango_p90_mix);

% %Representamos ajuste percentil 90 mixtura test cluster 3
% figure
% plot(percentil_90_test3,cargas_calib,'o')
% hold on
% plot(rango_p90_mix,y90_3_mix_test3,'g')
% title('Percentil 90 Mixtura Test Cluster 3')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura test cluster 4
p90_3_mix_test4 = polyfit(percentil_90_test4,cargas_calib,3);
nmin = min(percentil_90_test4);
nmax = max(percentil_90_test4);
n_p90 = (nmax-nmin)/100;
rango_p90_mix = nmin:n_p90:nmax;
y90_3_mix_test4 = polyval(p90_3_mix_test4,rango_p90_mix);

% %Representamos ajuste percentil 90 mixtura test cluster 4
% figure
% plot(percentil_90_test4,cargas_calib,'o')
% hold on
% plot(rango_p90_mix,y90_3_mix_test4,'g')
% title('Percentil 90 Mixtura Test Cluster 4')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura test porcentaje
p90_3_mix_test_prctg = polyfit(percentil_90_test_prctg,cargas_calib,3);
nmin = min(percentil_90_test_prctg);
nmax = max(percentil_90_test_prctg);
n_p90 = (nmax-nmin)/100;
rango_p90_mix = nmin:n_p90:nmax;
y90_3_mix_test_prctg = polyval(p90_3_mix_test_prctg,rango_p90_mix);

%Representamos ajuste percentil 90 mixtura test porcentaje
figure
plot(percentil_90_test_prctg,cargas_calib,'o')
hold on
plot(rango_p90_mix,y90_3_mix_test_prctg,'g')
title('Percentil 90 Mixtura Test')
ylim([0 100])
ylabel('Cargas medias CPU en %')
xlabel('Tiempos de SRT en \mus')
legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura test porcentaje cluster 1
p90_3_mix_test_prctg1 = polyfit(percentil_90_test_prctg1,cargas_calib,3);
nmin = min(percentil_90_test_prctg1);
nmax = max(percentil_90_test_prctg1);
n_p90 = (nmax-nmin)/100;
rango_p90_mix = nmin:n_p90:nmax;
y90_3_mix_test_prctg1 = polyval(p90_3_mix_test_prctg1,rango_p90_mix);

% %Representamos ajuste percentil 90 mixtura test porcentaje cluster 1
% figure
% plot(percentil_90_test_prctg1,cargas_calib,'o')
% hold on
% plot(rango_p90_mix,y90_3_mix_test_prctg1,'g')
% title('Percentil 90 Mixtura Test Cluster 1')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura test porcentaje cluster 2
p90_3_mix_test_prctg2 = polyfit(percentil_90_test_prctg2,cargas_calib,3);
nmin = min(percentil_90_test_prctg2);
nmax = max(percentil_90_test_prctg2);
n_p90 = (nmax-nmin)/100;
rango_p90_mix = nmin:n_p90:nmax;
y90_3_mix_test_prctg2 = polyval(p90_3_mix_test_prctg2,rango_p90_mix);

% %Representamos ajuste percentil 90 mixtura test porcentaje cluster 2
% figure
% plot(percentil_90_test_prctg2,cargas_calib,'o')
% hold on
% plot(rango_p90_mix,y90_3_mix_test_prctg2,'g')
% title('Percentil 90 Mixtura Test Cluster 2')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura test porcentaje cluster 3
p90_3_mix_test_prctg3 = polyfit(percentil_90_test_prctg3,cargas_calib,3);
nmin = min(percentil_90_test_prctg3);
nmax = max(percentil_90_test_prctg3);
n_p90 = (nmax-nmin)/100;
rango_p90_mix = nmin:n_p90:nmax;
y90_3_mix_test_prctg3 = polyval(p90_3_mix_test_prctg3,rango_p90_mix);

% %Representamos ajuste percentil 90 mixtura test porcentaje cluster 3
% figure
% plot(percentil_90_test_prctg3,cargas_calib,'o')
% hold on
% plot(rango_p90_mix,y90_3_mix_test_prctg3,'g')
% title('Percentil 90 Mixtura Test Cluster 3')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura test porcentaje cluster 4
p90_3_mix_test_prctg4 = polyfit(percentil_90_test_prctg4,cargas_calib,3);
nmin = min(percentil_90_test_prctg4);
nmax = max(percentil_90_test_prctg4);
n_p90 = (nmax-nmin)/100;
rango_p90_mix = nmin:n_p90:nmax;
y90_3_mix_test_prctg4 = polyval(p90_3_mix_test_prctg4,rango_p90_mix);

% %Representamos ajuste percentil 90 mixtura test porcentaje cluster 4
% figure
% plot(percentil_90_test_prctg4,cargas_calib,'o')
% hold on
% plot(rango_p90_mix,y90_3_mix_test_prctg4,'g')
% title('Percentil 90 Mixtura Test Cluster 4')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')
%%
%Percentil 95
%Percentil 95 datos originales
nmin=min(percentil_95_cpu);
nmax=max(percentil_95_cpu);
n_95=(nmax-nmin)/100;
rango_95=nmin:n_95:nmax;
%Regresión 3º orden
p95_3 = polyfit(percentil_95_cpu,cargas_calib,3);
y95_3=polyval(p95_3,media_cpu);
errorp95_orden3=immse(cargas_calib,y95_3);
y95_3=polyval(p95_3,rango_95);

figure
plot(percentil_95_cpu,cargas_calib,'o')
hold on
plot(rango_95, y95_3)
title('Percentil 95 Originales')
ylim([0 100])
ylabel('Cargas medias CPU en %')
xlabel('Tiempos de SRT en \mus')
legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura óptima 
p95_3_mix_opt = polyfit(percentil_95_opt,cargas_calib,3);
nmin = min(percentil_95_opt);
nmax = max(percentil_95_opt);
n_p95 = (nmax-nmin)/100;
rango_p95_mix = nmin:n_p95:nmax;
y95_3_mix_opt = polyval(p95_3_mix_opt,rango_p95_mix);

%Representamos ajuste media mixtura óptima
figure
plot(percentil_95_opt,cargas_calib,'o')
hold on
plot(rango_p95_mix,y95_3_mix_opt,'g')
title('Percentil 95 Mixtura Óptima')
ylim([0 100])
ylabel('Cargas medias CPU en %')
xlabel('Tiempos de SRT en \mus')
legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura óptima con porcentajes
p95_3_mix_opt_prctg = polyfit(percentil_95_opt_prctg,cargas_calib,3);
nmin = min(percentil_95_opt_prctg);
nmax = max(percentil_95_opt_prctg);
n_p95 = (nmax-nmin)/100;
rango_p95_mix = nmin:n_p95:nmax;
y95_3_mix_opt_prctg = polyval(p95_3_mix_opt_prctg,rango_p95_mix);
y95_error_opt_prctg=polyval(p95_3_mix_opt_prctg,percentil_95_opt_prctg);
%MAPE
mape_95_calib_opt_prctg = mape(cargas_calib,y95_error_opt_prctg);
%Representamos ajuste percentil 95 mixtura óptima con porcentajes
figure
plot(percentil_95_opt_prctg,cargas_calib,'o')
hold on
plot(rango_p95_mix,y95_3_mix_opt_prctg,'g')
title('Percentil 95 Mixtura Óptima con porcentajes')
ylim([0 100])
ylabel('Cargas medias CPU en %')
xlabel('Tiempos de SRT en \mus')
legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura test
p95_3_mix_test = polyfit(percentil_95_test,cargas_calib,3);
nmin = min(percentil_95_test);
nmax = max(percentil_95_test);
n_p95 = (nmax-nmin)/100;
rango_p95_mix = nmin:n_p95:nmax;
y95_3_mix_test = polyval(p95_3_mix_test,rango_p95_mix);

%Representamos ajuste percentil 95 mixtura test
figure
plot(percentil_95_test,cargas_calib,'o')
hold on
plot(rango_p95_mix,y95_3_mix_test,'g')
title('Percentil 95 Mixtura Test')
ylim([0 100])
ylabel('Cargas medias CPU en %')
xlabel('Tiempos de SRT en \mus')
legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura test con porcentajes
p95_3_mix_test_prctg = polyfit(percentil_95_test_prctg,cargas_calib,3);
nmin = min(percentil_95_test_prctg);
nmax = max(percentil_95_test_prctg);
n_p95 = (nmax-nmin)/100;
rango_p95_mix = nmin:n_p95:nmax;
y95_3_mix_test_prctg = polyval(p95_3_mix_test_prctg,rango_p95_mix);

%Representamos ajuste percentil 95 mixtura test con porcentajes
figure
plot(percentil_95_test_prctg,cargas_calib,'o')
hold on
plot(rango_p95_mix,y95_3_mix_test_prctg,'g')
title('Percentil 95 Mixtura Test con porcentajes')
ylim([0 100])
ylabel('Cargas medias CPU en %')
xlabel('Tiempos de SRT en \mus')
legend('Valores reales','Orden 3')
%%
%Percentil 99
nmin=min(percentil_99_cpu);
nmax=max(percentil_99_cpu);
n_p99=(nmax-nmin)/100;
rango_p99=nmin:n_p99:nmax;
%Regresión 3º orden datos originales
p99_3 = polyfit(percentil_99_cpu,cargas_calib,3);
y99_3=polyval(p99_3,percentil_99_cpu);
error99_orden3=immse(cargas_calib,y99_3);
y99_3=polyval(p99_3,rango_p99);

figure
plot(percentil_99_cpu,cargas_calib,'o')
hold on
plot(rango_p99, y99_3)
title('Percentil 99 Originales')
ylim([0 100])
ylabel('Cargas medias CPU en %')
xlabel('Tiempos de SRT en \mus')
legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura óptima 
p99_3_mix_opt = polyfit(percentil_99_opt,cargas_calib,3);
nmin = min(percentil_99_opt);
nmax = max(percentil_99_opt);
n_p99 = (nmax-nmin)/100;
rango_p99_mix = nmin:n_p99:nmax;
y99_3_mix_opt = polyval(p99_3_mix_opt,rango_p99_mix);

%Representamos ajuste percentil 99 mixtura óptima
figure
plot(percentil_99_opt,cargas_calib,'o')
hold on
plot(rango_p99_mix,y99_3_mix_opt,'g')
title('Percentil 99 Mixtura Óptima')
ylim([0 100])
ylabel('Cargas medias CPU en %')
xlabel('Tiempos de SRT en \mus')
legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura óptima con porcentajes
p99_3_mix_opt_prctg = polyfit(percentil_99_opt_prctg,cargas_calib,3);
nmin = min(percentil_99_opt_prctg);
nmax = max(percentil_99_opt_prctg);
n_p99 = (nmax-nmin)/100;
rango_p99_mix = nmin:n_p99:nmax;
y99_3_mix_opt_prctg = polyval(p99_3_mix_opt_prctg,rango_p99_mix);
y99_error_opt_prctg=polyval(p99_3_mix_opt_prctg,percentil_99_opt_prctg);
%MAPE
mape_99_calib_opt_prctg = mape(cargas_calib,y99_error_opt_prctg);
%Representamos ajuste percentil 99 mixtura óptima con porcentajes
figure
plot(percentil_99_opt_prctg,cargas_calib,'o')
hold on
plot(rango_p99_mix,y99_3_mix_opt_prctg,'g')
title('Percentil 99 Mixtura Óptima con portcentajes')
ylim([0 100])
ylabel('Cargas medias CPU en %')
xlabel('Tiempos de SRT en \mus')
legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura test
p99_3_mix_test = polyfit(percentil_99_test,cargas_calib,3);
nmin = min(percentil_99_test);
nmax = max(percentil_99_test);
n_p99 = (nmax-nmin)/100;
rango_p99_mix = nmin:n_p99:nmax;
y99_3_mix_test = polyval(p99_3_mix_test,rango_p99_mix);

%Representamos ajuste percentil 95 mixtura test
figure
plot(percentil_99_test,cargas_calib,'o')
hold on
plot(rango_p99_mix,y99_3_mix_test,'g')
title('Percentil 99 Mixtura Test')
ylim([0 100])
ylabel('Cargas medias CPU en %')
xlabel('Tiempos de SRT en \mus')
legend('Valores reales','Orden 3')

%Regresión 3º orden mixtura test con porcentajes
p99_3_mix_test_prctg = polyfit(percentil_99_test_prctg,cargas_calib,3);
nmin = min(percentil_99_test_prctg);
nmax = max(percentil_99_test_prctg);
n_p99 = (nmax-nmin)/100;
rango_p99_mix = nmin:n_p99:nmax;
y99_3_mix_test_prctg = polyval(p99_3_mix_test_prctg,rango_p99_mix);

%Representamos ajuste percentil 99 mixtura test con porcentajes
figure
plot(percentil_99_test_prctg,cargas_calib,'o')
hold on
plot(rango_p99_mix,y99_3_mix_test_prctg,'g')
title('Percentil 99 Mixtura Test con porcentajes')
ylim([0 100])
ylabel('Cargas medias CPU en %')
xlabel('Tiempos de SRT en \mus')
legend('Valores reales','Orden 3')
% %
% Regresiones para el percentil 99
% Regresión lineal
% p99_1 = polyfit(percentil_99_cpu,cargas_calib,1); 
% y99_1=polyval(p99_1,percentil_99_cpu);
% error99_orden1=immse(cargas_calib,y99_1);
% Regresión 2º orden
% p99_2 = polyfit(percentil_99_cpu,cargas_calib,2); 
% y99_2=polyval(p99_2,percentil_99_cpu);
% error99_orden2=immse(cargas_calib,y99_2);
% Regresión 3º orden
% p99_3 = polyfit(percentil_99_cpu,cargas_calib,3);
% y99_3=polyval(p99_3,percentil_99_cpu);
% error99_orden3=immse(cargas_calib,y99_3);
% nmin=min(percentil_99_cpu);
% nmax=max(percentil_99_cpu);
% n_p99=(nmax-nmin)/100;
% rango_p99=nmin:n_p99:nmax;
% y99_3=polyval(p99_3,rango_p99);
% Regresión lograrítimica
% beta99 = nlinfit(percentil_99_cpu,cargas_calib,modelfun,beta0);
% flog99=beta99(1).*log(percentil_99_cpu)+beta99(2);
% error99_log=immse(cargas_calib,flog99);
% 
% Regresión 3º orden mixtura
% p99_3_mix = polyfit(percentil_99_mixtura,cargas_calib,3); 
% nmin=min(percentil_99_mixtura);
% nmax=max(percentil_99_mixtura);
% n_p99=(nmax-nmin)/100;
% rango_p99_mix=nmin:n_p99:nmax;
% y99_3_mix=polyval(p99_3_mix,rango_p99_mix);
% 
% Representamos ajuste media mixtura
% figure
% plot(percentil_99_mixtura,cargas_calib,'o')
% hold on
% plot(rango_p99_mix,y99_3_mix,'g')
% title('Percentil 99 Mixtura Principal')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')
% 
% figure
% plot(percentil_99_cpu,cargas_calib,'o')
% hold on
% plot(percentil_99_cpu,y99_1,'k')
% hold on
% plot(percentil_99_cpu,y99_2,'b')
% hold on
% plot(rango_p99,y99_3,'g')
% hold on
% plot(rango_p99_mix,y99_3_mix_opt_prctg,'r')
% plot(percentil_99_cpu,modelfun(beta99,percentil_99_cpu),'r')
% title('Percentil 99')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')
% legend('Valores reales','Lineal','Orden 2','Orden 3','Logarítmica')
% %
% Regresiones para el percentil 95
% Regresión lineal
% p95_1 = polyfit(percentil_95_cpu,cargas_calib,1); 
% y95_1=polyval(p95_1,percentil_95_cpu);
% error95_orden1=immse(cargas_calib,y95_1);
% Regresión 2º orden
% p95_2 = polyfit(percentil_95_cpu,cargas_calib,2); 
% y95_2=polyval(p95_2,percentil_95_cpu);
% error95_orden2=immse(cargas_calib,y95_2);
% Regresión 3º orden
% p95_3 = polyfit(percentil_95_cpu,cargas_calib,3);
% y95_3=polyval(p95_3,percentil_95_cpu);
% error95_orden3=immse(cargas_calib,y95_3);
% nmin=min(percentil_95_cpu);
% nmax=max(percentil_95_cpu);
% n_p95=(nmax-nmin)/100;
% rango_p95=nmin:n_p95:nmax;
% y95_3=polyval(p95_3,rango_p95);
% Regresión lograrítimica
% beta95 = nlinfit(percentil_95_cpu,cargas_calib,modelfun,beta0);
% flog95=beta95(1).*log(percentil_95_cpu)+beta95(2);
% error95_log=immse(cargas_calib,flog95);
% 
% Regresión 3º orden mixtura
% p95_3_mix = polyfit(percentil_95_mixtura,cargas_calib,3); 
% nmin=min(percentil_95_mixtura);
% nmax=max(percentil_95_mixtura);
% n_p95=(nmax-nmin)/100;
% rango_p95_mix=nmin:n_p95:nmax;
% y95_3_mix=polyval(p95_3_mix,rango_p95_mix);
% 
% Representamos ajuste media mixtura
% figure
% plot(percentil_95_mixtura,cargas_calib,'o')
% hold on
% plot(rango_p95_mix,y95_3_mix,'g')
% title('Percentil 95 Mixtura Principal')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')
% 
% figure
% plot(percentil_95_cpu,cargas_calib,'o')
% hold on
% plot(percentil_95_cpu,y95_1,'k')
% hold on
% plot(percentil_95_cpu,y95_2,'b')
% hold on
% plot(rango_p95,y95_3,'g')
% hold on
% plot(percentil_95_cpu,modelfun(beta95,percentil_95_cpu),'r')
% title('Percentil 95')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')
% legend('Valores reales','Lineal','Orden 2','Orden 3','Logarítmica')
% %
% Regresiones para el percentil 50
% Regresión lineal
% p50_1 = polyfit(percentil_50_cpu,cargas_calib,1); 
% y50_1=polyval(p50_1,percentil_50_cpu);
% error50_orden1=immse(cargas_calib,y50_1);
% Regresión 2º orden
% p50_2 = polyfit(percentil_50_cpu,cargas_calib,2); 
% y50_2=polyval(p50_2,percentil_50_cpu);
% error50_orden2=immse(cargas_calib,y50_2);
% Regresión 3º orden
% p50_3 = polyfit(percentil_50_cpu,cargas_calib,3);
% y50_3=polyval(p50_3,percentil_50_cpu);
% error50_orden3=immse(cargas_calib,y50_3);
% nmin=min(percentil_50_cpu);
% nmax=max(percentil_50_cpu);
% n_p50=(nmax-nmin)/100;
% rango_p50=nmin:n_p50:nmax;
% y50_3=polyval(p50_3,rango_p50);
% Regresión lograrítimica
% beta50 = nlinfit(percentil_50_cpu,cargas_calib,modelfun,beta0);
% flog50=beta50(1).*log(percentil_50_cpu)+beta50(2);
% error50_log=immse(cargas_calib,flog50);
% 
% Regresión 3º orden mixtura
% p50_3_mix = polyfit(percentil_50_mixtura,cargas_calib,3); 
% nmin=min(percentil_50_mixtura);
% nmax=max(percentil_50_mixtura);
% n_p50=(nmax-nmin)/100;
% rango_p50_mix=nmin:n_p50:nmax;
% y50_3_mix=polyval(p50_3_mix,rango_p50_mix);
% 
% Representamos ajuste media mixtura
% figure
% plot(percentil_50_mixtura,cargas_calib,'o')
% hold on
% plot(rango_p50_mix,y50_3_mix,'g')
% title('Percentil 50 Mixtura Principal')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')
% 
% figure
% plot(percentil_50_cpu,cargas_calib,'o')
% hold on
% plot(percentil_50_cpu,y50_1,'k')
% hold on
% plot(percentil_50_cpu,y50_2,'b')
% hold on
% plot(rango_p50,y50_3,'g')
% hold on
% plot(percentil_50_cpu,modelfun(beta50,percentil_50_cpu),'r')
% title('Percentil 50')
% ylim([0 100])
% ylabel('Cargas medias CPU en %')
% xlabel('Tiempos de SRT en \mus')
% legend('Valores reales','Orden 3')
% legend('Valores reales','Lineal','Orden 2','Orden 3','Logarítmica')

%%
%Errores de las mixturas

%Media óptima
media_mix_opt_err = polyval(pmedia_3_mix_opt,media_opt);
error_media_mix_opt = max(abs(cargas_calib-media_mix_opt_err));
%Media óptima con porcentajes
media_mix_opt_prctg_err = polyval(pmedia_3_mix_opt_prctg,media_opt_prctg);
error_media_mix_opt_prctg = max(abs(cargas_calib-media_mix_opt_prctg_err));
%Media test
media_mix_test_err = polyval(pmedia_3_mix_test,media_test);
error_media_mix_test = max(abs(cargas_calib-media_mix_test_err));
%Media test con porcentajes
media_mix_test_prctg_err = polyval(pmedia_3_mix_test_prctg,media_test_prctg);
error_media_mix_test_prctg = max(abs(cargas_calib-media_mix_test_prctg_err));

%Percentil 90 óptima
p90_opt_err = polyval(p90_3_mix_opt, percentil_90_opt);
error_p90_opt = max(abs(cargas_calib-p90_opt_err));
%Percentil 90 óptima con porcentajes
p90_opt_prctg_err = polyval(p90_3_mix_opt_prctg, percentil_90_opt_prctg);
error_p90_opt_prctg = max(abs(cargas_calib-p90_opt_prctg_err));
%Percentil 90 test
p90_test_err = polyval(p90_3_mix_test, percentil_90_test);
error_p90_test = max(abs(cargas_calib-p90_test_err));
%Percentil 90 test con porcentajes
p90_test_prctg_err = polyval(p90_3_mix_test_prctg, percentil_90_test_prctg);
error_p90_test_prctg = max(abs(cargas_calib-p90_test_prctg_err));

%Percentil 95 óptima
p95_opt_err = polyval(p95_3_mix_opt, percentil_95_opt);
error_p95_opt = max(abs(cargas_calib-p95_opt_err));
%Percentil 95 óptima con porcentajes
p95_opt_prctg_err = polyval(p95_3_mix_opt_prctg, percentil_95_opt_prctg);
error_p95_opt_prctg = max(abs(cargas_calib-p95_opt_prctg_err));
%Percentil 95 test
p95_test_err = polyval(p95_3_mix_test, percentil_95_test);
error_p95_test = max(abs(cargas_calib-p95_test_err));
%Percentil 95 test con porcentajes
p95_test_prctg_err = polyval(p95_3_mix_test_prctg, percentil_95_test_prctg);
error_p95_test_prctg = max(abs(cargas_calib-p95_test_prctg_err));

%Percentil 99 óptima
p99_opt_err = polyval(p99_3_mix_opt, percentil_99_opt);
error_p99_opt = max(abs(cargas_calib-p99_opt_err));
%Percentil 99 óptima con porcentajes
p99_opt_prctg_err = polyval(p99_3_mix_opt_prctg, percentil_99_opt_prctg);
error_p99_opt_prctg = max(abs(cargas_calib-p99_opt_prctg_err));
%Percentil 99 test
p99_test_err = polyval(p99_3_mix_test, percentil_99_test);
error_p99_test = max(abs(cargas_calib-p99_test_err));
%Percentil 99 test con porcentajes
p99_test_prctg_err = polyval(p99_3_mix_test_prctg, percentil_99_test_prctg);
error_p99_test_prctg = max(abs(cargas_calib-p99_test_prctg_err));

%%
%%%%%%%%%Predicciones para test de 1 minuto por medida%%%%%%%%%%%%%%
%Variables
media_test1m=zeros(1,21);
percentil_99_test1m=zeros(1,21);
percentil_95_test1m=zeros(1,21);
percentil_90_test1m=zeros(1,21);
media_test1m_mix=zeros(1,21);
percentil_99_test1m_mix=zeros(1,21);
percentil_95_test1m_mix=zeros(1,21);
percentil_90_test1m_mix=zeros(1,21);
media_test1m_p=zeros(1,21);
percentil_99_test1m_p=zeros(1,21);
percentil_95_test1m_p=zeros(1,21);
percentil_90_test1m_p=zeros(1,21);
media_test1m_n=zeros(1,21);
percentil_99_test1m_n=zeros(1,21);
percentil_95_test1m_n=zeros(1,21);
percentil_90_test1m_n=zeros(1,21);

pred_media1m=zeros(1,21);
pred_media1m_mix_opt=zeros(1,21);
pred_media1m_p=zeros(1,21);
pred_media1m_n=zeros(1,21);
pred_991m=zeros(1,21);
pred_991m_mix_opt=zeros(1,21);
pred_991m_p=zeros(1,21);
pred_991m_n=zeros(1,21);
pred_951m=zeros(1,21);
pred_951m_mix_opt=zeros(1,21);
pred_951m_p=zeros(1,21);
pred_951m_n=zeros(1,21);
pred_901m=zeros(1,21);
pred_901m_mix_opt=zeros(1,21);
pred_901m_p=zeros(1,21);
pred_901m_n=zeros(1,21);

carga_real1m=[carga_test1m{2,:}];

for n_test=1:length(srt_test1m)
    
    percentil_50_test1m(n_test) = prctile(srt_test1m{2,n_test},50);
    percentil_90_test1m(n_test) = prctile(srt_test1m{2,n_test},90);
    percentil_95_test1m(n_test) = prctile(srt_test1m{2,n_test},95);
    percentil_99_test1m(n_test) = prctile(srt_test1m{2,n_test},99);
    media_test1m(n_test) = mean(srt_test1m{2,n_test});
    
    percentil_95_test1m_p(n_test)=percentil_95_test1m(n_test)+0.5;
    percentil_99_test1m_p(n_test)=percentil_99_test1m(n_test)+0.5;
    percentil_90_test1m_p(n_test)=percentil_90_test1m(n_test)+0.5;
    media_test1m_p(n_test)=media_test1m(n_test)+0.5;
    
    percentil_95_test1m_n(n_test)=percentil_95_test1m(n_test)-0.5;
    percentil_99_test1m_n(n_test)=percentil_99_test1m(n_test)-0.5;
    percentil_90_test1m_n(n_test)=percentil_90_test1m(n_test)-0.5;
    media_test1m_n(n_test)=media_test1m(n_test)-0.5;
    
    %Prediccion media
    pred_media1m(n_test)= polyval(pmedia_3,media_test1m(n_test));
    pred_media1m_p(n_test)= polyval(pmedia_3,media_test1m_p(n_test));
    pred_media1m_n(n_test)= polyval(pmedia_3,media_test1m_n(n_test));
    %Prediccion carga percentil 50 
    pred_501m(n_test)= polyval(p50_3,percentil_50_test1m(n_test));
    %Prediccion carga percentil 99
    pred_991m(n_test)= polyval(p99_3,percentil_99_test1m(n_test));
    pred_991m_p(n_test)= polyval(p99_3,percentil_99_test1m_p(n_test));
    pred_991m_n(n_test)= polyval(p99_3,percentil_99_test1m_n(n_test));
    %Prediccion carga percentil 95
    pred_951m(n_test)= polyval(p95_3,percentil_95_test1m(n_test));
    pred_951m_p(n_test)= polyval(p95_3,percentil_95_test1m_p(n_test));
    pred_951m_n(n_test)= polyval(p95_3,percentil_95_test1m_n(n_test));
    %Prediccion carga percentil 90
    pred_901m(n_test)= polyval(p90_3,percentil_90_test1m(n_test));
    pred_901m_p(n_test)= polyval(p90_3,percentil_90_test1m_p(n_test));
    pred_901m_n(n_test)= polyval(p90_3,percentil_90_test1m_n(n_test));
    
end

%Obtenemos las mixturas principales del test de 1 minuto
for n_test=1:length(srt_test1m)
    
%     [mixtura_principal,nbins]=dist_min(n_mix,srt_test1m{2,n_test});
    
%     percentil_95_test1m_mix(n_test) = prctile(mixtura_principal,95);
%     percentil_99_test1m_mix(n_test) = prctile(mixtura_principal,99);
%     percentil_50_test1m_mix(n_test) = prctile(mixtura_principal,50);
%     media_test1m_mix(n_test) = mean(mixtura_principal);
    
    f1=figure;
    h=histogram(srt_test1m{2,n_test}, 'Normalization', 'cdf');
    cdf_srt1m = h.Values;
    cdf_srt1m(end+1)=1;
    range_cdf_srt1m = h.BinEdges;
    close(f1)
    
    %Find value when cdf is 0.999
    cdf_value=0.999;
    [val_cdf,idx_cdf]=min(abs(cdf_srt1m-cdf_value));
    interval_cdf=range_cdf_srt1m(idx_cdf);
    
%     [centros_opt1m{n_test}, umbrales1m{n_test}] = get_centers(srt_test1m{2,n_test},interval_cdf);
    
    [pdf_combi_opt1m{n_test},range_pdf_opt1m{n_test},cdf_opt1m_1{n_test},cdf_opt1m_2{n_test},cdf_opt1m_3{n_test},cdf_opt1m_4{n_test},cdf_combi_opt1m{n_test},range_cdf_opt1m{n_test},idx_opt1m{n_test},media_opt1m_1(n_test),media_opt1m_2(n_test),media_opt1m_3(n_test),media_opt1m_4(n_test),media_opt1m(n_test)] = dist_opt(0,srt_test1m{2,n_test},centros_opt{n_test},0);
    [srt_value_prctg1m{n_test}] = values_prctgs(srt_test1m{2,n_test}, idx_opt1m{n_test});
    [idx_opt_prctg1m{n_test},pdf_combi_prctg1m{n_test},range_pdf_prctg1m{n_test},cdf_combi_prctg1m_1{n_test},cdf_combi_prctg1m_2{n_test},cdf_combi_prctg1m_3{n_test},cdf_combi_prctg1m_4{n_test},cdf_combi_prctg1m{n_test},range_cdf_prctg1m{n_test},media_opt_prctg1m_1(n_test),media_opt_prctg1m_2(n_test),media_opt_prctg1m_3(n_test),media_opt_prctg1m_4(n_test),media_opt_prctg1m(n_test)] = dist_prctgs(srt_test1m{2,n_test},srt_value_prctg1m{n_test},idx_opt1m{n_test});
    %Iteración extra
    [pdf_combi_opt1m{n_test},range_pdf_opt1m{n_test},cdf_opt1m_1{n_test},cdf_opt1m_2{n_test},cdf_opt1m_3{n_test},cdf_opt1m_4{n_test},cdf_combi_opt1m{n_test},range_cdf_opt1m{n_test},idx_opt1m{n_test},media_opt1m_1(n_test),media_opt1m_2(n_test),media_opt1m_3(n_test),media_opt1m_4(n_test),media_opt1m(n_test)] = dist_opt(1,srt_test1m{2,n_test},centros_opt{n_test},idx_opt_prctg1m{n_test});
    [srt_value_prctg1m{n_test}] = values_prctgs(srt_test1m{2,n_test}, idx_opt1m{n_test});
    [idx_opt_prctg1m{n_test},pdf_combi_prctg1m{n_test},range_pdf_prctg1m{n_test},cdf_combi_prctg1m_1{n_test},cdf_combi_prctg1m_2{n_test},cdf_combi_prctg1m_3{n_test},cdf_combi_prctg1m_4{n_test},cdf_combi_prctg1m{n_test},range_cdf_prctg1m{n_test},media_opt_prctg1m_1(n_test),media_opt_prctg1m_2(n_test),media_opt_prctg1m_3(n_test),media_opt_prctg1m_4(n_test),media_opt_prctg1m(n_test)] = dist_prctgs(srt_test1m{2,n_test},srt_value_prctg1m{n_test},idx_opt1m{n_test});

    %Percentil 50 de la distribucion óptima
    [~, closest_cdf_opt] = min(abs(cdf_combi_opt1m{n_test}-0.50));
    percentil_50_opt1m(n_test) = range_cdf_opt1m{n_test}(closest_cdf_opt);
    
    %Percentil 90 de la distribucion óptima
    [~, closest_cdf_opt] = min(abs(cdf_combi_opt1m{n_test}-0.90));
    percentil_90_opt1m(n_test) = range_cdf_opt1m{n_test}(closest_cdf_opt);
    
    %Percentil 95 de la distribucion óptima
    [~, closest_cdf_opt] = min(abs(cdf_combi_opt1m{n_test}-0.95));
    percentil_95_opt1m(n_test) = range_cdf_opt1m{n_test}(closest_cdf_opt);
    
    %Percentil 99 de la distribucion óptima
    [~, closest_cdf_opt] = min(abs(cdf_combi_opt1m{n_test}-0.99));
    percentil_99_opt1m(n_test) = range_cdf_opt1m{n_test}(closest_cdf_opt);
    
    %Predicciones para la mixtura óptima
    pred_media1m_mix_opt(n_test)= polyval(pmedia_3_mix_opt,media_opt1m(n_test));
    %Prediccion carga percentil 50 mixtura óptima
    pred_501m_mix_opt(n_test)= polyval(p50_3_mix_opt,percentil_50_opt1m(n_test));
    %Prediccion carga percentil 90 mixtura óptima
    pred_901m_mix_opt(n_test)= polyval(p90_3_mix_opt,percentil_90_opt1m(n_test));
    %Prediccion carga percentil 95 mixtura óptima
    pred_951m_mix_opt(n_test)= polyval(p95_3_mix_opt,percentil_95_opt1m(n_test));
    %Prediccion carga percentil 99 mixtura óptima
    pred_991m_mix_opt(n_test)= polyval(p99_3_mix_opt,percentil_99_opt1m(n_test));

    %Percentil 50 de la distribucion óptima con porcentajes
    [~, closest_cdf_opt_prctg] = min(abs(cdf_combi_prctg1m{n_test}-0.50));
    percentil_50_opt_prctg1m(n_test) = range_cdf_prctg1m{n_test}(closest_cdf_opt_prctg);
    
    %Percentil 90 de la distribucion óptima con porcentajes
    [~, closest_cdf_opt_prctg] = min(abs(cdf_combi_prctg1m{n_test}-0.90));
    percentil_90_opt_prctg1m(n_test) = range_cdf_prctg1m{n_test}(closest_cdf_opt_prctg);
    
    %Percentil 95 de la distribucion óptima con porcentajes
    [~, closest_cdf_opt_prctg] = min(abs(cdf_combi_prctg1m{n_test}-0.95));
    percentil_95_opt_prctg1m(n_test) = range_cdf_prctg1m{n_test}(closest_cdf_opt_prctg);
    
    %Percentil 99 de la distribucion óptima con porcentajes
    [~, closest_cdf_opt_prctg] = min(abs(cdf_combi_prctg1m{n_test}-0.99));
    percentil_99_opt_prctg1m(n_test) = range_cdf_prctg1m{n_test}(closest_cdf_opt_prctg);
    
    %Predicciones para la mixtura óptima con porcentajes
    pred_media1m_mix_opt_prctg(n_test)= polyval(pmedia_3_mix_opt_prctg,media_opt_prctg1m(n_test));
    %Prediccion carga percentil 50 mixtura óptima con porcentajes
    pred_501m_mix_opt_prctg(n_test)= polyval(p50_3_mix_opt_prctg,percentil_50_opt_prctg1m(n_test));
    %Prediccion carga percentil 90 mixtura óptima con porcentajes
    pred_901m_mix_opt_prctg(n_test)= polyval(p90_3_mix_opt_prctg,percentil_90_opt_prctg1m(n_test));
    %Prediccion carga percentil 95 mixtura óptima con porcentajes
    pred_951m_mix_opt_prctg(n_test)= polyval(p95_3_mix_opt_prctg,percentil_95_opt_prctg1m(n_test));
    %Prediccion carga percentil 99 mixtura óptima con porcentajes
    pred_991m_mix_opt_prctg(n_test)= polyval(p99_3_mix_opt_prctg,percentil_99_opt_prctg1m(n_test));
    
end

%Dibujamos las predicciones con intervalos de error frente a la carga real
%Para 1 minuto
neg_media1m=pred_media1m-pred_media1m_n;
pos_media1m=pred_media1m_p-pred_media1m;
neg_901m=pred_901m-pred_901m_n;
pos_901m=pred_901m_p-pred_901m;
neg_951m=pred_951m-pred_951m_n;
pos_951m=pred_951m_p-pred_951m;
neg_991m=pred_991m-pred_991m_n;
pos_991m=pred_991m_p-pred_991m;

%%%%%%%%%%%Calibración datos originales%%%%%%%%%%%%
nmin=min(media_test1m);
nmax=max(media_test1m);
n_media=(nmax-nmin)/100;
rango_media1m=nmin:n_media:nmax;
ymedia_3_1m=polyval(pmedia_3,rango_media1m);
ymedia_3p_1m=polyval(pmedia_3,rango_media1m+0.5);
ymedia_3n_1m=polyval(pmedia_3,rango_media1m-0.5);

nmin=min(percentil_90_test1m);
nmax=max(percentil_90_test1m);
n_p90=(nmax-nmin)/100;
rango_p901m=nmin:n_p90:nmax;
y90_3_1m=polyval(p90_3,rango_p901m);
y90_3p_1m=polyval(p90_3,rango_p901m+0.5);
y90_3n_1m=polyval(p90_3,rango_p901m-0.5);

nmin=min(percentil_95_test1m);
nmax=max(percentil_95_test1m);
n_p95=(nmax-nmin)/100;
rango_p951m=nmin:n_p95:nmax;
y95_3_1m=polyval(p95_3,rango_p951m);
y95_3p_1m=polyval(p95_3,rango_p951m+0.5);
y95_3n_1m=polyval(p95_3,rango_p951m-0.5);

nmin=min(percentil_99_test1m);
nmax=max(percentil_99_test1m);
n_p99=(nmax-nmin)/100;
rango_p991m=nmin:n_p99:nmax;
y99_3_1m=polyval(p99_3,rango_p991m);
y99_3p_1m=polyval(p99_3,rango_p991m+0.5);
y99_3n_1m=polyval(p99_3,rango_p991m-0.5);

%%%%%%%%%%%%%%%%%%Calibración mixturas óptimas%%%%%%%%%%%%%%%
%Media
nmin=min(media_opt1m);
nmax=max(media_opt1m);
n_media_mix_opt=(nmax-nmin)/100;
rango_media_mix1m_opt=nmin:n_media_mix_opt:nmax;
ymedia_3_mix1m_opt=polyval(pmedia_3_mix_opt,rango_media_mix1m_opt);
ymedia_3_mix1m_opt_pos=polyval(pmedia_3_mix_opt,rango_media_mix1m_opt+0.5);
ymedia_3_mix1m_opt_neg=polyval(pmedia_3_mix_opt,rango_media_mix1m_opt-0.5);
%Percentil 90
nmin=min(percentil_90_opt1m);
nmax=max(percentil_90_opt1m);
n_p90_mix_opt=(nmax-nmin)/100;
rango_p90_mix1m_opt=nmin:n_p90_mix_opt:nmax;
y90_3_mix1m_opt=polyval(p90_3_mix_opt,rango_p90_mix1m_opt);
y90_3_mix1m_opt_pos=polyval(p90_3_mix_opt,rango_p90_mix1m_opt+0.5);
y90_3_mix1m_opt_neg=polyval(p90_3_mix_opt,rango_p90_mix1m_opt-0.5);
%Percentil 95
nmin=min(percentil_95_opt1m);
nmax=max(percentil_95_opt1m);
n_p95_mix_opt=(nmax-nmin)/100;
rango_p95_mix1m_opt=nmin:n_p95_mix_opt:nmax;
y95_3_mix1m_opt=polyval(p95_3_mix_opt,rango_p95_mix1m_opt);
y95_3_mix1m_opt_pos=polyval(p95_3_mix_opt,rango_p95_mix1m_opt+0.5);
y95_3_mix1m_opt_neg=polyval(p95_3_mix_opt,rango_p95_mix1m_opt-0.5);
%Percentil 99
nmin=min(percentil_99_opt1m);
nmax=max(percentil_99_opt1m);
n_p99_mix_opt=(nmax-nmin)/100;
rango_p99_mix1m_opt=nmin:n_p99_mix_opt:nmax;
y99_3_mix1m_opt=polyval(p99_3_mix_opt,rango_p99_mix1m_opt);
y99_3_mix1m_opt_pos=polyval(p99_3_mix_opt,rango_p99_mix1m_opt+0.5);
y99_3_mix1m_opt_neg=polyval(p99_3_mix_opt,rango_p99_mix1m_opt-0.5);

%%%%%%%%%%%%%%%%%%Calibración mixturas óptimas con porcentajes%%%%%%%%%%%%%%%
%Media
nmin=min(media_opt_prctg1m);
nmax=max(media_opt_prctg1m);
n_media_mix_opt_prctg=(nmax-nmin)/100;
rango_media_mix1m_opt_prctg=nmin:n_media_mix_opt_prctg:nmax;
ymedia_3_mix1m_opt_prctg=polyval(pmedia_3_mix_opt_prctg,rango_media_mix1m_opt_prctg);
ymedia_3_mix1m_opt_prctg_pos=polyval(pmedia_3_mix_opt_prctg,rango_media_mix1m_opt_prctg+0.5);
ymedia_3_mix1m_opt_prctg_neg=polyval(pmedia_3_mix_opt_prctg,rango_media_mix1m_opt_prctg-0.5);
%Percentil 90
nmin=min(percentil_90_opt_prctg1m);
nmax=max(percentil_90_opt_prctg1m);
n_p90_mix_opt_prctg=(nmax-nmin)/100;
rango_p90_mix1m_opt_prctg=nmin:n_p90_mix_opt_prctg:nmax;
y90_3_mix1m_opt_prctg=polyval(p90_3_mix_opt_prctg,rango_p90_mix1m_opt_prctg);
y90_3_mix1m_opt_prctg_pos=polyval(p90_3_mix_opt_prctg,rango_p90_mix1m_opt_prctg+0.5);
y90_3_mix1m_opt_prctg_neg=polyval(p90_3_mix_opt_prctg,rango_p90_mix1m_opt_prctg-0.5);
%Percentil 95
nmin=min(percentil_95_opt_prctg1m);
nmax=max(percentil_95_opt_prctg1m);
n_p95_mix_opt_prctg=(nmax-nmin)/100;
rango_p95_mix1m_opt_prctg=nmin:n_p95_mix_opt_prctg:nmax;
y95_3_mix1m_opt_prctg=polyval(p95_3_mix_opt_prctg,rango_p95_mix1m_opt_prctg);
y95_3_mix1m_opt_prctg_pos=polyval(p95_3_mix_opt_prctg,rango_p95_mix1m_opt_prctg+0.5);
y95_3_mix1m_opt_prctg_neg=polyval(p95_3_mix_opt_prctg,rango_p95_mix1m_opt_prctg-0.5);
%Percentil 99
nmin=min(percentil_99_opt_prctg1m);
nmax=max(percentil_99_opt_prctg1m);
n_p99_mix_opt_prctg=(nmax-nmin)/100;
rango_p99_mix1m_opt_prctg=nmin:n_p99_mix_opt_prctg:nmax;
y99_3_mix1m_opt_prctg=polyval(p99_3_mix_opt_prctg,rango_p99_mix1m_opt_prctg);
y99_3_mix1m_opt_prctg_pos=polyval(p99_3_mix_opt_prctg,rango_p99_mix1m_opt_prctg+0.5);
y99_3_mix1m_opt_prctg_neg=polyval(p99_3_mix_opt_prctg,rango_p99_mix1m_opt_prctg-0.5);
%%
%%%%%%%%%%Representación predicción original 1 minuto%%%%%%%%%%%%%%%%%%
figure
subplot(2,2,1)
%errorbar(media_test1m,pred_media1m,neg_media1m,pos_media1m,'o','MarkerSize',5,'MarkerEdgeColor','red','MarkerFaceColor','red')
hold on
plot(media_test1m, carga_real1m,'go','LineWidth',2)
hold on
%plot(media_test1m, pred_media1m, 'r')
hold on
plot(rango_media1m,ymedia_3_1m)
hold on
plot(rango_media1m,ymedia_3p_1m)
hold on
plot(rango_media1m,ymedia_3n_1m)
title('Media para 1 minuto')
xlabel('SRT en \mus')
ylabel('% de carga CPU')
legend('Real','Ajuste orden 3','Ajuste+0.5\mus','Ajuste-0.5\mus')
ylim([0 100])
subplot(2,2,2)
%errorbar(percentil_50_test1m,pred_501m,neg_501m,pos_501m,'o','MarkerSize',5,'MarkerEdgeColor','red','MarkerFaceColor','red')
hold on
plot(percentil_90_test1m, carga_real1m,'go','LineWidth',2)
hold on
%plot(percentil_50_test1m, pred_501m, 'r')
plot(rango_p901m,y90_3_1m)
hold on
plot(rango_p901m,y90_3p_1m)
hold on
plot(rango_p901m,y90_3n_1m)
title('Percentil 90 para 1 minuto')
xlabel('SRT en \mus')
ylabel('% de carga CPU')
legend('Real','Ajuste orden 3','Ajuste+0.5\mus','Ajuste-0.5\mus')
ylim([0 100])
subplot(2,2,3)
%errorbar(percentil_95_test1m,pred_951m,neg_951m,pos_951m,'o','MarkerSize',5,'MarkerEdgeColor','red','MarkerFaceColor','red')
hold on
plot(percentil_95_test1m, carga_real1m,'go','LineWidth',2)
hold on
%plot(percentil_95_test1m, pred_951m, 'r')
hold on
plot(rango_p951m,y95_3_1m)
hold on
plot(rango_p951m,y95_3p_1m)
hold on
plot(rango_p951m,y95_3n_1m)
title('Percentil 95 para 1 minuto')
xlabel('SRT en \mus')
ylabel('% de carga CPU')
legend('Real','Ajuste orden 3','Ajuste+0.5\mus','Ajuste-0.5\mus')
ylim([0 100])
subplot(2,2,4)
%errorbar(percentil_99_test1m,pred_991m,neg_991m,pos_991m,'o','MarkerSize',5,'MarkerEdgeColor','red','MarkerFaceColor','red')
hold on
plot(percentil_99_test1m, carga_real1m,'go','LineWidth',2)
hold on
%plot(percentil_99_test1m, pred_991m, 'r')
hold on
plot(rango_p991m,y99_3_1m)
hold on
plot(rango_p991m,y99_3p_1m)
hold on
plot(rango_p991m,y99_3n_1m)
title('Percentil 99 para 1 minuto')
xlabel('SRT en \mus')
ylabel('% de carga CPU')
legend('Real','Ajuste orden 3','Ajuste+0.5\mus','Ajuste-0.5\mus')
ylim([0 100])

figure
subplot(3,2,1)
scatter(pred_media1m, carga_real1m,'r','*')
hold on
refline(1,0)
title('Carga predicha vs real con Media Original para 1 minuto')
xlabel('% de carga CPU predicha')
ylabel('% de carga CPU real')
xlim([0 100])
ylim([0 100])
subplot(3,2,2)
scatter(pred_501m, carga_real1m,'r','*')
hold on
refline(1,0)
title('Carga predicha vs real con Percentil 50 Original para 1 minuto')
xlabel('% de carga CPU predicha')
ylabel('% de carga CPU real')
xlim([0 100])
ylim([0 100])
subplot(3,2,3)
scatter(pred_901m, carga_real1m,'r','*')
hold on
refline(1,0)
title('Carga predicha vs real con Percentil 90 Original para 1 minuto')
xlabel('% de carga CPU predicha')
ylabel('% de carga CPU real')
xlim([0 100])
ylim([0 100])
subplot(3,2,4)
scatter(pred_951m, carga_real1m,'r','*')
hold on
refline(1,0)
title('Carga predicha vs real con Percentil 95 Original para 1 minuto')
xlabel('% de carga CPU predicha')
ylabel('% de carga CPU real')
xlim([0 100])
ylim([0 100])
subplot(3,2,5)
scatter(pred_991m, carga_real1m,'r','*')
hold on
refline(1,0)
title('Carga predicha vs real con Percentil 99 Original para 1 minuto')
xlabel('% de carga CPU predicha')
ylabel('% de carga CPU real')
xlim([0 100])
ylim([0 100])
%%
%%%%%%%%%%%%%%%Representación predicción mixtura óptima 1 minuto%%%%%%%%%%%%%%%%%%%
figure
subplot(2,2,1)
plot(media_opt1m, carga_real1m,'go','LineWidth',2)
hold on
plot(rango_media_mix1m_opt,ymedia_3_mix1m_opt)
hold on
plot(rango_media_mix1m_opt,ymedia_3_mix1m_opt_pos)
hold on
plot(rango_media_mix1m_opt,ymedia_3_mix1m_opt_neg)
title('Media mixtura óptima para 1 minuto')
xlabel('SRT en \mus')
ylabel('% de carga CPU')
legend('Real','Ajuste orden 3','Ajuste+0.5\mus','Ajuste-0.5\mus')
ylim([0 100])

subplot(2,2,2)
plot(percentil_90_opt1m, carga_real1m,'go','LineWidth',2)
hold on
plot(rango_p90_mix1m_opt,y90_3_mix1m_opt)
hold on
plot(rango_p90_mix1m_opt,y90_3_mix1m_opt_pos)
hold on
plot(rango_p90_mix1m_opt,y90_3_mix1m_opt_neg)
title('Percentil 90 mixtura óptima para 1 minuto')
xlabel('SRT en \mus')
ylabel('% de carga CPU')
legend('Real','Ajuste orden 3','Ajuste+0.5\mus','Ajuste-0.5\mus')
ylim([0 100])

subplot(2,2,3)
plot(percentil_95_opt1m, carga_real1m,'go','LineWidth',2)
hold on
plot(rango_p95_mix1m_opt,y95_3_mix1m_opt)
hold on
plot(rango_p95_mix1m_opt,y95_3_mix1m_opt_pos)
hold on
plot(rango_p95_mix1m_opt,y95_3_mix1m_opt_neg)
title('Percentil 95 mixtura óptima para 1 minuto')
xlabel('SRT en \mus')
ylabel('% de carga CPU')
legend('Real','Ajuste orden 3','Ajuste+0.5\mus','Ajuste-0.5\mus')
ylim([0 100])

subplot(2,2,4)
plot(percentil_99_opt1m, carga_real1m,'go','LineWidth',2)
hold on
plot(rango_p99_mix1m_opt,y99_3_mix1m_opt)
hold on
plot(rango_p99_mix1m_opt,y99_3_mix1m_opt_pos)
hold on
plot(rango_p99_mix1m_opt,y99_3_mix1m_opt_neg)
title('Percentil 99 mixtura óptima para 1 minuto')
xlabel('SRT en \mus')
ylabel('% de carga CPU')
legend('Real','Ajuste orden 3','Ajuste+0.5\mus','Ajuste-0.5\mus')
ylim([0 100])

figure
subplot(3,2,1)
scatter(pred_media1m_mix_opt, carga_real1m,'r','*')
hold on
refline(1,0)
title('Carga predicha vs real con Media mixtura óptima para 1 minuto')
xlabel('% de carga CPU predicha')
ylabel('% de carga CPU real')
xlim([0 100])
ylim([0 100])
subplot(3,2,2)
scatter(pred_501m_mix_opt, carga_real1m,'r','*')
hold on
refline(1,0)
title('Carga predicha vs real con Percentil 50 mixtura óptima para 1 minuto')
xlabel('% de carga CPU predicha')
ylabel('% de carga CPU real')
xlim([0 100])
ylim([0 100])
subplot(3,2,3)
scatter(pred_901m_mix_opt, carga_real1m,'r','*')
hold on
refline(1,0)
title('Carga predicha vs real con Percentil 90 mixtura óptima para 1 minuto')
xlabel('% de carga CPU predicha')
ylabel('% de carga CPU real')
xlim([0 100])
ylim([0 100])
subplot(3,2,4)
scatter(pred_951m_mix_opt, carga_real1m,'r','*')
hold on
refline(1,0)
title('Carga predicha vs real con Percentil 95 mixtura óptima para 1 minuto')
xlabel('% de carga CPU predicha')
ylabel('% de carga CPU real')
xlim([0 100])
ylim([0 100])
subplot(3,2,5)
scatter(pred_991m_mix_opt, carga_real1m,'r','*')
hold on
refline(1,0)
title('Carga predicha vs real con Percentil 99 mixtura óptima para 1 minuto')
xlabel('% de carga CPU predicha')
ylabel('% de carga CPU real')
xlim([0 100])
ylim([0 100])
%%
%%%%%%%%%%%%%%%Representación predicción mixtura óptima porcentajes 1 minuto%%%%%%%%%%%%%%%%%%%
figure
subplot(2,2,1)
plot(media_opt_prctg1m, carga_real1m,'go','LineWidth',2)
hold on
plot(rango_media_mix1m_opt_prctg,ymedia_3_mix1m_opt_prctg)
hold on
plot(rango_media_mix1m_opt_prctg,ymedia_3_mix1m_opt_prctg_pos)
hold on
plot(rango_media_mix1m_opt_prctg,ymedia_3_mix1m_opt_prctg_neg)
title('Media mixtura óptima con porcentajes para 1 minuto')
xlabel('SRT en \mus')
ylabel('% de carga CPU')
legend('Real','Ajuste orden 3','Ajuste+0.5\mus','Ajuste-0.5\mus')
ylim([0 100])

subplot(2,2,2)
plot(percentil_90_opt_prctg1m, carga_real1m,'go','LineWidth',2)
hold on
plot(rango_p90_mix1m_opt_prctg,y90_3_mix1m_opt_prctg)
hold on
plot(rango_p90_mix1m_opt_prctg,y90_3_mix1m_opt_prctg_pos)
hold on
plot(rango_p90_mix1m_opt_prctg,y90_3_mix1m_opt_prctg_neg)
title('Percentil 90 mixtura óptima con porcentajes para 1 minuto')
xlabel('SRT en \mus')
ylabel('% de carga CPU')
legend('Real','Ajuste orden 3','Ajuste+0.5\mus','Ajuste-0.5\mus')
ylim([0 100])

subplot(2,2,3)
plot(percentil_95_opt_prctg1m, carga_real1m,'go','LineWidth',2)
hold on
plot(rango_p95_mix1m_opt_prctg,y95_3_mix1m_opt_prctg)
hold on
plot(rango_p95_mix1m_opt_prctg,y95_3_mix1m_opt_prctg_pos)
hold on
plot(rango_p95_mix1m_opt_prctg,y95_3_mix1m_opt_prctg_neg)
title('Percentil 95 mixtura óptima con porcentajes para 1 minuto')
xlabel('SRT en \mus')
ylabel('% de carga CPU')
legend('Real','Ajuste orden 3','Ajuste+0.5\mus','Ajuste-0.5\mus')
ylim([0 100])

subplot(2,2,4)
plot(percentil_99_opt_prctg1m, carga_real1m,'go','LineWidth',2)
hold on
plot(rango_p99_mix1m_opt_prctg,y99_3_mix1m_opt_prctg)
hold on
plot(rango_p99_mix1m_opt_prctg,y99_3_mix1m_opt_prctg_pos)
hold on
plot(rango_p99_mix1m_opt_prctg,y99_3_mix1m_opt_prctg_neg)
title('Percentil 99 mixtura óptima con porcentajes para 1 minuto')
xlabel('SRT en \mus')
ylabel('% de carga CPU')
legend('Real','Ajuste orden 3','Ajuste+0.5\mus','Ajuste-0.5\mus')
ylim([0 100])


figure
subplot(3,2,1)
scatter(pred_media1m_mix_opt_prctg, carga_real1m,'r','*')
hold on
refline(1,0)
title('Carga predicha vs real con Media mixtura óptima con porcentajes para 1 minuto')
xlabel('% de carga CPU predicha')
ylabel('% de carga CPU real')
xlim([0 100])
ylim([0 100])
subplot(3,2,2)
scatter(pred_501m_mix_opt_prctg, carga_real1m,'r','*')
hold on
refline(1,0)
title('Carga predicha vs real con Percentil 50 mixtura óptima con porcentajes para 1 minuto')
xlabel('% de carga CPU predicha')
ylabel('% de carga CPU real')
xlim([0 100])
ylim([0 100])
subplot(3,2,3)
scatter(pred_901m_mix_opt_prctg, carga_real1m,'r','*')
hold on
refline(1,0)
title('Carga predicha vs real con Percentil 90 mixtura óptima con porcentajes para 1 minuto')
xlabel('% de carga CPU predicha')
ylabel('% de carga CPU real')
xlim([0 100])
ylim([0 100])
subplot(3,2,4)
scatter(pred_951m_mix_opt_prctg, carga_real1m,'r','*')
hold on
refline(1,0)
title('Carga predicha vs real con Percentil 95 mixtura óptima con porcentajes para 1 minuto')
xlabel('% de carga CPU predicha')
ylabel('% de carga CPU real')
xlim([0 100])
ylim([0 100])
subplot(3,2,5)
scatter(pred_991m_mix_opt_prctg, carga_real1m,'r','*')
hold on
refline(1,0)
title('Carga predicha vs real con Percentil 99 mixtura óptima con porcentajes para 1 minuto')
xlabel('% de carga CPU predicha')
ylabel('% de carga CPU real')
xlim([0 100])
ylim([0 100])
%%
%Predicciones para test de 2 minutos por medida
[carga_real2m,media_test2m,media_opt2m,media_opt_prctg2m,percentil_90_test2m,...
    percentil_90_opt2m,percentil_90_opt_prctg2m,percentil_95_test2m,percentil_95_opt2m,...
    percentil_95_opt_prctg2m,percentil_99_test2m,percentil_99_opt2m,percentil_99_opt_prctg2m,pred_media2m,...
    pred_media2m_p,pred_media2m_n,pred_media2m_mix_opt,pred_media2m_mix_opt_prctg,pred_992m,pred_992m_p,pred_992m_n,...
    pred_992m_mix_opt,pred_992m_mix_opt_prctg,pred_952m,pred_952m_p,pred_952m_n,pred_952m_mix_opt,pred_952m_mix_opt_prctg,pred_902m,pred_902m_p,pred_902m_n,pred_902m_mix_opt,pred_902m_mix_opt_prctg,pred_502m,pred_502m_mix_opt,pred_502m_mix_opt_prctg] ...
    = prediction_xmin(centros_opt,srt_test2m,carga_test2m,pmedia_3,pmedia_3_mix_opt,pmedia_3_mix_opt_prctg,p99_3,p99_3_mix_opt,p99_3_mix_opt_prctg,p95_3,p95_3_mix_opt,p95_3_mix_opt_prctg,...
    p90_3,p90_3_mix_opt,p90_3_mix_opt_prctg,p50_3,p50_3_mix_opt,p50_3_mix_opt_prctg);
%Dibujamos las predicciones con intervalos de error frente a la carga real para 2 minutos
draw_predictions(0,2,carga_real2m,media_test2m,media_opt2m,media_opt_prctg2m,...
    pred_media2m,pred_media2m_mix_opt,pred_media2m_mix_opt_prctg,pmedia_3,pmedia_3_mix_opt,pmedia_3_mix_opt_prctg,percentil_90_test2m,...
    percentil_90_opt2m,percentil_90_opt_prctg2m,pred_902m,pred_902m_mix_opt,pred_902m_mix_opt_prctg,p90_3,p90_3_mix_opt,p90_3_mix_opt_prctg, ...
    percentil_95_test2m,percentil_95_opt2m,percentil_95_opt_prctg2m,pred_952m,pred_952m_mix_opt,pred_952m_mix_opt_prctg,...
    p95_3,p95_3_mix_opt,p95_3_mix_opt_prctg,percentil_99_test2m,percentil_99_opt2m,percentil_99_opt_prctg2m,pred_992m,...
    pred_992m_mix_opt,pred_992m_mix_opt_prctg,p99_3,p99_3_mix_opt,p99_3_mix_opt_prctg,pred_502m,pred_502m_mix_opt,pred_502m_mix_opt_prctg)
%Mixturas
draw_predictions(1,2,carga_real2m,media_test2m,media_opt2m,media_opt_prctg2m,...
    pred_media2m,pred_media2m_mix_opt,pred_media2m_mix_opt_prctg,pmedia_3,pmedia_3_mix_opt,pmedia_3_mix_opt_prctg,percentil_90_test2m,...
    percentil_90_opt2m,percentil_90_opt_prctg2m,pred_902m,pred_902m_mix_opt,pred_902m_mix_opt_prctg,p90_3,p90_3_mix_opt,p90_3_mix_opt_prctg, ...
    percentil_95_test2m,percentil_95_opt2m,percentil_95_opt_prctg2m,pred_952m,pred_952m_mix_opt,pred_952m_mix_opt_prctg,...
    p95_3,p95_3_mix_opt,p95_3_mix_opt_prctg,percentil_99_test2m,percentil_99_opt2m,percentil_99_opt_prctg2m,pred_992m,...
    pred_992m_mix_opt,pred_992m_mix_opt_prctg,p99_3,p99_3_mix_opt,p99_3_mix_opt_prctg,pred_502m,pred_502m_mix_opt,pred_502m_mix_opt_prctg)
%%
%Predicciones para test de 3 minutos por medida
[carga_real3m,media_test3m,media_opt3m,media_opt_prctg3m,percentil_90_test3m,...
    percentil_90_opt3m,percentil_90_opt_prctg3m,percentil_95_test3m,percentil_95_opt3m,...
    percentil_95_opt_prctg3m,percentil_99_test3m,percentil_99_opt3m,percentil_99_opt_prctg3m,pred_media3m,...
    pred_media3m_p,pred_media3m_n,pred_media3m_mix_opt,pred_media3m_mix_opt_prctg,pred_993m,pred_993m_p,pred_993m_n,...
    pred_993m_mix_opt,pred_993m_mix_opt_prctg,pred_953m,pred_953m_p,pred_953m_n,pred_953m_mix_opt,pred_953m_mix_opt_prctg,pred_903m,pred_903m_p,pred_903m_n,pred_903m_mix_opt,pred_903m_mix_opt_prctg,pred_503m,pred_503m_mix_opt,pred_503m_mix_opt_prctg] ...
    = prediction_xmin(centros_opt,srt_test3m,carga_test3m,pmedia_3,pmedia_3_mix_opt,pmedia_3_mix_opt_prctg,p99_3,p99_3_mix_opt,p99_3_mix_opt_prctg,p95_3,p95_3_mix_opt,p95_3_mix_opt_prctg,...
    p90_3,p90_3_mix_opt,p90_3_mix_opt_prctg,p50_3,p50_3_mix_opt,p50_3_mix_opt_prctg);
%Dibujamos las predicciones con intervalos de error frente a la carga real para 3 minutos
draw_predictions(0,3,carga_real3m,media_test3m,media_opt3m,media_opt_prctg3m,...
    pred_media3m,pred_media3m_mix_opt,pred_media3m_mix_opt_prctg,pmedia_3,pmedia_3_mix_opt,pmedia_3_mix_opt_prctg,percentil_90_test3m,...
    percentil_90_opt3m,percentil_90_opt_prctg3m,pred_903m,pred_903m_mix_opt,pred_903m_mix_opt_prctg,p90_3,p90_3_mix_opt,p90_3_mix_opt_prctg, ...
    percentil_95_test3m,percentil_95_opt3m,percentil_95_opt_prctg3m,pred_953m,pred_953m_mix_opt,pred_953m_mix_opt_prctg,...
    p95_3,p95_3_mix_opt,p95_3_mix_opt_prctg,percentil_99_test3m,percentil_99_opt3m,percentil_99_opt_prctg3m,pred_993m,...
    pred_993m_mix_opt,pred_993m_mix_opt_prctg,p99_3,p99_3_mix_opt,p99_3_mix_opt_prctg,pred_503m,pred_503m_mix_opt,pred_503m_mix_opt_prctg)
%Mixturas
draw_predictions(1,3,carga_real3m,media_test3m,media_opt3m,media_opt_prctg3m,...
    pred_media3m,pred_media3m_mix_opt,pred_media3m_mix_opt_prctg,pmedia_3,pmedia_3_mix_opt,pmedia_3_mix_opt_prctg,percentil_90_test3m,...
    percentil_90_opt3m,percentil_90_opt_prctg3m,pred_903m,pred_903m_mix_opt,pred_903m_mix_opt_prctg,p90_3,p90_3_mix_opt,p90_3_mix_opt_prctg, ...
    percentil_95_test3m,percentil_95_opt3m,percentil_95_opt_prctg3m,pred_953m,pred_953m_mix_opt,pred_953m_mix_opt_prctg,...
    p95_3,p95_3_mix_opt,p95_3_mix_opt_prctg,percentil_99_test3m,percentil_99_opt3m,percentil_99_opt_prctg3m,pred_993m,...
    pred_993m_mix_opt,pred_993m_mix_opt_prctg,p99_3,p99_3_mix_opt,p99_3_mix_opt_prctg,pred_503m,pred_503m_mix_opt,pred_503m_mix_opt_prctg)
%%
%Predicciones para test de 4 minutos por medida
[carga_real4m,media_test4m,media_opt4m,media_opt_prctg4m,percentil_90_test4m,...
    percentil_90_opt4m,percentil_90_opt_prctg4m,percentil_95_test4m,percentil_95_opt4m,...
    percentil_95_opt_prctg4m,percentil_99_test4m,percentil_99_opt4m,percentil_99_opt_prctg4m,pred_media4m,...
    pred_media4m_p,pred_media4m_n,pred_media4m_mix_opt,pred_media4m_mix_opt_prctg,pred_994m,pred_994m_p,pred_994m_n,...
    pred_994m_mix_opt,pred_994m_mix_opt_prctg,pred_954m,pred_954m_p,pred_954m_n,pred_954m_mix_opt,pred_954m_mix_opt_prctg,pred_904m,pred_904m_p,pred_904m_n,pred_904m_mix_opt,pred_904m_mix_opt_prctg,pred_504m,pred_504m_mix_opt,pred_504m_mix_opt_prctg] ...
    = prediction_xmin(centros_opt,srt_test4m,carga_test4m,pmedia_3,pmedia_3_mix_opt,pmedia_3_mix_opt_prctg,p99_3,p99_3_mix_opt,p99_3_mix_opt_prctg,p95_3,p95_3_mix_opt,p95_3_mix_opt_prctg,...
    p90_3,p90_3_mix_opt,p90_3_mix_opt_prctg,p50_3,p50_3_mix_opt,p50_3_mix_opt_prctg);
%Dibujamos las predicciones con intervalos de error frente a la carga real para 4 minutos
draw_predictions(0,4,carga_real4m,media_test4m,media_opt4m,media_opt_prctg4m,...
    pred_media4m,pred_media4m_mix_opt,pred_media4m_mix_opt_prctg,pmedia_3,pmedia_3_mix_opt,pmedia_3_mix_opt_prctg,percentil_90_test4m,...
    percentil_90_opt4m,percentil_90_opt_prctg4m,pred_904m,pred_904m_mix_opt,pred_904m_mix_opt_prctg,p90_3,p90_3_mix_opt,p90_3_mix_opt_prctg, ...
    percentil_95_test4m,percentil_95_opt4m,percentil_95_opt_prctg4m,pred_954m,pred_954m_mix_opt,pred_954m_mix_opt_prctg,...
    p95_3,p95_3_mix_opt,p95_3_mix_opt_prctg,percentil_99_test4m,percentil_99_opt4m,percentil_99_opt_prctg4m,pred_994m,...
    pred_994m_mix_opt,pred_994m_mix_opt_prctg,p99_3,p99_3_mix_opt,p99_3_mix_opt_prctg,pred_504m,pred_504m_mix_opt,pred_504m_mix_opt_prctg)
%Mixturas
draw_predictions(1,4,carga_real4m,media_test4m,media_opt4m,media_opt_prctg4m,...
    pred_media4m,pred_media4m_mix_opt,pred_media4m_mix_opt_prctg,pmedia_3,pmedia_3_mix_opt,pmedia_3_mix_opt_prctg,percentil_90_test4m,...
    percentil_90_opt4m,percentil_90_opt_prctg4m,pred_904m,pred_904m_mix_opt,pred_904m_mix_opt_prctg,p90_3,p90_3_mix_opt,p90_3_mix_opt_prctg, ...
    percentil_95_test4m,percentil_95_opt4m,percentil_95_opt_prctg4m,pred_954m,pred_954m_mix_opt,pred_954m_mix_opt_prctg,...
    p95_3,p95_3_mix_opt,p95_3_mix_opt_prctg,percentil_99_test4m,percentil_99_opt4m,percentil_99_opt_prctg4m,pred_994m,...
    pred_994m_mix_opt,pred_994m_mix_opt_prctg,p99_3,p99_3_mix_opt,p99_3_mix_opt_prctg,pred_504m,pred_504m_mix_opt,pred_504m_mix_opt_prctg)

%%
%Predicciones para test de 5 minutos por medida
[carga_real5m,media_test5m,media_opt5m,media_opt_prctg5m,percentil_90_test5m,...
    percentil_90_opt5m,percentil_90_opt_prctg5m,percentil_95_test5m,percentil_95_opt5m,...
    percentil_95_opt_prctg5m,percentil_99_test5m,percentil_99_opt5m,percentil_99_opt_prctg5m,pred_media5m,...
    pred_media5m_p,pred_media5m_n,pred_media5m_mix_opt,pred_media5m_mix_opt_prctg,pred_995m,pred_995m_p,pred_995m_n,...
    pred_995m_mix_opt,pred_995m_mix_opt_prctg,pred_955m,pred_955m_p,pred_955m_n,pred_955m_mix_opt,pred_955m_mix_opt_prctg,pred_905m,pred_905m_p,pred_905m_n,pred_905m_mix_opt,pred_905m_mix_opt_prctg,pred_505m,pred_505m_mix_opt,pred_505m_mix_opt_prctg] ...
    = prediction_xmin(centros_opt,srt_test5m,carga_test5m,pmedia_3,pmedia_3_mix_opt,pmedia_3_mix_opt_prctg,p99_3,p99_3_mix_opt,p99_3_mix_opt_prctg,p95_3,p95_3_mix_opt,p95_3_mix_opt_prctg,...
    p90_3,p90_3_mix_opt,p90_3_mix_opt_prctg,p50_3,p50_3_mix_opt,p50_3_mix_opt_prctg);
%Dibujamos las predicciones con intervalos de error frente a la carga real para 5 minutos
draw_predictions(0,5,carga_real5m,media_test5m,media_opt5m,media_opt_prctg5m,...
    pred_media5m,pred_media5m_mix_opt,pred_media5m_mix_opt_prctg,pmedia_3,pmedia_3_mix_opt,pmedia_3_mix_opt_prctg,percentil_90_test5m,...
    percentil_90_opt5m,percentil_90_opt_prctg5m,pred_905m,pred_905m_mix_opt,pred_905m_mix_opt_prctg,p90_3,p90_3_mix_opt,p90_3_mix_opt_prctg, ...
    percentil_95_test5m,percentil_95_opt5m,percentil_95_opt_prctg5m,pred_955m,pred_955m_mix_opt,pred_955m_mix_opt_prctg,...
    p95_3,p95_3_mix_opt,p95_3_mix_opt_prctg,percentil_99_test5m,percentil_99_opt5m,percentil_99_opt_prctg5m,pred_995m,...
    pred_995m_mix_opt,pred_995m_mix_opt_prctg,p99_3,p99_3_mix_opt,p99_3_mix_opt_prctg,pred_505m,pred_505m_mix_opt,pred_505m_mix_opt_prctg)
%Mixturas
draw_predictions(1,5,carga_real5m,media_test5m,media_opt5m,media_opt_prctg5m,...
    pred_media5m,pred_media5m_mix_opt,pred_media5m_mix_opt_prctg,pmedia_3,pmedia_3_mix_opt,pmedia_3_mix_opt_prctg,percentil_90_test5m,...
    percentil_90_opt5m,percentil_90_opt_prctg5m,pred_905m,pred_905m_mix_opt,pred_905m_mix_opt_prctg,p90_3,p90_3_mix_opt,p90_3_mix_opt_prctg, ...
    percentil_95_test5m,percentil_95_opt5m,percentil_95_opt_prctg5m,pred_955m,pred_955m_mix_opt,pred_955m_mix_opt_prctg,...
    p95_3,p95_3_mix_opt,p95_3_mix_opt_prctg,percentil_99_test5m,percentil_99_opt5m,percentil_99_opt_prctg5m,pred_995m,...
    pred_995m_mix_opt,pred_995m_mix_opt_prctg,p99_3,p99_3_mix_opt,p99_3_mix_opt_prctg,pred_505m,pred_505m_mix_opt,pred_505m_mix_opt_prctg)

%%
%Mean absolute percentage error (MAPE)
%Para 1 minutos
mape_media_opt_1m = mape(carga_real1m, pred_media1m_mix_opt);
mape_media_opt_prctg_1m = mape(carga_real1m, pred_media1m_mix_opt_prctg);
mape_50_opt_1m = mape(carga_real1m, pred_501m_mix_opt);
mape_50_opt_prctg_1m = mape(carga_real1m, pred_501m_mix_opt_prctg);
mape_90_opt_1m = mape(carga_real1m, pred_901m_mix_opt);
mape_90_opt_prctg_1m = mape(carga_real1m, pred_901m_mix_opt_prctg);
mape_95_opt_1m = mape(carga_real1m, pred_951m_mix_opt);
mape_95_opt_prctg_1m = mape(carga_real1m, pred_951m_mix_opt_prctg);
mape_99_opt_1m = mape(carga_real1m, pred_991m_mix_opt);
mape_99_opt_prctg_1m = mape(carga_real1m, pred_991m_mix_opt_prctg);
%Para 2 minutos
mape_media_opt_2m = mape(carga_real2m, pred_media2m_mix_opt);
mape_media_opt_prctg_2m = mape(carga_real2m, pred_media2m_mix_opt_prctg);
mape_50_opt_2m = mape(carga_real2m, pred_502m_mix_opt);
mape_50_opt_prctg_2m = mape(carga_real2m, pred_502m_mix_opt_prctg);
mape_90_opt_2m = mape(carga_real2m, pred_902m_mix_opt);
mape_90_opt_prctg_2m = mape(carga_real2m, pred_902m_mix_opt_prctg);
mape_95_opt_2m = mape(carga_real2m, pred_952m_mix_opt);
mape_95_opt_prctg_2m = mape(carga_real2m, pred_952m_mix_opt_prctg);
mape_99_opt_2m = mape(carga_real2m, pred_992m_mix_opt);
mape_99_opt_prctg_2m = mape(carga_real2m, pred_992m_mix_opt_prctg);
%Para 3 minutos
mape_media_opt_3m = mape(carga_real3m, pred_media3m_mix_opt);
mape_media_opt_prctg_3m = mape(carga_real3m, pred_media3m_mix_opt_prctg);
mape_50_opt_3m = mape(carga_real3m, pred_503m_mix_opt);
mape_50_opt_prctg_3m = mape(carga_real3m, pred_503m_mix_opt_prctg);
mape_90_opt_3m = mape(carga_real3m, pred_903m_mix_opt);
mape_90_opt_prctg_3m = mape(carga_real3m, pred_903m_mix_opt_prctg);
mape_95_opt_3m = mape(carga_real3m, pred_953m_mix_opt);
mape_95_opt_prctg_3m = mape(carga_real3m, pred_953m_mix_opt_prctg);
mape_99_opt_3m = mape(carga_real3m, pred_993m_mix_opt);
mape_99_opt_prctg_3m = mape(carga_real3m, pred_993m_mix_opt_prctg);
%Para 4 minutos
mape_media_opt_4m = mape(carga_real4m, pred_media4m_mix_opt);
mape_media_opt_prctg_4m = mape(carga_real4m, pred_media4m_mix_opt_prctg);
mape_50_opt_4m = mape(carga_real4m, pred_504m_mix_opt);
mape_50_opt_prctg_4m = mape(carga_real4m, pred_504m_mix_opt_prctg);
mape_90_opt_4m = mape(carga_real4m, pred_904m_mix_opt);
mape_90_opt_prctg_4m = mape(carga_real4m, pred_904m_mix_opt_prctg);
mape_95_opt_4m = mape(carga_real4m, pred_954m_mix_opt);
mape_95_opt_prctg_4m = mape(carga_real4m, pred_954m_mix_opt_prctg);
mape_99_opt_4m = mape(carga_real4m, pred_994m_mix_opt);
mape_99_opt_prctg_4m = mape(carga_real4m, pred_994m_mix_opt_prctg);
%Para 5 minutos
mape_media_opt_5m = mape(carga_real5m, pred_media5m_mix_opt);
mape_media_opt_prctg_5m = mape(carga_real5m, pred_media5m_mix_opt_prctg);
mape_50_opt_5m = mape(carga_real5m, pred_505m_mix_opt);
mape_50_opt_prctg_5m = mape(carga_real5m, pred_505m_mix_opt_prctg);
mape_90_opt_5m = mape(carga_real5m, pred_905m_mix_opt);
mape_90_opt_prctg_5m = mape(carga_real5m, pred_905m_mix_opt_prctg);
mape_95_opt_5m = mape(carga_real5m, pred_955m_mix_opt);
mape_95_opt_prctg_5m = mape(carga_real5m, pred_955m_mix_opt_prctg);
mape_99_opt_5m = mape(carga_real5m, pred_995m_mix_opt);
mape_99_opt_prctg_5m = mape(carga_real5m, pred_995m_mix_opt_prctg);

%%
%Calculamos una estimación de la prediccion utilizando los pesos en función
%del mape calculado
mape_opt_tot_3m = mape_media_opt_3m + mape_90_opt_3m + mape_95_opt_3m + mape_99_opt_3m;
mape_opt_prctg_tot_3m = mape_media_opt_prctg_3m + mape_90_opt_prctg_3m + mape_95_opt_prctg_3m + mape_99_opt_prctg_3m;

peso_media_opt_3m = 1 - mape_media_opt_3m / mape_opt_tot_3m;
peso_p90_opt_3m = 1 - mape_90_opt_3m / mape_opt_tot_3m;
peso_p95_opt_3m = 1 - mape_95_opt_3m / mape_opt_tot_3m;
peso_p99_opt_3m = 1 - mape_99_opt_3m / mape_opt_tot_3m;

peso_media_opt_prctg_3m = 1 - mape_media_opt_prctg_3m / mape_opt_prctg_tot_3m;
peso_p90_opt_prctg_3m = 1 - mape_90_opt_prctg_3m / mape_opt_prctg_tot_3m;
peso_p95_opt_prctg_3m = 1 - mape_95_opt_prctg_3m / mape_opt_prctg_tot_3m;
peso_p99_opt_prctg_3m = 1 - mape_99_opt_prctg_3m / mape_opt_prctg_tot_3m;

predicciones_opt = zeros(1,length(carga_real3m));
predicciones_opt_prctg = zeros(1,length(carga_real3m));
pred_media = [];
eje_media = [];
pred_50 = [];
eje_50 = [];
pred_90 = [];
eje_90 = [];
pred_95 = [];
eje_95 = [];
pred_99 = [];
eje_99 = [];

pred_media_prctg = [];
eje_media_prctg = [];
pred_50_prctg = [];
eje_50_prctg = [];
pred_90_prctg = [];
eje_90_prctg = [];
pred_95_prctg = [];
eje_95_prctg = [];
pred_99_prctg = [];
eje_99_prctg = [];

for i=1:length(carga_real3m)
    
    aux_error_media = abs(carga_real3m(i) - pred_media3m_mix_opt(i));
    aux_error_50 = abs(carga_real3m(i) - pred_503m_mix_opt(i));
    aux_error_90 = abs(carga_real3m(i) - pred_903m_mix_opt(i));
    aux_error_95 = abs(carga_real3m(i) - pred_953m_mix_opt(i));
    aux_error_99 = abs(carga_real3m(i) - pred_993m_mix_opt(i));
    
    errores =  [aux_error_media aux_error_50 aux_error_90 aux_error_95 aux_error_99];
    
    [~, idx_err_min] = min(errores);
    
    switch idx_err_min
        case 1
            predicciones_opt(i) = pred_media3m_mix_opt(i);
            pred_media = [pred_media pred_media3m_mix_opt(i)];
            eje_media = [eje_media carga_real3m(i)];
        case 2
            predicciones_opt(i) = pred_503m_mix_opt(i);
            pred_50 = [pred_50 pred_503m_mix_opt(i)];
            eje_50 = [eje_50 carga_real3m(i)];
        case 3
            predicciones_opt(i) = pred_903m_mix_opt(i);
            pred_90 = [pred_90 pred_903m_mix_opt(i)];
            eje_90 = [eje_90 carga_real3m(i)];
        case 4
            predicciones_opt(i) = pred_953m_mix_opt(i);
            pred_95 = [pred_95 pred_953m_mix_opt(i)];
            eje_95 = [eje_95 carga_real3m(i)];
        case 5
            predicciones_opt(i) = pred_993m_mix_opt(i);
            pred_99 = [pred_99 pred_993m_mix_opt(i)];
            eje_99 = [eje_99 carga_real3m(i)];
    end
    
    aux_error_media = abs(carga_real3m(i) - pred_media3m_mix_opt_prctg(i));
    aux_error_50 = abs(carga_real3m(i) - pred_503m_mix_opt_prctg(i));
    aux_error_90 = abs(carga_real3m(i) - pred_903m_mix_opt_prctg(i));
    aux_error_95 = abs(carga_real3m(i) - pred_953m_mix_opt_prctg(i));
    aux_error_99 = abs(carga_real3m(i) - pred_993m_mix_opt_prctg(i));
    
    errores =  [aux_error_media aux_error_50 aux_error_90 aux_error_95 aux_error_99];
    
    [~, idx_err_min] = min(errores);
    
    switch idx_err_min
        case 1
            predicciones_opt_prctg(i) = pred_media3m_mix_opt_prctg(i);
            pred_media_prctg = [pred_media_prctg pred_media3m_mix_opt(i)];
            eje_media_prctg = [eje_media_prctg carga_real3m(i)];
        case 2
            predicciones_opt_prctg(i) = pred_503m_mix_opt_prctg(i);
            pred_50_prctg = [pred_50_prctg pred_503m_mix_opt(i)];
            eje_50_prctg = [eje_50_prctg carga_real3m(i)];
        case 3
            predicciones_opt_prctg(i) = pred_903m_mix_opt_prctg(i);
            pred_90_prctg = [pred_90_prctg pred_903m_mix_opt(i)];
            eje_90_prctg = [eje_90_prctg carga_real3m(i)];
        case 4
            predicciones_opt_prctg(i) = pred_953m_mix_opt_prctg(i);
            pred_95_prctg = [pred_95_prctg pred_953m_mix_opt(i)];
            eje_95_prctg = [eje_95_prctg carga_real3m(i)];
        case 5
            predicciones_opt_prctg(i) = pred_993m_mix_opt_prctg(i);
            pred_99_prctg = [pred_99_prctg pred_993m_mix_opt(i)];
            eje_99_prctg = [eje_99_prctg carga_real3m(i)];
    end    
    
end

figure
hold on
scatter(pred_media,eje_media,50,'r','*','LineWidth',1.5)
scatter(pred_50,eje_50,50,'c','+','LineWidth',1.5)
scatter(pred_90,eje_90,50,'g','+','LineWidth',1.5)
scatter(pred_95,eje_95,50,'m','x','LineWidth',1.5)
scatter(pred_99,eje_99,50,'b','p','LineWidth',1.5)
refline(1,0)
title('Carga predicha vs real combinación óptimas para 3 minutos')
xlabel('% de carga CPU predicha')
ylabel('% de carga CPU real')
xlim([0 100])
ylim([0 100])
legend({'Media','P50','P90','P95','P99'},'Location','northwest')

figure
hold on
scatter(pred_media_prctg,eje_media_prctg,50,'r','*','LineWidth',1.5)
scatter(pred_50_prctg,eje_50_prctg,50,'c','+','LineWidth',1.5)
scatter(pred_90_prctg,eje_90_prctg,50,'g','+','LineWidth',1.5)
scatter(pred_95_prctg,eje_95_prctg,50,'m','x','LineWidth',1.5)
scatter(pred_99_prctg,eje_99_prctg,50,'b','p','LineWidth',1.5)
refline(1,0)
title('Carga predicha vs real combinación óptimas con porcentajes para 3 minutos')
xlabel('% de carga CPU predicha')
ylabel('% de carga CPU real')
xlim([0 100])
ylim([0 100])
legend({'Media','P50','P90','P95','P99'},'Location','northwest')
%%
%Modas
modas_org = zeros(1,length(srt_cpu));
modas_opt = zeros(1,length(srt_cpu));
for i=1:length(srt_cpu)
    
    %Modas originales
    modas_org(i) = mode(srt_cpu{2,i});
    
    %Modas mixtura óptima
    [~, idx_moda_opt] = max(pdf_combi_opt{i});
    modas_opt(i) = range_pdf_opt{i}(idx_moda_opt);
  
end

%Regresión 3º orden modas optimas
p_moda_3 = polyfit(modas_opt,cargas_calib,3);
nmin = min(modas_opt);
nmax = max(modas_opt);
n_moda = (nmax-nmin)/500;
rango_p_moda = nmin:n_moda:nmax;
y_moda_3 = polyval(p_moda_3,rango_p_moda);

%Representamos ajuste percentil 99 mixtura test con porcentajes
figure
plot(modas_opt,cargas_calib,'o')
hold on
plot(rango_p_moda,y_moda_3,'g')
title('Modas mixtura óptima')
ylim([0 100])
ylabel('Cargas medias CPU en %')
xlabel('Tiempos de SRT en \mus')
legend('Valores reales','Orden 3')

for n_test=1:length(srt_test3m)
    
    f1=figure;
    h=histogram(srt_test3m{2,n_test}, 'Normalization', 'cdf');
    cdf_srt3m = h.Values;
    cdf_srt3m(end+1)=1;
    range_cdf_srt3m = h.BinEdges;
    close(f1)
    
    %Find value when cdf is 0.999
    cdf_value=0.999;
    [val_cdf,idx_cdf]=min(abs(cdf_srt3m-cdf_value));
    interval_cdf=range_cdf_srt3m(idx_cdf);
    
    
    [pdf_combi_opt3m{n_test},range_pdf_opt3m{n_test},cdf_opt3m_1{n_test},cdf_opt3m_2{n_test},cdf_opt3m_3{n_test},cdf_opt3m_4{n_test},cdf_combi_opt3m{n_test},range_cdf_opt3m{n_test},idx_opt3m{n_test},media_opt3m_1(n_test),media_opt3m_2(n_test),media_opt3m_3(n_test),media_opt3m_4(n_test),media_opt3m(n_test)] = dist_opt(0,srt_test3m{2,n_test},centros_opt{n_test},0);
    [srt_value_prctg3m{n_test}] = values_prctgs(srt_test3m{2,n_test}, idx_opt3m{n_test});
    [idx_opt_prctg3m{n_test},pdf_combi_prctg3m{n_test},range_pdf_prctg3m{n_test},cdf_combi_prctg3m_1{n_test},cdf_combi_prctg3m_2{n_test},cdf_combi_prctg3m_3{n_test},cdf_combi_prctg3m_4{n_test},cdf_combi_prctg3m{n_test},range_cdf_prctg3m{n_test},media_opt_prctg3m_1(n_test),media_opt_prctg3m_2(n_test),media_opt_prctg3m_3(n_test),media_opt_prctg3m_4(n_test),media_opt_prctg3m(n_test)] = dist_prctgs(srt_test3m{2,n_test},srt_value_prctg3m{n_test},idx_opt3m{n_test});
    %Iteración extra
    [pdf_combi_opt3m{n_test},range_pdf_opt3m{n_test},cdf_opt3m_1{n_test},cdf_opt3m_2{n_test},cdf_opt3m_3{n_test},cdf_opt3m_4{n_test},cdf_combi_opt3m{n_test},range_cdf_opt3m{n_test},idx_opt3m{n_test},media_opt3m_1(n_test),media_opt3m_2(n_test),media_opt3m_3(n_test),media_opt3m_4(n_test),media_opt3m(n_test)] = dist_opt(1,srt_test3m{2,n_test},centros_opt{n_test},idx_opt_prctg3m{n_test});
    [srt_value_prctg3m{n_test}] = values_prctgs(srt_test3m{2,n_test}, idx_opt3m{n_test});
    [idx_opt_prctg3m{n_test},pdf_combi_prctg3m{n_test},range_pdf_prctg3m{n_test},cdf_combi_prctg3m_1{n_test},cdf_combi_prctg3m_2{n_test},cdf_combi_prctg3m_3{n_test},cdf_combi_prctg3m_4{n_test},cdf_combi_prctg3m{n_test},range_cdf_prctg3m{n_test},media_opt_prctg3m_1(n_test),media_opt_prctg3m_2(n_test),media_opt_prctg3m_3(n_test),media_opt_prctg3m_4(n_test),media_opt_prctg3m(n_test)] = dist_prctgs(srt_test3m{2,n_test},srt_value_prctg3m{n_test},idx_opt3m{n_test});

    
    %Modas mixtura óptima
    [~, idx_moda_opt] = max(pdf_combi_opt3m{n_test});
    modas_opt_3m(n_test) = range_pdf_opt3m{n_test}(idx_moda_opt);
    
    %Predicciones modas óptimas
    pred_moda_3m(n_test)= polyval(p_moda_3,modas_opt_3m(n_test));
  
end

carga_real3m=[carga_test3m{2,:}];

%Moda 3min calibracion
nmin=min(modas_opt_3m);
nmax=max(modas_opt_3m);
n_moda_mix_opt=(nmax-nmin)/100;
rango_moda_mix3m_opt=nmin:n_moda_mix_opt:nmax;
ymoda_3_mix3m_opt=polyval(p_moda_3,rango_moda_mix3m_opt);

figure
hold on
plot(modas_opt_3m, carga_real3m,'go','LineWidth',2)
plot(rango_moda_mix3m_opt,ymoda_3_mix3m_opt)
title('Moda para 3 minutos')
xlabel('SRT en \mus')
ylabel('% de carga CPU')
legend('Real','Ajuste orden 3')
ylim([0 100])

figure
hold on
scatter(pred_moda_3m,carga_real3m,50,'r','*','LineWidth',1.5)
refline(1,0)
title('Carga predicha vs real modas óptimas para 3 minutos')
xlabel('% de carga CPU predicha')
ylabel('% de carga CPU real')
xlim([0 100])
ylim([0 100])
legend('Moda')
