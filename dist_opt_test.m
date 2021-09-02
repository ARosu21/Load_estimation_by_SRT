function [pdf_combi,range_pdf,xCdf1,xCdf2,xCdf3,xCdf4,cdf_combi,range_cdf,idx_original,media1,media2,media3,media4,mean_tot] = dist_opt_test(rep,srt,maximos,idx_ref)
    
    if rep == 0
        d1=sqrt((srt-maximos(1)).^2);
        d2=sqrt((srt-maximos(2)).^2);
        d3=sqrt((srt-maximos(3)).^2);
        d4=sqrt((srt-maximos(4)).^2);
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
    else
        idx = idx_ref;
    end
    
    %Asignamos los índices a cada cluster
    idx_original = idx;
    cluster1=srt(idx==1);
    cluster2=srt(idx==2);
    cluster3=srt(idx==3);
    cluster4=srt(idx==4);
    
    %Ordenamos los valores
    cluster1=sort(cluster1);
    cluster2=sort(cluster2);
    cluster3=sort(cluster3);
    cluster4=sort(cluster4);
    
    %Sacamos los valores únicos para ir viendo caso a caso
    unicos1 = unique(cluster1');
    unicos2 = unique(cluster2');
    unicos3 = unique(cluster3');
    unicos4 = unique(cluster4');
    unicos = [unicos1 unicos2 unicos3 unicos4];
    
    %Rango para representar las pdf
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
    
    %Cell de las distribuciones optimas del primer cluster
    optim_1 = {};
    count = 1;
    
    for i = 1:length(unicos)
        if unicos(i) < maximos(2)
            idx = idx_original;
            indices_cambio = find(srt <= unicos(i));
            indices_cambio1 = find((srt <= maximos(2) & srt > unicos(i)));
            
            for j=1:length(indices_cambio1)
                idx(indices_cambio1(j)) = 2;
            end
            
            for j=1:length(indices_cambio)
                idx(indices_cambio(j)) = 1;
            end
            
            cluster1 = srt(idx==1);
            cluster2 = srt(idx==2);
            
            try
                pd1=fitdist(cluster1, 'Stable');
                xPdf1=pdf(pd1, range_pdf);
                xCdf1=cdf(pd1,range_cdf);

                pd2=fitdist(cluster2, 'Stable');
                xPdf2=pdf(pd2, range_pdf);
                xCdf2=cdf(pd2,range_cdf);
            catch
                continue
            end
            
            if maximos(1) - 0.5 < pd1.delta && pd1.delta < maximos(1) + 0.5
                
                optim_1{1, count} = abs(maximos(1)-pd1.delta);
                optim_1{2, count} = idx;
                
                count = count + 1;
            end
        end
    end
    
    if isempty(optim_1) ~= 1
        dist_min = [optim_1{1,:}];
        [~,idx_min] = min(dist_min);
        idx_original = optim_1{2,idx_min};
    end
    
    %Cell de las distribuciones optimas del segundo cluster
    optim_2 = {};
    count = 1;
    
    for i = 1:length(unicos)
        if unicos(i) >= maximos(2) && unicos(i) < maximos(3)
            idx = idx_original;
            indices_cambio = find(srt <= unicos(i) & srt >= maximos(2));
            indices_cambio1 = find((srt <= maximos(3) & srt > unicos(i)));
            
            for j=1:length(indices_cambio1)
                idx(indices_cambio1(j)) = 3;
            end
            
            for j=1:length(indices_cambio)
                idx(indices_cambio(j)) = 2;
            end
            
            cluster2 = srt(idx==2);
            cluster3 = srt(idx==3);
            
            try
                pd2=fitdist(cluster2, 'Stable');
                xPdf2=pdf(pd2, range_pdf);
                xCdf2=cdf(pd2,range_cdf);

                pd3=fitdist(cluster3, 'Stable');
                xPdf3=pdf(pd3, range_pdf);
                xCdf3=cdf(pd3,range_cdf);
            catch
                continue
            end
            
            if maximos(2) - 0.5 < pd2.delta && pd2.delta < maximos(2) + 0.5
                
                optim_2{1, count} = abs(maximos(2)-pd2.delta);
                optim_2{2, count} = idx;
                
                count = count + 1;
            end
        end
    end
    
    if isempty(optim_2) ~= 1
        dist_min = [optim_2{1,:}];
        [~,idx_min] = min(dist_min);
        idx_original = optim_2{2,idx_min};
    end
    
    %Cell de las distribuciones optimas del tercer cluster
    optim_3 = {};
    count = 1;
    
    for i = 1:length(unicos)
        if unicos(i) >= maximos(3) && unicos(i) < maximos(4)
            idx = idx_original;
            indices_cambio = find(srt <= unicos(i) & srt >= maximos(3));
            indices_cambio1 = find((srt <= maximos(4) & srt > unicos(i)));
            
            for j=1:length(indices_cambio1)
                idx(indices_cambio1(j)) = 4;
            end
            
            for j=1:length(indices_cambio)
                idx(indices_cambio(j)) = 3;
            end
            
            cluster3 = srt(idx==3);
            cluster4 = srt(idx==4);
            
            try
                pd3=fitdist(cluster3, 'Stable');
                xPdf3=pdf(pd3, range_pdf);
                xCdf3=cdf(pd3,range_cdf);

                pd4=fitdist(cluster4, 'Stable');
                xPdf4=pdf(pd4, range_pdf);
                xCdf4=cdf(pd4,range_cdf);
            catch
                continue
            end
            
            if maximos(3) - 0.5 < pd3.delta && pd3.delta < maximos(3) + 0.5
                
                optim_3{1, count} = abs(maximos(3)-pd3.delta);
                optim_3{2, count} = idx;
                
                count = count + 1;
            end
        end
    end
    
    if isempty(optim_3) ~= 1
        dist_min = [optim_3{1,:}];
        [~,idx_min] = min(dist_min);
        idx_original = optim_3{2,idx_min};
    end
    
    
    %Cell de las distribuciones optimas del cuarto cluster
    optim_4 = {};
    count = 1;
    
    for i = 1:length(unicos)
        if unicos(i) > maximos(3)
            idx = idx_original;
            indices_cambio = find(srt >= unicos(i));
            indices_cambio1 = find((srt >= maximos(3) & srt < unicos(i)));
            
            for j=1:length(indices_cambio1)
                idx(indices_cambio1(j)) = 3;
            end
            
            for j=1:length(indices_cambio)
                idx(indices_cambio(j)) = 4;
            end
            
            cluster3 = srt(idx==3);
            cluster4 = srt(idx==4);
            
            try
                pd3=fitdist(cluster3, 'Stable');
                xPdf3=pdf(pd3, range_pdf);
                xCdf3=cdf(pd3,range_cdf);

                pd4=fitdist(cluster4, 'Stable');
                xPdf4=pdf(pd4, range_pdf);
                xCdf4=cdf(pd4,range_cdf);
            catch
                continue
            end
            
            if maximos(4) - 0.5 < pd4.delta && pd4.delta < maximos(4) + 0.5
               
                optim_4{1, count} = abs(maximos(4)-pd4.delta);
                optim_4{2, count} = idx;
                
                count = count + 1;
            end
        end
    end
    
    if isempty(optim_4) ~= 1
        dist_min = [optim_4{1,:}];
        [~,idx_min] = min(dist_min);
        idx_original = optim_4{2,idx_min};
    end
    
    cluster1 = srt(idx_original==1);
    cluster2 = srt(idx_original==2);
    cluster3 = srt(idx_original==3);
    cluster4 = srt(idx_original==4);

    pd1=fitdist(cluster1, 'Stable');
    xPdf1=pdf(pd1, range_pdf);
    xCdf1=cdf(pd1,range_cdf);

    pd2=fitdist(cluster2, 'Stable');
    xPdf2=pdf(pd2, range_pdf);
    xCdf2=cdf(pd2,range_cdf);

    pd3=fitdist(cluster3, 'Stable');
    xPdf3=pdf(pd3, range_pdf);
    xCdf3=cdf(pd3,range_cdf);
    
    try
        pd4=fitdist(cluster4, 'Stable');
        xPdf4=pdf(pd4, range_pdf);
        xCdf4=cdf(pd4,range_cdf);
    catch
        xPdf4=0;
        xCdf4=0;
    end
    
    f1=figure;
    hold on
    plot(range_pdf, xPdf1)
    plot(range_pdf, xPdf2)
    plot(range_pdf, xPdf3)
    plot(range_pdf, xPdf4)
    close(f1)
    
    a1=length(cluster1)/length(srt);
    a2=length(cluster2)/length(srt);
    a3=length(cluster3)/length(srt);
    a4=length(cluster4)/length(srt);

    pdf_combi=a1*xPdf1+a2*xPdf2+a3*xPdf3+a4*xPdf4;
    cdf_combi=a1*xCdf1+a2*xCdf2+a3*xCdf3+a4*xCdf4;
    
    f1=figure;
    hold on
    plot(range_pdf, pdf_combi)
    close(f1)
    
    %Calculamos la media de cada distribución y la multiplicamos por su
    %factor para obtener la media de toda la distribución
    mean1 = mean(pd1)*a1;
    media1 = mean(pd1);
    if isnan(mean1)
        mean1 = 0;
        media1 = 0;
    end
    mean2 = mean(pd2)*a2;
    media2 = mean(pd2);
    if isnan(mean2)
        mean2 = 0; 
        media2 = 0;
    end
    mean3 = mean(pd3)*a3;
    media3 = mean(pd3);
    if isnan(mean3)
        mean3 = 0; 
        media3 = 0;
    end
    mean4 = mean(pd4)*a4;
    media4 = mean(pd4);
    if isnan(mean4)
        mean4 = 0; 
        media4 = 0;
    end
    mean_tot = mean1+mean2+mean3+mean4;
end

