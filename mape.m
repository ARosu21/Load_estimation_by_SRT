function [MAPE] = mape(real,prediction)
%Funcion para calcular el Mean absolute percentage error (MAPE)
n = length(prediction);
aux = zeros(1,n);

for i=1:n
    aux(i) = abs((real(i)-prediction(i))/real(i));
end

MAPE = (100/n) * sum(aux);
end

