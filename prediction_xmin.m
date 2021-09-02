function [carga_realxm,media_testxm,media_optxm,media_opt_prctgxm,percentil_90_testxm,...
    percentil_90_optxm,percentil_90_opt_prctgxm,percentil_95_testxm,percentil_95_optxm,...
    percentil_95_opt_prctgxm,percentil_99_testxm,percentil_99_optxm,percentil_99_opt_prctgxm,pred_mediaxm,...
    pred_mediaxm_p,pred_mediaxm_n,pred_mediaxm_mix_opt,pred_mediaxm_mix_opt_prctg,pred_99xm,pred_99xm_p,pred_99xm_n,...
    pred_99xm_mix_opt,pred_99xm_mix_opt_prctg,pred_95xm,pred_95xm_p,pred_95xm_n,pred_95xm_mix_opt,pred_95xm_mix_opt_prctg,pred_90xm,pred_90xm_p,pred_90xm_n,pred_90xm_mix_opt,pred_90xm_mix_opt_prctg, ...
    pred_50xm,pred_50xm_mix_opt,pred_50xm_mix_opt_prctg]= prediction_xmin(centros_opt,srt_testxm,carga_testxm,pmedia_3,pmedia_3_mix_opt,pmedia_3_mix_opt_prctg,p99_3,p99_3_mix_opt,p99_3_mix_opt_prctg,p95_3,p95_3_mix_opt,p95_3_mix_opt_prctg,...
    p90_3,p90_3_mix_opt,p90_3_mix_opt_prctg,p50_3,p50_3_mix_opt,p50_3_mix_opt_prctg)
%Variables
media_testxm=zeros(1,21);
percentil_99_testxm=zeros(1,21);
percentil_95_testxm=zeros(1,21);
percentil_90_testxm=zeros(1,21);
media_optxm=zeros(1,21);
percentil_99_optxm=zeros(1,21);
percentil_95_optxm=zeros(1,21);
percentil_90_optxm=zeros(1,21);
media_opt_prctgxm=zeros(1,21);
percentil_99_opt_prctgxm=zeros(1,21);
percentil_95_opt_prctgxm=zeros(1,21);
percentil_90_opt_prctgxm=zeros(1,21);
media_testxm_p=zeros(1,21);
percentil_99_testxm_p=zeros(1,21);
percentil_95_testxm_p=zeros(1,21);
percentil_90_testxm_p=zeros(1,21);
media_testxm_n=zeros(1,21);
percentil_99_testxm_n=zeros(1,21);
percentil_95_testxm_n=zeros(1,21);
percentil_90_testxm_n=zeros(1,21);

pred_mediaxm=zeros(1,21);
pred_mediaxm_mix_opt=zeros(1,21);
pred_mediaxm_mix_opt_prctg=zeros(1,21);
pred_mediaxm_p=zeros(1,21);
pred_mediaxm_n=zeros(1,21);
pred_99xm=zeros(1,21);
pred_99xm_mix_opt=zeros(1,21);
pred_99xm_mix_opt_prctg=zeros(1,21);
pred_99xm_p=zeros(1,21);
pred_99xm_n=zeros(1,21);
pred_95xm=zeros(1,21);
pred_95xm_mix_opt=zeros(1,21);
pred_95xm_mix_opt_prctg=zeros(1,21);
pred_95xm_p=zeros(1,21);
pred_95xm_n=zeros(1,21);
pred_90xm=zeros(1,21);
pred_90xm_mix_opt=zeros(1,21);
pred_90xm_mix_opt_prctg=zeros(1,21);
pred_90xm_p=zeros(1,21);
pred_90xm_n=zeros(1,21);

carga_realxm=[carga_testxm{2,:}];

for n_test=1:length(srt_testxm)
    
    percentil_50_testxm(n_test) = prctile(srt_testxm{2,n_test},50);
    percentil_90_testxm(n_test) = prctile(srt_testxm{2,n_test},90);
    percentil_95_testxm(n_test) = prctile(srt_testxm{2,n_test},95);
    percentil_99_testxm(n_test) = prctile(srt_testxm{2,n_test},99);
    media_testxm(n_test) = mean(srt_testxm{2,n_test});
    
    percentil_95_testxm_p(n_test)=percentil_95_testxm(n_test)+0.5;
    percentil_99_testxm_p(n_test)=percentil_99_testxm(n_test)+0.5;
    percentil_90_testxm_p(n_test)=percentil_90_testxm(n_test)+0.5;
    media_testxm_p(n_test)=media_testxm(n_test)+0.5;
    
    percentil_95_testxm_n(n_test)=percentil_95_testxm(n_test)-0.5;
    percentil_99_testxm_n(n_test)=percentil_99_testxm(n_test)-0.5;
    percentil_90_testxm_n(n_test)=percentil_90_testxm(n_test)-0.5;
    media_testxm_n(n_test)=media_testxm(n_test)-0.5;
    
    %Prediccion media
    pred_mediaxm(n_test)= polyval(pmedia_3,media_testxm(n_test));
    pred_mediaxm_p(n_test)= polyval(pmedia_3,media_testxm_p(n_test));
    pred_mediaxm_n(n_test)= polyval(pmedia_3,media_testxm_n(n_test));
    %Prediccion carga percentil 50 
    pred_50xm(n_test)= polyval(p50_3,percentil_50_testxm(n_test));
    %Prediccion carga percentil 99
    pred_99xm(n_test)= polyval(p99_3,percentil_99_testxm(n_test));
    pred_99xm_p(n_test)= polyval(p99_3,percentil_99_testxm_p(n_test));
    pred_99xm_n(n_test)= polyval(p99_3,percentil_99_testxm_n(n_test));
    %Prediccion carga percentil 95
    pred_95xm(n_test)= polyval(p95_3,percentil_95_testxm(n_test));
    pred_95xm_p(n_test)= polyval(p95_3,percentil_95_testxm_p(n_test));
    pred_95xm_n(n_test)= polyval(p95_3,percentil_95_testxm_n(n_test));
    %Prediccion carga percentil 90
    pred_90xm(n_test)= polyval(p90_3,percentil_90_testxm(n_test));
    pred_90xm_p(n_test)= polyval(p90_3,percentil_90_testxm_p(n_test));
    pred_90xm_n(n_test)= polyval(p90_3,percentil_90_testxm_n(n_test));
    
end

%Obtenemos las mixturas principales 
for n_test=1:length(srt_testxm)
    
    f1=figure;
    h=histogram(srt_testxm{2,n_test}, 'Normalization', 'cdf');
    cdf_srtxm = h.Values;
    cdf_srtxm(end+1)=1;
    range_cdf_srtxm = h.BinEdges;
    close(f1)
    
    %Find value when cdf is 0.999
    cdf_value=0.999;
    [val_cdf,idx_cdf]=min(abs(cdf_srtxm-cdf_value));
    interval_cdf=range_cdf_srtxm(idx_cdf);
    
%     [centros_optxm{n_test}, umbralesxm{n_test}] = get_centers(srt_testxm{2,n_test},interval_cdf);
    
    [pdf_combi_optxm{n_test},range_pdf_optxm{n_test},cdf_optxm_1{n_test},cdf_optxm_2{n_test},cdf_optxm_3{n_test},cdf_optxm_4{n_test},cdf_combi_optxm{n_test},range_cdf_optxm{n_test},idx_optxm{n_test},media_optxm_1(n_test),media_optxm_2(n_test),media_optxm_3(n_test),media_optxm_4(n_test),media_optxm(n_test)] = dist_opt(0,srt_testxm{2,n_test},centros_opt{n_test},0);
    [srt_value_prctgxm{n_test}] = values_prctgs(srt_testxm{2,n_test}, idx_optxm{n_test});
    [idx_opt_prctgxm{n_test},pdf_combi_prctgxm{n_test},range_pdf_prctgxm{n_test},cdf_combi_prctgxm_1{n_test},cdf_combi_prctgxm_2{n_test},cdf_combi_prctgxm_3{n_test},cdf_combi_prctgxm_4{n_test},cdf_combi_prctgxm{n_test},range_cdf_prctgxm{n_test},media_opt_prctgxm_1(n_test),media_opt_prctgxm_2(n_test),media_opt_prctgxm_3(n_test),media_opt_prctgxm_4(n_test),media_opt_prctgxm(n_test)] = dist_prctgs(srt_testxm{2,n_test},srt_value_prctgxm{n_test},idx_optxm{n_test});
    %Iteración extra
    [pdf_combi_optxm{n_test},range_pdf_optxm{n_test},cdf_optxm_1{n_test},cdf_optxm_2{n_test},cdf_optxm_3{n_test},cdf_optxm_4{n_test},cdf_combi_optxm{n_test},range_cdf_optxm{n_test},idx_optxm{n_test},media_optxm_1(n_test),media_optxm_2(n_test),media_optxm_3(n_test),media_optxm_4(n_test),media_optxm(n_test)] = dist_opt(1,srt_testxm{2,n_test},centros_opt{n_test},idx_opt_prctgxm{n_test});
    [srt_value_prctgxm{n_test}] = values_prctgs(srt_testxm{2,n_test}, idx_optxm{n_test});
    [idx_opt_prctgxm{n_test},pdf_combi_prctgxm{n_test},range_pdf_prctgxm{n_test},cdf_combi_prctgxm_1{n_test},cdf_combi_prctgxm_2{n_test},cdf_combi_prctgxm_3{n_test},cdf_combi_prctgxm_4{n_test},cdf_combi_prctgxm{n_test},range_cdf_prctgxm{n_test},media_opt_prctgxm_1(n_test),media_opt_prctgxm_2(n_test),media_opt_prctgxm_3(n_test),media_opt_prctgxm_4(n_test),media_opt_prctgxm(n_test)] = dist_prctgs(srt_testxm{2,n_test},srt_value_prctgxm{n_test},idx_optxm{n_test});

    %Percentil 50 de la distribucion óptima
    [~, closest_cdf_opt] = min(abs(cdf_combi_optxm{n_test}-0.50));
    percentil_50_optxm(n_test) = range_cdf_optxm{n_test}(closest_cdf_opt);
    
    %Percentil 90 de la distribucion óptima
    [~, closest_cdf_opt] = min(abs(cdf_combi_optxm{n_test}-0.90));
    percentil_90_optxm(n_test) = range_cdf_optxm{n_test}(closest_cdf_opt);
    
    %Percentil 95 de la distribucion óptima
    [~, closest_cdf_opt] = min(abs(cdf_combi_optxm{n_test}-0.95));
    percentil_95_optxm(n_test) = range_cdf_optxm{n_test}(closest_cdf_opt);
    
    %Percentil 99 de la distribucion óptima
    [~, closest_cdf_opt] = min(abs(cdf_combi_optxm{n_test}-0.99));
    percentil_99_optxm(n_test) = range_cdf_optxm{n_test}(closest_cdf_opt);
    
    %Predicciones para la mixtura óptima
    pred_mediaxm_mix_opt(n_test)= polyval(pmedia_3_mix_opt,media_optxm(n_test));
    %Prediccion carga percentil 50 mixtura óptima
    pred_50xm_mix_opt(n_test)= polyval(p50_3_mix_opt,percentil_50_optxm(n_test));
    %Prediccion carga percentil 90 mixtura óptima
    pred_90xm_mix_opt(n_test)= polyval(p90_3_mix_opt,percentil_90_optxm(n_test));
    %Prediccion carga percentil 95 mixtura óptima
    pred_95xm_mix_opt(n_test)= polyval(p95_3_mix_opt,percentil_95_optxm(n_test));
    %Prediccion carga percentil 99 mixtura óptima
    pred_99xm_mix_opt(n_test)= polyval(p99_3_mix_opt,percentil_99_optxm(n_test));
    
    %Percentil 50 de la distribucion óptima con porcentajes
    [~, closest_cdf_opt_prctg] = min(abs(cdf_combi_prctgxm{n_test}-0.50));
    percentil_50_opt_prctgxm(n_test) = range_cdf_prctgxm{n_test}(closest_cdf_opt_prctg);
    
    %Percentil 90 de la distribucion óptima con porcentajes
    [~, closest_cdf_opt_prctg] = min(abs(cdf_combi_prctgxm{n_test}-0.90));
    percentil_90_opt_prctgxm(n_test) = range_cdf_prctgxm{n_test}(closest_cdf_opt_prctg);
    
    %Percentil 95 de la distribucion óptima con porcentajes
    [~, closest_cdf_opt_prctg] = min(abs(cdf_combi_prctgxm{n_test}-0.95));
    percentil_95_opt_prctgxm(n_test) = range_cdf_prctgxm{n_test}(closest_cdf_opt_prctg);
    
    %Percentil 99 de la distribucion óptima con porcentajes
    [~, closest_cdf_opt_prctg] = min(abs(cdf_combi_prctgxm{n_test}-0.99));
    percentil_99_opt_prctgxm(n_test) = range_cdf_prctgxm{n_test}(closest_cdf_opt_prctg);
    
    %Predicciones para la mixtura óptima con porcentajes
    pred_mediaxm_mix_opt_prctg(n_test)= polyval(pmedia_3_mix_opt_prctg,media_opt_prctgxm(n_test));
    %Prediccion carga percentil 50 mixtura óptima con porcentajes
    pred_50xm_mix_opt_prctg(n_test)= polyval(p50_3_mix_opt_prctg,percentil_50_opt_prctgxm(n_test));
    %Prediccion carga percentil 90 mixtura óptima con porcentajes
    pred_90xm_mix_opt_prctg(n_test)= polyval(p90_3_mix_opt_prctg,percentil_90_opt_prctgxm(n_test));
    %Prediccion carga percentil 95 mixtura óptima con porcentajes
    pred_95xm_mix_opt_prctg(n_test)= polyval(p95_3_mix_opt_prctg,percentil_95_opt_prctgxm(n_test));
    %Prediccion carga percentil 99 mixtura óptima con porcentajes
    pred_99xm_mix_opt_prctg(n_test)= polyval(p99_3_mix_opt_prctg,percentil_99_opt_prctgxm(n_test));
    
end

end