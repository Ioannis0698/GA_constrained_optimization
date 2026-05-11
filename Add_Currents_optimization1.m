function [MotorEntity] = Add_Currents_optimization1(MotorEntity,k,j,i)
% initial parameters
MechAngle_opt = MotorEntity.Vectors.MechAngle_opt;
Current = MotorEntity.Vectors.Current;
IEA = MotorEntity.Vectors.IEA;
J = MotorEntity.Configuration.NominalCurrentDensity;
% Current Densities in phases
Ja(i)=sqrt(2)*J*(Current(k)/100)*cos(deg2rad(MechAngle_opt(i)+IEA(j)));
Jb(i)=sqrt(2)*J*(Current(k)/100)*cos(deg2rad(MechAngle_opt(i)+IEA(j)+120));
Jc(i)=sqrt(2)*J*(Current(k)/100)*cos(deg2rad(MechAngle_opt(i)+IEA(j)+240));
mi_modifymaterial('PhaseA',4,Ja(i));
mi_modifymaterial('PhaseB',4,Jb(i));
mi_modifymaterial('PhaseC',4,Jc(i));
mi_modifymaterial('PhaseNA',4,-Ja(i));
mi_modifymaterial('PhaseNB',4,-Jb(i));
mi_modifymaterial('PhaseNC',4,-Jc(i));
% Save Current Densities 
MotorEntity.Results.Ja(i) = Ja(i);
MotorEntity.Results.Jb(i) = Jb(i);
MotorEntity.Results.Jc(i) = Jc(i);
% Id, Iq calculations
% [MotorEntity] = Id_Iq_Calculations(MotorEntity,k,j,i);
end