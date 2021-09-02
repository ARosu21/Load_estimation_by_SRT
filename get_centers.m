function [centros_opt, umbrales] = get_centers(srt,interval_cdf)

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
        break;
    end
    
    if length(maximos_loc) > 1 && abs(f(indices_maximos(end))-f(indices_maximos(end-1))) < prctg_max && abs(xi(indices_maximos(end))-xi(indices_maximos(end-1))) < 8
        if f(indices_maximos(end)) < f(indices_maximos(end-1)) && abs(f(indices_maximos(end)) - f(indices_maximos(end-1))) > 0.0001
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
centros_opt = maximos_loc;

f1=figure();
hold on 
histogram(srt, 'Normalization', 'pdf')
xline(centros_opt(1),'--r','Center 1')
xline(centros_opt(2),'--r','Center 2')
xline(centros_opt(3),'--r','Center 3')
xline(centros_opt(4),'--r','Center 4')
close(f1);

umbrales_aux1 = {};
umbrales_aux2 = {};
umbrales_aux3 = {};
count1 = 1;
count2 = 1;
count3 = 1;

for i = 1:length(minimos_loc)
    if minimos_loc(i) > maximos_loc(1) && minimos_loc(i) < maximos_loc(2)
        index = find(xi == minimos_loc(i));
        umbrales_aux1{1,count1} = minimos_loc(i);
        umbrales_aux1{2,count1} = f(index);
        count1 = count1 + 1;
    elseif minimos_loc(i) > maximos_loc(2) && minimos_loc(i) < maximos_loc(3)
        index = find(xi == minimos_loc(i));
        umbrales_aux2{1,count2} = minimos_loc(i);
        umbrales_aux2{2,count2} = f(index);
        count2 = count2 + 1;
    elseif minimos_loc(i) > maximos_loc(3) && minimos_loc(i) < maximos_loc(4)
        index = find(xi == minimos_loc(i));
        umbrales_aux3{1,count3} = minimos_loc(i);
        umbrales_aux3{2,count3} = f(index);
        count3 = count3 + 1;
    end
end

[~,index_min1] = min([umbrales_aux1{2,:}]);
umbral_1 = umbrales_aux1{1, index_min1};
[~,index_min2] = min([umbrales_aux2{2,:}]);
umbral_2 = umbrales_aux2{1, index_min2};
[~,index_min3] = min([umbrales_aux3{2,:}]);
umbral_3 = umbrales_aux3{1, index_min3};

umbrales = [umbral_1 umbral_2 umbral_3];
end














