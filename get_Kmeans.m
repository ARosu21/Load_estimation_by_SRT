function [cluster,nbins_cluster]=get_Kmeans(n_clusters,srt)

%opts = statset('Display','final'); 
% [idx,C] = kmeans(X,4,'Distance','cityblock','Replicates',5);

edges=unique(srt);
counts=histcounts(srt,edges);
ant=edges(length(edges)-1);
last=edges(length(edges));
i_ant=find(srt==ant);
i_last=find(srt==last);
counts(length(counts))=length(i_ant);
counts(length(counts)+1)=length(i_last);
x = edges';
y = counts;

% figure; 
% scatter(X(:,1),X(:,2),10,'ko'); 
% title 'Data';
X=srt;
TF = islocalmax(y);
maximos_localesx = x(TF);
maximos_localesy = y(TF);
[~,I]=maxk(maximos_localesy, n_clusters);
maximos_loc=maximos_localesx(I);

figure
plot(x,y,x(TF),y(TF),'r*')

pd=fitdist(X, 'Kernel', 'Kernel','triangle');
range=linspace(min(X), max(X));
xPdf=pdf(pd, range);
xCdf=cdf(pd,range);

figure
hold on
histogram(X, 'Normalization', 'pdf');
plot(range, xPdf, 'LineWidth', 2);
ylabel('pdf')
yyaxis right
plot(range, xCdf, 'LineWidth', 2);
ylabel('cdf');


% 'Distance','cityblock'
opts = statset('Display','final'); 
%'Replicates',100
% C_ini=[13;26;41];
[idx,C] = kmeans(X,n_clusters,'Options',opts,'Start',maximos_loc');

cluster1=X(idx==1);
cluster2=X(idx==2);
cluster3=X(idx==3);
% cluster4=X(idx==4);


pd=fitdist(cluster1, 'Kernel', 'Kernel','triangle');
range=linspace(min(cluster1), max(cluster1));
xPdf=pdf(pd, range);
xCdf=cdf(pd,range);

figure
hold on
histogram(cluster1, 'Normalization', 'pdf');
plot(range, xPdf, 'LineWidth', 2);
ylabel('pdf')
yyaxis right
plot(range, xCdf, 'LineWidth', 2);
ylabel('cdf');

figure
h=histogram(cluster1);
p=histcounts(cluster1,'Normalization', 'pdf');
figure
binCenters = h.BinEdges + (h.BinWidth/2);
plot(binCenters(1:end-1), p, 'r-')

figure
histogram(cluster1,round(sqrt(length(cluster1))))
title('Cluster 1')
ylim([0 3000])
figure
histogram(cluster2,round(sqrt(length(cluster2))))
title('Cluster 2')
ylim([0 3000])
figure
histogram(cluster3,round(sqrt(length(cluster3))))
title('Cluster 3')
ylim([0 3000])
% figure
% histogram(cluster4,round(sqrt(length(cluster4))))
% title('Cluster 4')

figure
histogram(cluster1,round(sqrt(length(cluster1))))
hold on
histogram(cluster2,round(sqrt(length(cluster2))))
hold on
histogram(cluster3,round(sqrt(length(cluster3))))
hold on
xline(C(1))
xline(C(2))
xline(C(3))
legend('Cluster1', 'Cluster2','Cluster3')
% histogram(cluster4,round(sqrt(length(cluster4))))
% legend('Cluster1', 'Cluster2', 'Cluster3','Cluster4')

figure; 
plot(X(idx==1),'r.','MarkerSize',12) 
hold on 
plot(X(idx==2),'b.','MarkerSize',12) 
hold on 
plot(X(idx==3),'g.','MarkerSize',12) 
hold on 
plot(X(idx==4),'y.','MarkerSize',12) 
plot(C(:,1),'kx','MarkerSize',15,'LineWidth',3)  
legend('Cluster 1','Cluster 2','Cluster 3','Cluster 4','Centroids','Location','NW') 
title 'Cluster Assignments and Centroids' 
hold off

clusters=zeros(1,n_clusters);

for i=1:n_clusters
    clusters(i)=length(X(idx==i));
end

[~,index] = max(clusters);
cluster=X(idx==index);
nbins_cluster = round(sqrt(length(cluster)));

% %Histograma cluster sin carga
% percentil_95_cluster = prctile(cluster,95);
% percentil_99_cluster = prctile(cluster,99);
% percentil_50_cluster = prctile(cluster,50);
% media_cluster = mean(cluster);
% 
% figure;
% histogram(cluster,nbins_cluster)
% hold on
% xline(percentil_95_cluster, '--r','Percentil 95')
% xline(percentil_99_cluster, '--b','Percentil 99')
% xline(percentil_50_cluster, '--g','Percentil 50')
% xline(media_cluster,'--m','Media')
% title('Histograma SRT Cluster Sin Carga')
% xlabel('SRT en \mus')
% ylabel('Nº de paquetes')

end










