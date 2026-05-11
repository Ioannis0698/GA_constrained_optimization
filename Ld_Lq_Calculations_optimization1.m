function [MotorEntity] = Ld_Lq_Calculations_optimization1(MotorEntity)
% initial parameters
IEA =       MotorEntity.Vectors.IEA(end:-1:1);
MechAngle_opt = MotorEntity.Vectors.MechAngle_opt;
Poles =     MotorEntity.Configuration.Poles;
L =         MotorEntity.Configuration.ActiveLength ;
PoleTurns = MotorEntity.Configuration.Winding.PoleTurns; % total Turns per pole
Spp =       MotorEntity.Configuration.Stator.Spp;
Layers =    MotorEntity.Configuration.Winding.Layers;% winding layers (for you it's 2)
Ns = 2*PoleTurns/(Poles*Spp*Layers); % number of turns per slot (series)
% Ns = PoleTurns/(Poles*Spp*Layers); % number of turns per slot //
nq = Ns;
npp = Spp;
% 
% idmaxT = MotorEntity.Results.idmaxT;
Id = MotorEntity.Results.Id;
Iq = MotorEntity.Results.Iq;
Az1 = MotorEntity.Results.Az1;
Az2 = MotorEntity.Results.Az2;
Az3 = MotorEntity.Results.Az3;
%%
FluxA = ((Poles*L/1000*nq/npp*1).*(MotorEntity.Results.Az1));
FluxB = ((Poles*L/1000*nq/npp*(-1)).*(MotorEntity.Results.Az2));
FluxC = ((Poles*L/1000*nq/npp*1).*(MotorEntity.Results.Az3));
Flux_d = (2/3.*(FluxA+(FluxB+FluxC)./2));
Flux_q = ((1/sqrt(3)).*(FluxB-FluxC));
MotorEntity.Results.FluxA = FluxA;
MotorEntity.Results.FluxB = FluxB;
MotorEntity.Results.FluxC = FluxC;
MotorEntity.Results.Flux_d = Flux_d;
MotorEntity.Results.Flux_q = Flux_q;
%% plot Flux A
% figure(1);clf; hold on;
% plot(IEA,squeeze(-MotorEntity.Results.FluxA(:,:,1))')
% 
% title('Flux A vs IEA')
% legend('Current Magnitude variations')
%% plot Flux D Q
% figure(3);clf; hold on;
% plot(IEA,squeeze(-MotorEntity.Results.Flux_d(:,:,1))')
% plot(IEA,squeeze(-MotorEntity.Results.Flux_q(:,:,1))')
% 
% title('Flux d Flux q Flux vs IEA')
% legend('Current Magnitude variations')

%% Ld Lq
Ld = MotorEntity.Results.Flux_d./MotorEntity.Results.Id;
Ld(abs(Id)<1) =1;
Ld = squeeze(mean(Ld,1,'omitnan'));

Lq = MotorEntity.Results.Flux_q./MotorEntity.Results.Iq;
Lq(abs(Iq)<1) =1;
Lq = squeeze(mean(Lq,1,'omitnan'));

MotorEntity.Results.Ld = Ld;
MotorEntity.Results.Lq = Lq;
%%
% LdRMS = LdRMS(:,[length(LdRMS):-1:1]);
% LqRMS = LqRMS(:,[length(LqRMS):-1:1]);

end