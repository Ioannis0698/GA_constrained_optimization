function [cosf] = Power_Factor_optimization1(MotorEntity)
% initial parameters
IEA =       MotorEntity.Vectors.IEA;
% idmaxT = 5; % MotorEntity.Results.idmaxT;
[MotorEntity] = Ld_Lq_Calculations_optimization1(MotorEntity);
Ld = MotorEntity.Results.Ld;
Lq = MotorEntity.Results.Lq;


%% Power Factor
Id = squeeze(mean(MotorEntity.Results.Id,1));
Iq = squeeze(mean(MotorEntity.Results.Iq,1));
% I_tot = sqrt(Id.^2+Iq.^2);
% 
y = Ld./Lq;
% x = x*ones(1,length(Iq));

cosf = ((y-1).*Id.*Iq)./(sqrt((y.*Id).^2+Iq.^2).*sqrt(Id.^2+Iq.^2));
% cosf(abs(cosf)>=1)=nan;
MotorEntity.Results.cosf = cosf;
%% plot
% figure(2);
% surf(I_tot,IEA,cosf')
% max(cosf(:))
% xlabel('Itot');
% ylabel('IEA');
% title('cos?');


end