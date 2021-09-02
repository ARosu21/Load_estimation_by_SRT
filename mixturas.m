function [mixtura_principal,nbins]=mixturas(srt,n_mix)

options = statset('Display','final','MaxIter',1000); 
Sigma={'diagonal', 'full'};
SharedCovariance={true,false};
gm = fitgmdist(srt,n_mix,'RegularizationValue',0.1,'CovarianceType',Sigma{1},'SharedCovariance',SharedCovariance{2},'Options',options);

maximo=mode(srt);
[~,idx]=min(abs(gm.mu-maximo));

media=gm.mu(idx);
desv=gm.Sigma(:,:,idx);
rango_min=media-2*desv;
rango_max=media+2*desv;

mixtura_principal=srt(srt>=rango_min & srt<=rango_max);
nbins=round(sqrt(length(mixtura_principal)));

% figure
% histogram(mixtura_principal,nbins)

% clusterX=cluster(gm,srt);
% cluster1=srt(clusterX==1);
% cluster2=srt(clusterX==2);
% cluster3=srt(clusterX==3);
% cluster4=srt(clusterX==4);
% 
% nbins1=round(sqrt(length(cluster1)));
% nbins2=round(sqrt(length(cluster2)));
% nbins3=round(sqrt(length(cluster3)));
% nbins4=round(sqrt(length(cluster4)));
% 
% medias=sort(gm.mu);
% media_principal=medias(3);
% idx=find(gm.mu==media_principal);
% 
% mixtura_principal=srt(clusterX==idx);
% nbins=round(sqrt(length(mixtura_principal)));
% 
% figure
% histogram(mixtura_principal,nbins)
% title('Cluster principal')
% 
% figure
% histogram(cluster1,nbins1)
% title('Cluster 1')
% figure
% histogram(cluster2,nbins2)
% title('Cluster 2')
% figure
% histogram(cluster3,nbins3)
% title('Cluster 3')
% figure
% histogram(cluster4,nbins4)
% title('Cluster 4')

% pdfs=cell(1,n_mix);
% maximos=zeros(1,n_mix);
% for i=1:n_mix
%     pdfs{1,i}=normpdf(srt,gm.mu(i),gm.Sigma(:,:,i));
%     maximos(i)=max(pdfs{1,i});
% end
% medias=sort(gm.mu);
% media=medias((n_mix/2)+1);
% idx=find(gm.mu==media);
% [~,maximo]=max(maximos);
% 
% 
% figure
% subplot(2,2,1)
% scatter(srt,pdfs{1,1})
% ylim([0 1])
% subplot(2,2,2)
% scatter(srt,pdfs{1,2})
% ylim([0 1])
% subplot(2,2,3)
% scatter(srt,pdfs{1,3})
% ylim([0 1])
% subplot(2,2,4)
% scatter(srt,pdfs{1,4})
% ylim([0 1])
end