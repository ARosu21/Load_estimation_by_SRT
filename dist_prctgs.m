function [idx,pdf_combi,range_pdf,xCdf1,xCdf2,xCdf3,xCdf4,cdf_combi,range_cdf,media1,media2,media3,media4,mean_tot] = dist_prctgs(srt,srt_value_prctg,idx_opt)
    
    idx = zeros(length(idx_opt),1);
    srt_tam = size(srt_value_prctg);
    
    for i=1:srt_tam(2)
        srt_value = srt_value_prctg{1,i};
        prctg = srt_value_prctg{2,i};
        n_srt_value = find(srt == srt_value);
        
        %Elementos en el cluster1 
        n_cluster1 = round(prctg(1) * length(n_srt_value));
        %Elementos en el cluster2 
        n_cluster2 = round(prctg(2) * length(n_srt_value));
        %Elementos en el cluster3 original
        n_cluster3 = round(prctg(3) * length(n_srt_value));
        %Elementos en el cluster4 original
        n_cluster4 = round(prctg(4) * length(n_srt_value));
        
        if n_cluster1+n_cluster2+n_cluster3+n_cluster4 == length(n_srt_value)
            for j = 1:n_cluster1
                idx(n_srt_value(j)) = 1;
            end

            for j = n_cluster1+1:n_cluster1+n_cluster2
                idx(n_srt_value(j)) = 2;
            end

            for j = n_cluster1+n_cluster2+1:n_cluster1+n_cluster2+n_cluster3
                idx(n_srt_value(j)) = 3;
            end

            for j = n_cluster1+n_cluster2+n_cluster3+1:n_cluster1+n_cluster2+n_cluster3+n_cluster4
                idx(n_srt_value(j)) = 4;
            end
        else
            diff = (n_cluster1+n_cluster2+n_cluster3+n_cluster4) - length(n_srt_value);
            
            if diff > 0
                prctg_sorted = sort(prctg);
                
                for k = 1:length(prctg_sorted)
                    [~,prctg_min] = find(prctg == prctg_sorted(k));
                
                    if  prctg_min == 1 && n_cluster1 ~= 0
                       break;
                    elseif prctg_min == 2 && n_cluster2 ~= 0
                        break;
                    elseif prctg_min == 3 && n_cluster3 ~= 0
                        break; 
                    elseif prctg_min == 4 && n_cluster4 ~= 0
                        break;    
                    end
                end
                
                
                switch prctg_min
                    case 1
                        n_cluster1 = n_cluster1 - diff;
                    case 2
                        n_cluster2 = n_cluster2 - diff; 
                    case 3
                        n_cluster3 = n_cluster3 - diff;  
                    case 4
                        n_cluster4 = n_cluster4 - diff;    
                end
            else
                prctg_sorted = sort(prctg, 'descend');
                [~,sec_max] = find(prctg == prctg_sorted(2));
                
                switch sec_max
                    case 1
                        n_cluster1 = n_cluster1 - diff;
                    case 2
                        n_cluster2 = n_cluster2 - diff; 
                    case 3
                        n_cluster3 = n_cluster3 - diff;  
                    case 4
                        n_cluster4 = n_cluster4 - diff;    
                end
            end
            
            for j = 1:n_cluster1
                idx(n_srt_value(j)) = 1;
            end

            for j = n_cluster1+1:n_cluster1+n_cluster2
                idx(n_srt_value(j)) = 2;
            end

            for j = n_cluster1+n_cluster2+1:n_cluster1+n_cluster2+n_cluster3
                idx(n_srt_value(j)) = 3;
            end

            for j = n_cluster1+n_cluster2+n_cluster3+1:n_cluster1+n_cluster2+n_cluster3+n_cluster4
                idx(n_srt_value(j)) = 4;
            end
        end
    end
    
    cluster1=srt(idx==1);
    cluster2=srt(idx==2);
    cluster3=srt(idx==3);
    cluster4=srt(idx==4);
    
    n_range=(max(srt)-min(srt))/500;
    range_pdf=min(srt):n_range:max(srt);

    %CDF de los datos SRT
    f1=figure;
    [h]=histogram(srt, 'Normalization', 'cdf');
    cdf_srt = h.Values;
    cdf_srt(end+1)=1;
    range_cdf = h.BinEdges;
    close(f1)
    
    %Rango para representar las cdf
    n_range=(max(range_cdf)-min(range_cdf))/500;
    range_cdf=min(range_cdf):n_range:max(range_cdf);
    
    pd1=fitdist(cluster1, 'Stable');
    xPdf1=pdf(pd1, range_pdf);
    xCdf1=cdf(pd1,range_cdf);
    pd2=fitdist(cluster2, 'Stable');
    xPdf2=pdf(pd2, range_pdf);
    xCdf2=cdf(pd2,range_cdf);
    try
        pd3=fitdist(cluster3, 'Stable');
        xPdf3=pdf(pd3, range_pdf);
        xCdf3=cdf(pd3,range_cdf);
    catch
        xPdf3=0;
        xCdf3=0;
    end

    try
        pd4=fitdist(cluster4, 'Stable');
        xPdf4=pdf(pd4, range_pdf);
        xCdf4=cdf(pd4,range_cdf);
    catch
        xPdf4=0;
        xCdf4=0;
    end
    a1=length(cluster1)/length(srt);
    a2=length(cluster2)/length(srt);
    a3=length(cluster3)/length(srt);
    a4=length(cluster4)/length(srt);

    pdf_combi = a1*xPdf1+a2*xPdf2+a3*xPdf3+a4*xPdf4;
    cdf_combi = a1*xCdf1+a2*xCdf2+a3*xCdf3+a4*xCdf4;
    
    f1=figure;
    plot(range_pdf, pdf_combi)
    close(f1)
    
    %Calculamos la media de cada distribución y la multiplicamos por su
    %factor para obtener la media de toda la distribución
    mean1 = mean(pd1)*a1;
    media1 = mean(pd1);
    if isnan(mean1)
        mean1 = mean(cluster1)*a1;
        media1 = mean(pd1);
    end
    mean2 = mean(pd2)*a2;
    media2 = mean(pd2);
    if isnan(mean2)
        mean2 = mean(cluster2)*a2;
        media2 = mean(pd2);
    end
    if xPdf3 == 0
        mean3 = 0;
        media3 = 0;
    else
        mean3 = mean(pd3)*a3;
        media3 = mean(pd3);
    end
    if isnan(mean3)
        mean3 = mean(cluster3)*a3;
        media3 = mean(pd3);
    end
    if xPdf4 == 0
        mean4 = 0;
        media4 = 0;
    else
        mean4 = mean(pd4)*a4;
        media4 = mean(pd4);
    end
    if isnan(mean4)
        mean4 = mean(cluster4)*a4;
        media4 = mean(cluster4);
    end
    mean_tot = mean1+mean2+mean3+mean4;
end

%         random_value = rand;
%         if random_value <= prctg(1)
%             indices_cambio = find(srt == srt_value);
%             for j=1:length(indices_cambio)
%                 idx(indices_cambio(j)) = clusters(1);
%             end
%         elseif random_value > prctg(1) && random_value <= prctg(1) + prctg(2)  
%             indices_cambio = find(srt == srt_value);
%             for j=1:length(indices_cambio)
%                 idx(indices_cambio(j)) = clusters(2);
%             end
%         elseif random_value > prctg(1) + prctg(2) && random_value <= prctg(1) + prctg(2) + prctg(3) 
%             indices_cambio = find(srt == srt_value);
%             for j=1:length(indices_cambio)
%                 idx(indices_cambio(j)) = clusters(3);
%             end
%         elseif random_value > prctg(1) + prctg(2) + prctg(3)
%             indices_cambio = find(srt == srt_value);
%             for j=1:length(indices_cambio)
%                 idx(indices_cambio(j)) = clusters(4);
%             end
%         end
