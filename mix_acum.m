function [srt_val_prctg] = values_prctgs(srt, maximos)
    
    maximos = [maximos{1}];
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
    
    unicos1 = unique(cluster1');
    unicos2 = unique(cluster2');
    unicos3 = unique(cluster3');
    unicos4 = unique(cluster4');

    n_range=(max(srt)-min(srt))/500;
    range_pdf=min(srt):n_range:max(srt);

    %CDF de los datos SRT
    f1=figure;
    [h]=histogram(srt, 'Normalization', 'cdf');
    cdf_srt = h.Values;
    cdf_srt(end+1)=1;
    range_cdf = h.BinEdges;
    close(f1)
    
    srt_val_prctg = {};
    count  = 1;
    
    %Combinamos cluster 1 y 2
    for i = 1:length(unicos1)
        idx = idx_original;
        indices_cambio = find(srt == unicos1(i));
        for j=1:length(indices_cambio)
            idx(indices_cambio(j)) = 2;
        end

        cluster1=srt(idx==1);
        cluster2=srt(idx==2);
        
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
        
        valor_pdf1 = xPdf1(unicos1(i));
        valor_pdf2 = xPdf2(unicos1(i));

        prctg_tot = valor_pdf1 + valor_pdf2;
        prctg_pdf1 = valor_pdf1 / prctg_tot;
        prctg_pdf2 = valor_pdf2 / prctg_tot;
        prctgs = [prctg_pdf1 prctg_pdf2];
        srt_val_prctg{1,count} = unicos1(i);
        srt_val_prctg{2,count} = prctgs;
        srt_val_prctg{3,count} = [1 2];
    end
    
    %Combinamos cluster 2 con el 1 y el 3
    for i = 1:length(unicos2)
        idx = idx_original;
        if unicos2(i) > maximos(2)
            indices_cambio = find(srt == unicos2(i));
            for j=1:length(indices_cambio)
                idx(indices_cambio(j)) = 3;
            end

            cluster2=srt(idx==2);
            cluster3=srt(idx==3);

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
            
            valor_pdf2 = xPdf2(unicos2(i));
            valor_pdf3 = xPdf3(unicos2(i));

            prctg_tot = valor_pdf2 + valor_pdf3;
            prctg_pdf2 = valor_pdf2 / prctg_tot;
            prctg_pdf3 = valor_pdf3 / prctg_tot;
            prctgs = [prctg_pdf2 prctg_pdf3];
            srt_val_prctg{1,count} = unicos2(i);
            srt_val_prctg{2,count} = prctgs;
            srt_val_prctg{3,count} = [2 3];
            
        else
            indices_cambio = find(srt == unicos2(i));
            for j=1:length(indices_cambio)
                idx(indices_cambio(j)) = 1;
            end
            
            cluster1=srt(idx==1);
            cluster2=srt(idx==2);

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
            
            valor_pdf1 = xPdf1(unicos2(i));
            valor_pdf2 = xPdf2(unicos2(i));

            prctg_tot = valor_pdf2 + valor_pdf1;
            prctg_pdf2 = valor_pdf2 / prctg_tot;
            prctg_pdf1 = valor_pdf1 / prctg_tot;
            prctgs = [prctg_pdf1 prctg_pdf2];
            srt_val_prctg{1,count} = unicos2(i);
            srt_val_prctg{2,count} = prctgs;
            srt_val_prctg{3,count} = [1 2];
        end
    end
    
    %Combinamos cluster 3 con el 2 y el 4
    for i = 1:length(unicos3)
        idx = idx_original;
        if unicos3(i) > maximos(3)
            indices_cambio = find(srt == unicos3(i));
            for j=1:length(indices_cambio)
                idx(indices_cambio(j)) = 4;
            end

            cluster4=srt(idx==4);
            cluster3=srt(idx==3);

            try
                pd4=fitdist(cluster4, 'Stable');
                xPdf4=pdf(pd4, range_pdf);
                xCdf4=cdf(pd4,range_cdf);
                pd3=fitdist(cluster3, 'Stable');
                xPdf3=pdf(pd3, range_pdf);
                xCdf3=cdf(pd3,range_cdf);
            catch
                continue
            end
            
            valor_pdf4 = xPdf4(unicos3(i));
            valor_pdf3 = xPdf3(unicos3(i));

            prctg_tot = valor_pdf4 + valor_pdf3;
            prctg_pdf4 = valor_pdf4 / prctg_tot;
            prctg_pdf3 = valor_pdf3 / prctg_tot;
            prctgs = [prctg_pdf3 prctg_pdf4];
            srt_val_prctg{1,count} = unicos3(i);
            srt_val_prctg{2,count} = prctgs;
            srt_val_prctg{3,count} = [3 4];
            
        else
            indices_cambio = find(srt == unicos3(i));
            for j=1:length(indices_cambio)
                idx(indices_cambio(j)) = 2;
            end
            
            cluster3=srt(idx==3);
            cluster2=srt(idx==2);

            try
                pd3=fitdist(cluster3, 'Stable');
                xPdf3=pdf(pd3, range_pdf);
                xCdf3=cdf(pd3,range_cdf);
                pd2=fitdist(cluster2, 'Stable');
                xPdf2=pdf(pd2, range_pdf);
                xCdf2=cdf(pd2,range_cdf);
            catch
                continue
            end
            
            valor_pdf3 = xPdf3(unicos3(i));
            valor_pdf2 = xPdf2(unicos2(i));

            prctg_tot = valor_pdf2 + valor_pdf3;
            prctg_pdf2 = valor_pdf2 / prctg_tot;
            prctg_pdf3 = valor_pdf3 / prctg_tot;
            prctgs = [prctg_pdf2 prctg_pdf3];
            srt_val_prctg{1,count} = unicos3(i);
            srt_val_prctg{2,count} = prctgs;
            srt_val_prctg{3,count} = [2 3];
        end
    end
    
    %Combinamos cluster 4 y 3
    for i = 1:length(unicos4)
        idx = idx_original;
        indices_cambio = find(srt == unicos4(i));
        for j=1:length(indices_cambio)
            idx(indices_cambio(j)) = 3;
        end

        cluster3=srt(idx==3);
        cluster4=srt(idx==4);
        
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
        
        valor_pdf3 = xPdf3(unicos4(i));
        valor_pdf4 = xPdf4(unicos4(i));

        prctg_tot = valor_pdf3 + valor_pdf4;
        prctg_pdf3 = valor_pdf3 / prctg_tot;
        prctg_pdf4 = valor_pdf4 / prctg_tot;
        prctgs = [prctg_pdf3 prctg_pdf4];
        srt_val_prctg{1,count} = unicos4(i);
        srt_val_prctg{2,count} = prctgs;
        srt_val_prctg{3,count} = [3 4];
    end
    
end