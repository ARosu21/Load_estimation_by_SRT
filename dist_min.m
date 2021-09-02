function [centros_opt,pdf_opt,cdf_opt]=dist_min(srt,maximos_loc)
%%
%Obtenemos los valores únicos de SRT(x) y su frecuencia(y)
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

[f, xi] = ksdensity(srt,'Bandwidth', 0.4);
% figure
% plot(xi, f)

[maximo_tot, indice_maximo] = max(f);
prctg_max = 0.15 * maximo_tot;
maximos_f = f(1);
maximos_aux = [];
minimos_aux = [];
maximos_loc = [];
minimos_loc = [];
indices_maximos = [];
maximo = 1;

for i=1:length(xi)
    if maximo == 1
        if f(i) > maximos_f 
            maximos_f = f(i);
            maximos_aux = [maximos_aux maximos_f]; 
        elseif i > 1
            maximos_loc = [maximos_loc xi(i-1)];
            indices_maximos = [indices_maximos i-1];
            minimos_f = f(i);
            maximo = 0;
        end
    else
        if f(i) < minimos_f 
            minimos_f = f(i);
            minimos_aux = [minimos_aux minimos_f]; 
        elseif i > 1
            minimos_loc = [minimos_loc xi(i-1)];
            maximos_f = f(i);
            maximo = 1;
        end
    end  
    
    if length(maximos_loc) > 1 && maximos_loc(end) >= interval_cdf
        break
    end
    
    if length(maximos_loc) > 1 && abs(f(indices_maximos(end))-f(indices_maximos(end-1))) < prctg_max && abs(xi(indices_maximos(end))-xi(indices_maximos(end-1))) < 8
        if f(indices_maximos(end)) < f(indices_maximos(end-1))
            maximos_loc = maximos_loc(1:end-1);
            indices_maximos = indices_maximos(1:end-1);
        else
            maximos_loc(end-1) = maximos_loc(end);
            maximos_loc = maximos_loc(1:end-1);
            indices_maximos(end-1) = indices_maximos(end);
            indices_maximos = indices_maximos(1:end-1);
        end
    end  
end

if maximos_loc(4) <= xi(indice_maximo)
    maximos_loc = maximos_loc(2:end);
end
if length(maximos_loc) > 4 
    maximos_loc = maximos_loc(1:4);
end


cell_maximos=combi_maximos(maximos_loc);

figure
plot(xi, f)
xline(maximos_loc(1))
xline(maximos_loc(2))
xline(maximos_loc(3))
xline(maximos_loc(4))
title('Máximos locales iniciales')

% plot(x,y,x(TF),y(TF),'r*')
%PDF y CDF de los datos
% [val_pdf,x_pdf] = hist(srt); 
% [val_cdf,x_cdf]=ecdf(srt);

% figure
% hold on
% plot(x_pdf,val_pdf/sum(val_pdf),'LineWidth', 2) %PDF
% ylabel('pdf')
% yyaxis right
% plot(x_cdf,val_cdf,'LineWidth', 2) %CDF
% ylabel('cdf')
% legend('Pdf', 'Cdf')



%%
%Calculamos las distancias euclídeas y asignamos los índices a los centros
%más cercanos
dist_kolm=ones(1,length(cell_maximos));
pdf_combi=cell(1,length(cell_maximos));
cdf_combi=cell(1,length(cell_maximos));
    
for i=1:length(cell_maximos)

    maximos_loc=cell_maximos{i};

    d1=sqrt((srt-maximos_loc(1)).^2);
    d2=sqrt((srt-maximos_loc(2)).^2);
    d3=sqrt((srt-maximos_loc(3)).^2);
    d4=sqrt((srt-maximos_loc(4)).^2);
    idx=zeros(length(srt),1);
    for j=1:length(srt)
        d_min=[d1(j) d2(j) d3(j) d4(j)];
        [~,I]=min(d_min);

        if I==1
            idx(j)=1;
        elseif I==2
            idx(j)=2;
        elseif I==3
            idx(j)=3;
        elseif I==4
            idx(j)=4;
        end
    end

    cluster1=srt(idx==1);
    cluster2=srt(idx==2);
    cluster3=srt(idx==3);
    cluster4=srt(idx==4);

    if isempty(cluster1)==1 || isempty(cluster2)==1 || isempty(cluster3)==1 || isempty(cluster4)==1
        continue
    end
    % cluster = cluster1;
    % nbins=round(sqrt(length(cluster)));
    n_range=(max(srt)-min(srt))/500;
    range_pdf=min(srt):n_range:max(srt);

    %CDF de los datos SRT
    f1=figure;
    [h]=histogram(srt, 'Normalization', 'cdf');
    cdf_srt = h.Values;
    cdf_srt(end+1)=1;
    range_cdf = h.BinEdges;
    close(f1)

    try
        pd1=fitdist(cluster1, 'Stable');
        range1=min(cluster1):max(cluster1);
        xPdf1=pdf(pd1, range_pdf);
        xCdf1=cdf(pd1,range_cdf);
        pd2=fitdist(cluster2, 'Stable');
        range2=min(cluster2):max(cluster2);
        xPdf2=pdf(pd2, range_pdf);
        xCdf2=cdf(pd2,range_cdf);
        pd3=fitdist(cluster3, 'Stable');
        range3=min(cluster3):max(cluster3);
        xPdf3=pdf(pd3, range_pdf);
        xCdf3=cdf(pd3,range_cdf);
        pd4=fitdist(cluster4, 'Stable');
        range4=min(cluster4):max(cluster4);
        xPdf4=pdf(pd4, range_pdf);
        xCdf4=cdf(pd4,range_cdf);
    catch
        continue
    end

    a1=length(cluster1)/length(srt);
    a2=length(cluster2)/length(srt);
    a3=length(cluster3)/length(srt);
    a4=length(cluster4)/length(srt);

    pdf_combi{i}=a1*xPdf1+a2*xPdf2+a3*xPdf3+a4*xPdf4;
    cdf_combi{i}=a1*xCdf1+a2*xCdf2+a3*xCdf3+a4*xCdf4;

    %Método KOLMOGOROV SMIRNOV
    sub_cdf=abs(cdf_srt-cdf_combi{i});
    dist_kolm(i)=max(sub_cdf);
end

%Nos quedamos con la combinación que devuelva la mínima distancia
[value_min,index_min]=min(dist_kolm);
centros_opt=cell_maximos{index_min};
pdf_opt=pdf_combi{index_min};
cdf_opt=cdf_combi{index_min};

end

function cell_maximos=combi_maximos(maximos)
cell_maximos={};
maximos_aux=zeros(1,length(maximos));
count=1;

for i=-2:2
    maximos_aux(1)=maximos(1)+i;
    for j=-2:2
        maximos_aux(2)=maximos(2)+j;
        for k=-2:2
            maximos_aux(3)=maximos(3)+k;
            for l=-2:2
                maximos_aux(4)=maximos(4)+l;
                cell_maximos{count}=maximos_aux;
                count=count+1;
            end
        end
    end
end

end



%     figure
    %     hold on
    %     histogram(srt, 'Normalization', 'pdf')
    %     plot(range_pdf,pdf_combi, 'LineWidth', 2)
    %     yyaxis right
    %     plot(range_cdf,cdf_combi,'LineWidth', 2) %CDF
    %     ylabel('cdf')
    %     title('PDFs y CDF')
    %     legend('PDF original', 'PDF fit', 'CDF fit')
    % 
    %     figure
    %     hold on
    %     plot(range_cdf,cdf_combi, 'LineWidth', 2)
    %     plot(range_cdf,cdf_srt,'LineWidth', 2)
    %     % plot(x_cdf,val_cdf,'LineWidth', 2) %CDF
    %     ylabel('cdf')
    %     legend('Cdf fit', 'Cdf original')
    %     title('Comparativa CDFs')
    % 
    %     figure
    %     hold on
    %     plot(range_pdf, xPdf1, 'LineWidth', 2);
    %     ylabel('pdf')
    %     yyaxis right
    %     plot(range_cdf, xCdf1, 'LineWidth', 2);
    %     ylabel('cdf')
    %     title('Cluster 1')
    % 
    %     figure
    %     hold on
    %     plot(range_pdf, xPdf2, 'LineWidth', 2);
    %     ylabel('pdf')
    %     yyaxis right
    %     plot(range_cdf, xCdf2, 'LineWidth', 2);
    %     ylabel('cdf')
    %     title('Cluster 2')
    % 
    %     figure
    %     hold on
    %     plot(range_pdf, xPdf3, 'LineWidth', 2);
    %     ylabel('pdf')
    %     yyaxis right
    %     plot(range_cdf, xCdf3, 'LineWidth', 2);
    %     ylabel('cdf')
    %     title('Cluster 3')















