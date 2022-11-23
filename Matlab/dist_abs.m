function [pdf_combi,range_pdf,cdf_combi,range_cdf] = dist_abs(srt,maximos_loc)
    
    maximos_loc=maximos_loc{1};
    
    d1=abs(srt-maximos_loc(1));
    d2=abs(srt-maximos_loc(2));
    d3=abs(srt-maximos_loc(3));
    d4=abs(srt-maximos_loc(4));
    idx=zeros(length(srt),1);
    
    for j=1:length(srt)
        d_min=[d1(j) d2(j) d3(j) d4(j)];
        [~,I]=min(d_min);

        if  I == 1
            idx(j)=1;
        elseif I == 2
            idx(j)=2;
        elseif I == 3
            idx(j)=3;
        else
            idx(j)=4;
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
    range_cdf = h.BinEdges;
    close(f1)
    
    pd1=fitdist(cluster1, 'Stable');
    xPdf1=pdf(pd1, range_pdf);
    xCdf1=cdf(pd1,range_cdf);
    
    pd2=fitdist(cluster2, 'Stable');
    xPdf2=pdf(pd2, range_pdf);
    xCdf2=cdf(pd2,range_cdf);
    
    pd3=fitdist(cluster3, 'Stable');
    xPdf3=pdf(pd3, range_pdf);
    xCdf3=cdf(pd3,range_cdf);
    
    pd4=fitdist(cluster4, 'Stable');
    xPdf4=pdf(pd4, range_pdf);
    xCdf4=cdf(pd4,range_cdf);
    
    a1=length(cluster1)/length(srt);
    a2=length(cluster2)/length(srt);
    a3=length(cluster3)/length(srt);
    a4=length(cluster4)/length(srt);

    pdf_combi=a1*xPdf1+a2*xPdf2+a3*xPdf3+a4*xPdf4;
    cdf_combi=a1*xCdf1+a2*xCdf2+a3*xCdf3+a4*xCdf4;
    
    f1=figure;
    plot(range_pdf, pdf_combi)
    close(f1)
end

