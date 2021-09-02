function draw_predictions(mixtura,minuto,carga_realxm,media_testxm,media_optxm,media_opt_prctgxm,...
    pred_mediaxm,pred_mediaxm_mix_opt,pred_mediaxm_mix_opt_prctg,pmedia_3,pmedia_3_mix_opt,pmedia_3_mix_opt_prctg,percentil_90_testxm,...
    percentil_90_optxm,percentil_90_opt_prctgxm,pred_90xm,pred_90xm_mix_opt,pred_90xm_mix_opt_prctg,p90_3,p90_3_mix_opt,p90_3_mix_opt_prctg, ...
    percentil_95_testxm,percentil_95_optxm,percentil_95_opt_prctgxm,pred_95xm,pred_95xm_mix_opt,pred_95xm_mix_opt_prctg,...
    p95_3,p95_3_mix_opt,p95_3_mix_opt_prctg,percentil_99_testxm,percentil_99_optxm,percentil_99_opt_prctgxm,pred_99xm,...
    pred_99xm_mix_opt,pred_99xm_mix_opt_prctg,p99_3,p99_3_mix_opt,p99_3_mix_opt_prctg,pred_50xm,pred_50xm_mix_opt,pred_50xm_mix_opt_prctg)
%Variables
% neg_mediaxm=pred_mediaxm-pred_mediaxm_n;
% pos_mediaxm=pred_mediaxm_p-pred_mediaxm;
% neg_90xm=pred_90xm-pred_90xm_n;
% pos_90xm=pred_90xm_p-pred_90xm;
% neg_95xm=pred_95xm-pred_95xm_n;
% pos_95xm=pred_95xm_p-pred_95xm;
% neg_99xm=pred_99xm-pred_99xm_n;
% pos_99xm=pred_99xm_p-pred_99xm;

if mixtura==0
    %Calibración
    nmin=min(media_testxm);
    nmax=max(media_testxm);
    n_media=(nmax-nmin)/100;
    rango_media=nmin:n_media:nmax;
    ymedia_3=polyval(pmedia_3,rango_media);
    ymedia_3p=polyval(pmedia_3,rango_media+0.5);
    ymedia_3n=polyval(pmedia_3,rango_media-0.5);

    nmin=min(percentil_90_testxm);
    nmax=max(percentil_90_testxm);
    n_p90=(nmax-nmin)/100;
    rango_p90=nmin:n_p90:nmax;
    y90_3=polyval(p90_3,rango_p90);
    y90_3p=polyval(p90_3,rango_p90+0.5);
    y90_3n=polyval(p90_3,rango_p90-0.5);

    nmin=min(percentil_95_testxm);
    nmax=max(percentil_95_testxm);
    n_p95=(nmax-nmin)/100;
    rango_p95=nmin:n_p95:nmax;
    y95_3=polyval(p95_3,rango_p95);
    y95_3p=polyval(p95_3,rango_p95+0.5);
    y95_3n=polyval(p95_3,rango_p95-0.5);

    nmin=min(percentil_99_testxm);
    nmax=max(percentil_99_testxm);
    n_p99=(nmax-nmin)/100;
    rango_p99=nmin:n_p99:nmax;
    y99_3=polyval(p99_3,rango_p99);
    y99_3p=polyval(p99_3,rango_p99+0.5);
    y99_3n=polyval(p99_3,rango_p99-0.5);
    
    figure
    subplot(2,2,1)
    %errorbar(media_testxm,pred_mediaxm,neg_mediaxm,pos_mediaxm,'o','MarkerSize',5,'MarkerEdgeColor','red','MarkerFaceColor','red')
    hold on
    plot(media_testxm, carga_realxm,'go','LineWidth',2)
    hold on
    %plot(media_testxm, pred_mediaxm, 'r')
    hold on
    plot(rango_media,ymedia_3)
    hold on
    plot(rango_media,ymedia_3p)
    hold on
    plot(rango_media,ymedia_3n)
    title(['Media para ',num2str(minuto),' minutos'])
    xlabel('SRT en \mus')
    ylabel('% de carga CPU')
    legend('Real','Ajuste orden 3','Ajuste+0.5\mus','Ajuste-0.5\mus')
    subplot(2,2,2)
    %errorbar(percentil_90_testxm,pred_90xm,neg_90xm,pos_90xm,'o','MarkerSize',5,'MarkerEdgeColor','red','MarkerFaceColor','red')
    hold on
    plot(percentil_90_testxm, carga_realxm,'go','LineWidth',2)
    hold on
    %plot(percentil_90_testxm, pred_90xm, 'r')
    plot(rango_p90,y90_3)
    hold on
    plot(rango_p90,y90_3p)
    hold on
    plot(rango_p90,y90_3n)
    title(['Percentil 90 para ',num2str(minuto),' minutos'])
    xlabel('SRT en \mus')
    ylabel('% de carga CPU')
    legend('Real','Ajuste orden 3','Ajuste+0.5\mus','Ajuste-0.5\mus')
    subplot(2,2,3)
    %errorbar(percentil_95_testxm,pred_95xm,neg_95xm,pos_95xm,'o','MarkerSize',5,'MarkerEdgeColor','red','MarkerFaceColor','red')
    hold on
    plot(percentil_95_testxm, carga_realxm,'go','LineWidth',2)
    hold on
    %plot(percentil_95_testxm, pred_95xm, 'r')
    hold on
    plot(rango_p95,y95_3)
    hold on
    plot(rango_p95,y95_3p)
    hold on
    plot(rango_p95,y95_3n)
    title(['Percentil 95 para ',num2str(minuto),' minutos'])
    xlabel('SRT en \mus')
    ylabel('% de carga CPU')
    legend('Real','Ajuste orden 3','Ajuste+0.5\mus','Ajuste-0.5\mus')
    subplot(2,2,4)
    %errorbar(percentil_99_testxm,pred_99xm,neg_99xm,pos_99xm,'o','MarkerSize',5,'MarkerEdgeColor','red','MarkerFaceColor','red')
    hold on
    plot(percentil_99_testxm, carga_realxm,'go','LineWidth',2)
    hold on
    %plot(percentil_99_testxm, pred_99xm, 'r')
    hold on
    plot(rango_p99,y99_3)
    hold on
    plot(rango_p99,y99_3p)
    hold on
    plot(rango_p99,y99_3n)
    title(['Percentil 99 para ',num2str(minuto),' minutos'])
    xlabel('SRT en \mus')
    ylabel('% de carga CPU')
    legend('Real','Ajuste orden 3','Ajuste+0.5\mus','Ajuste-0.5\mus')

    figure
    subplot(3,2,1)
    scatter(pred_mediaxm, carga_realxm,'r','*')
    hold on
    refline(1,0)
    title(['Carga predicha vs real con Media para ',num2str(minuto),' minutos'])
    xlabel('% de carga CPU predicha')
    ylabel('% de carga CPU real')
    xlim([0 100])
    ylim([0 100])
    subplot(3,2,2)
    scatter(pred_50xm, carga_realxm,'r','*')
    hold on
    refline(1,0)
    title(['Carga predicha vs real con Percentil 50 para ',num2str(minuto),' minutos'])
    xlabel('% de carga CPU predicha')
    ylabel('% de carga CPU real')
    xlim([0 100])
    ylim([0 100])
    subplot(3,2,3)
    scatter(pred_90xm, carga_realxm,'r','*')
    hold on
    refline(1,0)
    title(['Carga predicha vs real con Percentil 90 para ',num2str(minuto),' minutos'])
    xlabel('% de carga CPU predicha')
    ylabel('% de carga CPU real')
    xlim([0 100])
    ylim([0 100])
    subplot(3,2,4)
    scatter(pred_95xm, carga_realxm,'r','*')
    hold on
    refline(1,0)
    title(['Carga predicha vs real con Percentil 95 para ',num2str(minuto),' minutos'])
    xlabel('% de carga CPU predicha')
    ylabel('% de carga CPU real')
    xlim([0 100])
    ylim([0 100])
    subplot(3,2,5)
    scatter(pred_99xm, carga_realxm,'r','*')
    hold on
    refline(1,0)
    title(['Carga predicha vs real con Percentil 99 para ',num2str(minuto),' minutos'])
    xlabel('% de carga CPU predicha')
    ylabel('% de carga CPU real')
    xlim([0 100])
    ylim([0 100])
else
    %%%%%%%%%%%%%%%%%%Calibración mixturas óptimas%%%%%%%%%%%%%%%
    %Media
    nmin=min(media_optxm);
    nmax=max(media_optxm);
    n_media_mix_opt=(nmax-nmin)/100;
    rango_media_mixxm_opt=nmin:n_media_mix_opt:nmax;
    ymedia_3_mixxm_opt=polyval(pmedia_3_mix_opt,rango_media_mixxm_opt);
    ymedia_3_mixxm_opt_pos=polyval(pmedia_3_mix_opt,rango_media_mixxm_opt+0.5);
    ymedia_3_mixxm_opt_neg=polyval(pmedia_3_mix_opt,rango_media_mixxm_opt-0.5);
    %Percentil 90
    nmin=min(percentil_90_optxm);
    nmax=max(percentil_90_optxm);
    n_p90_mix_opt=(nmax-nmin)/100;
    rango_p90_mixxm_opt=nmin:n_p90_mix_opt:nmax;
    y90_3_mixxm_opt=polyval(p90_3_mix_opt,rango_p90_mixxm_opt);
    y90_3_mixxm_opt_pos=polyval(p90_3_mix_opt,rango_p90_mixxm_opt+0.5);
    y90_3_mixxm_opt_neg=polyval(p90_3_mix_opt,rango_p90_mixxm_opt-0.5);
    %Percentil 95
    nmin=min(percentil_95_optxm);
    nmax=max(percentil_95_optxm);
    n_p95_mix_opt=(nmax-nmin)/100;
    rango_p95_mixxm_opt=nmin:n_p95_mix_opt:nmax;
    y95_3_mixxm_opt=polyval(p95_3_mix_opt,rango_p95_mixxm_opt);
    y95_3_mixxm_opt_pos=polyval(p95_3_mix_opt,rango_p95_mixxm_opt+0.5);
    y95_3_mixxm_opt_neg=polyval(p95_3_mix_opt,rango_p95_mixxm_opt-0.5);
    %Percentil 99
    nmin=min(percentil_99_optxm);
    nmax=max(percentil_99_optxm);
    n_p99_mix_opt=(nmax-nmin)/100;
    rango_p99_mixxm_opt=nmin:n_p99_mix_opt:nmax;
    y99_3_mixxm_opt=polyval(p99_3_mix_opt,rango_p99_mixxm_opt);
    y99_3_mixxm_opt_pos=polyval(p99_3_mix_opt,rango_p99_mixxm_opt+0.5);
    y99_3_mixxm_opt_neg=polyval(p99_3_mix_opt,rango_p99_mixxm_opt-0.5);

    %%%%%%%%%%%%%%%%%%Calibración mixturas óptimas con porcentajes%%%%%%%%%%%%%%%
    %Media
    nmin=min(media_opt_prctgxm);
    nmax=max(media_opt_prctgxm);
    n_media_mix_opt_prctg=(nmax-nmin)/100;
    rango_media_mixxm_opt_prctg=nmin:n_media_mix_opt_prctg:nmax;
    ymedia_3_mixxm_opt_prctg=polyval(pmedia_3_mix_opt_prctg,rango_media_mixxm_opt_prctg);
    ymedia_3_mixxm_opt_prctg_pos=polyval(pmedia_3_mix_opt_prctg,rango_media_mixxm_opt_prctg+0.5);
    ymedia_3_mixxm_opt_prctg_neg=polyval(pmedia_3_mix_opt_prctg,rango_media_mixxm_opt_prctg-0.5);
    %Percentil 90
    nmin=min(percentil_90_opt_prctgxm);
    nmax=max(percentil_90_opt_prctgxm);
    n_p90_mix_opt_prctg=(nmax-nmin)/100;
    rango_p90_mixxm_opt_prctg=nmin:n_p90_mix_opt_prctg:nmax;
    y90_3_mixxm_opt_prctg=polyval(p90_3_mix_opt_prctg,rango_p90_mixxm_opt_prctg);
    y90_3_mixxm_opt_prctg_pos=polyval(p90_3_mix_opt_prctg,rango_p90_mixxm_opt_prctg+0.5);
    y90_3_mixxm_opt_prctg_neg=polyval(p90_3_mix_opt_prctg,rango_p90_mixxm_opt_prctg-0.5);
    %Percentil 95
    nmin=min(percentil_95_opt_prctgxm);
    nmax=max(percentil_95_opt_prctgxm);
    n_p95_mix_opt_prctg=(nmax-nmin)/100;
    rango_p95_mixxm_opt_prctg=nmin:n_p95_mix_opt_prctg:nmax;
    y95_3_mixxm_opt_prctg=polyval(p95_3_mix_opt_prctg,rango_p95_mixxm_opt_prctg);
    y95_3_mixxm_opt_prctg_pos=polyval(p95_3_mix_opt_prctg,rango_p95_mixxm_opt_prctg+0.5);
    y95_3_mixxm_opt_prctg_neg=polyval(p95_3_mix_opt_prctg,rango_p95_mixxm_opt_prctg-0.5);
    %Percentil 99
    nmin=min(percentil_99_opt_prctgxm);
    nmax=max(percentil_99_opt_prctgxm);
    n_p99_mix_opt_prctg=(nmax-nmin)/100;
    rango_p99_mixxm_opt_prctg=nmin:n_p99_mix_opt_prctg:nmax;
    y99_3_mixxm_opt_prctg=polyval(p99_3_mix_opt_prctg,rango_p99_mixxm_opt_prctg);
    y99_3_mixxm_opt_prctg_pos=polyval(p99_3_mix_opt_prctg,rango_p99_mixxm_opt_prctg+0.5);
    y99_3_mixxm_opt_prctg_neg=polyval(p99_3_mix_opt_prctg,rango_p99_mixxm_opt_prctg-0.5);
    
    %%%%%%%%%%%%%%%Representación predicción mixtura óptima x minutos%%%%%%%%%%%%%%%%%%%
    figure
    subplot(2,2,1)
    plot(media_optxm, carga_realxm,'go','LineWidth',2)
    hold on
    plot(rango_media_mixxm_opt,ymedia_3_mixxm_opt)
    hold on
    plot(rango_media_mixxm_opt,ymedia_3_mixxm_opt_pos)
    hold on
    plot(rango_media_mixxm_opt,ymedia_3_mixxm_opt_neg)
    title(['Media para mixtura óptima',num2str(minuto),' minutos'])
    xlabel('SRT en \mus')
    ylabel('% de carga CPU')
    legend('Real','Ajuste orden 3','Ajuste+0.5\mus','Ajuste-0.5\mus')
    ylim([0 100])
    subplot(2,2,2)
    plot(percentil_90_optxm, carga_realxm,'go','LineWidth',2)
    hold on
    plot(rango_p90_mixxm_opt,y90_3_mixxm_opt)
    hold on
    plot(rango_p90_mixxm_opt,y90_3_mixxm_opt_pos)
    hold on
    plot(rango_p90_mixxm_opt,y90_3_mixxm_opt_neg)
    title(['Percentil 90 para mixtura óptima',num2str(minuto),' minutos'])
    xlabel('SRT en \mus')
    ylabel('% de carga CPU')
    legend('Real','Ajuste orden 3','Ajuste+0.5\mus','Ajuste-0.5\mus')
    ylim([0 100])
    subplot(2,2,3)
    plot(percentil_95_optxm, carga_realxm,'go','LineWidth',2)
    hold on
    plot(rango_p95_mixxm_opt,y95_3_mixxm_opt)
    hold on
    plot(rango_p95_mixxm_opt,y95_3_mixxm_opt_pos)
    hold on
    plot(rango_p95_mixxm_opt,y95_3_mixxm_opt_neg)
    title(['Percentil 95 para mixtura óptima',num2str(minuto),' minutos'])
    xlabel('SRT en \mus')
    ylabel('% de carga CPU')
    legend('Real','Ajuste orden 3','Ajuste+0.5\mus','Ajuste-0.5\mus')
    ylim([0 100])
    subplot(2,2,4)
    plot(percentil_99_optxm, carga_realxm,'go','LineWidth',2)
    hold on
    plot(rango_p99_mixxm_opt,y99_3_mixxm_opt)
    hold on
    plot(rango_p99_mixxm_opt,y99_3_mixxm_opt_pos)
    hold on
    plot(rango_p99_mixxm_opt,y99_3_mixxm_opt_neg)
    title(['Percentil 99 para mixtura óptima',num2str(minuto),' minutos'])
    xlabel('SRT en \mus')
    ylabel('% de carga CPU')
    legend('Real','Ajuste orden 3','Ajuste+0.5\mus','Ajuste-0.5\mus')
    ylim([0 100])

    figure
    subplot(3,2,1)
    scatter(pred_mediaxm_mix_opt, carga_realxm,'r','*')
    hold on
    refline(1,0)
    title(['Carga predicha vs real con Media mixtura óptima ',num2str(minuto),' minutos'])
    xlabel('% de carga CPU predicha')
    ylabel('% de carga CPU real')
    xlim([0 100])
    ylim([0 100])
    subplot(3,2,2)
    scatter(pred_50xm_mix_opt, carga_realxm,'r','*')
    hold on
    refline(1,0)
    title(['Carga predicha vs real con Percentil 50 mixtura óptima ',num2str(minuto),' minutos'])
    xlabel('% de carga CPU predicha')
    ylabel('% de carga CPU real')
    xlim([0 100])
    ylim([0 100])
    subplot(3,2,3)
    scatter(pred_90xm_mix_opt, carga_realxm,'r','*')
    hold on
    refline(1,0)
    title(['Carga predicha vs real con Percentil 90 mixtura óptima ',num2str(minuto),' minutos'])
    xlabel('% de carga CPU predicha')
    ylabel('% de carga CPU real')
    xlim([0 100])
    ylim([0 100])
    subplot(3,2,4)
    scatter(pred_95xm_mix_opt, carga_realxm,'r','*')
    hold on
    refline(1,0)
    title(['Carga predicha vs real con Percentil 95 mixtura óptima ',num2str(minuto),' minutos'])
    xlabel('% de carga CPU predicha')
    ylabel('% de carga CPU real')
    xlim([0 100])
    ylim([0 100])
    subplot(3,2,5)
    scatter(pred_99xm_mix_opt, carga_realxm,'r','*')
    hold on
    refline(1,0)
    title(['Carga predicha vs real con Percentil 99 mixtura óptima ',num2str(minuto),' minutos'])
    xlabel('% de carga CPU predicha')
    ylabel('% de carga CPU real')
    xlim([0 100])
    ylim([0 100])
    
    %%%%%%%%%%%%%%%Representación predicción mixtura óptima porcentajes x minutos%%%%%%%%%%%%%%%%%%%
    figure
    subplot(2,2,1)
    plot(media_opt_prctgxm, carga_realxm,'go','LineWidth',2)
    hold on
    plot(rango_media_mixxm_opt_prctg,ymedia_3_mixxm_opt_prctg)
    hold on
    plot(rango_media_mixxm_opt_prctg,ymedia_3_mixxm_opt_prctg_pos)
    hold on
    plot(rango_media_mixxm_opt_prctg,ymedia_3_mixxm_opt_prctg_neg)
    title(['Media para mixtura óptima con porcentajes ',num2str(minuto),' minutos'])
    xlabel('SRT en \mus')
    ylabel('% de carga CPU')
    legend('Real','Ajuste orden 3','Ajuste+0.5\mus','Ajuste-0.5\mus')
    ylim([0 100])
    subplot(2,2,2)
    plot(percentil_90_opt_prctgxm, carga_realxm,'go','LineWidth',2)
    hold on
    plot(rango_p90_mixxm_opt_prctg,y90_3_mixxm_opt_prctg)
    hold on
    plot(rango_p90_mixxm_opt_prctg,y90_3_mixxm_opt_prctg_pos)
    hold on
    plot(rango_p90_mixxm_opt_prctg,y90_3_mixxm_opt_prctg_neg)
    title(['Percentil 90 para mixtura óptima con porcentajes ',num2str(minuto),' minutos'])
    xlabel('SRT en \mus')
    ylabel('% de carga CPU')
    legend('Real','Ajuste orden 3','Ajuste+0.5\mus','Ajuste-0.5\mus')
    ylim([0 100])
    subplot(2,2,3)
    plot(percentil_95_opt_prctgxm, carga_realxm,'go','LineWidth',2)
    hold on
    plot(rango_p95_mixxm_opt_prctg,y95_3_mixxm_opt_prctg)
    hold on
    plot(rango_p95_mixxm_opt_prctg,y95_3_mixxm_opt_prctg_pos)
    hold on
    plot(rango_p95_mixxm_opt_prctg,y95_3_mixxm_opt_prctg_neg)
    title(['Percentil 95 para mixtura óptima con porcentajes ',num2str(minuto),' minutos'])
    xlabel('SRT en \mus')
    ylabel('% de carga CPU')
    legend('Real','Ajuste orden 3','Ajuste+0.5\mus','Ajuste-0.5\mus')
    ylim([0 100])
    subplot(2,2,4)
    plot(percentil_99_opt_prctgxm, carga_realxm,'go','LineWidth',2)
    hold on
    plot(rango_p99_mixxm_opt_prctg,y99_3_mixxm_opt_prctg)
    hold on
    plot(rango_p99_mixxm_opt_prctg,y99_3_mixxm_opt_prctg_pos)
    hold on
    plot(rango_p99_mixxm_opt_prctg,y99_3_mixxm_opt_prctg_neg)
    title(['Percentil 99 para mixtura óptima con porcentajes ',num2str(minuto),' minutos'])
    xlabel('SRT en \mus')
    ylabel('% de carga CPU')
    legend('Real','Ajuste orden 3','Ajuste+0.5\mus','Ajuste-0.5\mus')
    ylim([0 100])

    figure
    subplot(3,2,1)
    scatter(pred_mediaxm_mix_opt_prctg, carga_realxm,'r','*')
    hold on
    refline(1,0)
    title(['Carga predicha vs real con Media mixtura óptima con porcentajes ',num2str(minuto),' minutos'])
    xlabel('% de carga CPU predicha')
    ylabel('% de carga CPU real')
    xlim([0 100])
    ylim([0 100])
    subplot(3,2,2)
    scatter(pred_50xm_mix_opt_prctg, carga_realxm,'r','*')
    hold on
    refline(1,0)
    title(['Carga predicha vs real con Percentil 50 mixtura óptima con porcentajes ',num2str(minuto),' minutos'])
    xlabel('% de carga CPU predicha')
    ylabel('% de carga CPU real')
    xlim([0 100])
    ylim([0 100])
    subplot(3,2,3)
    scatter(pred_90xm_mix_opt_prctg, carga_realxm,'r','*')
    hold on
    refline(1,0)
    title(['Carga predicha vs real con Percentil 90 mixtura óptima con porcentajes ',num2str(minuto),' minutos'])
    xlabel('% de carga CPU predicha')
    ylabel('% de carga CPU real')
    xlim([0 100])
    ylim([0 100])
    subplot(3,2,4)
    scatter(pred_95xm_mix_opt_prctg, carga_realxm,'r','*')
    hold on
    refline(1,0)
    title(['Carga predicha vs real con Percentil 95 mixtura óptima con porcentajes ',num2str(minuto),' minutos'])
    xlabel('% de carga CPU predicha')
    ylabel('% de carga CPU real')
    xlim([0 100])
    ylim([0 100])
    subplot(3,2,5)
    scatter(pred_99xm_mix_opt_prctg, carga_realxm,'r','*')
    hold on
    refline(1,0)
    title(['Carga predicha vs real con Percentil 99 mixtura óptima con porcentajes ',num2str(minuto),' minutos'])
    xlabel('% de carga CPU predicha')
    ylabel('% de carga CPU real')
    xlim([0 100])
    ylim([0 100])
end
end