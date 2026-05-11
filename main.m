function [Tmean,Torque_Ripple,cosf,MV] = main(x1,x2,x3)
%     RotorMagnetsGroup = MotorEntity.Solver.Groups.RotorMagnets;
    MotorEntity.Configuration.Rotor.MagnetLength2Pocket     = x1;%30;    % Magnet Length / PocketLength(ab) (%)
    MotorEntity.Configuration.Rotor.InnerBarrierAnglePercentage  = x2;%0-100;   
    MotorEntity.Configuration.Rotor.MagnetWidth             = x3;%24;    % Magnet Width Barrier(mm)(initial=3)
    [MotorEntity] = Main_struct(MotorEntity);

    %%
    % initial parameters
    Current = MotorEntity.Vectors.Current;
    idmaxT = 9;
    MechAngle_opt = MotorEntity.Vectors.MechAngle_opt;
    PhaseAMechanicalAxis = MotorEntity.Configuration.Winding.PhaseAMechanicalAxis; %@Create_Winding
    Poles = MotorEntity.Configuration.Poles;
    IEA = MotorEntity.Vectors.IEA;
    % main struct
    k = length(Current);
    j = length(IEA)-idmaxT;
    for i= 1:length(MechAngle_opt)

        mi_modifyboundprop('BC SlidingBand',10,PhaseAMechanicalAxis+MechAngle_opt(i)*2/Poles)
        %             Add currents
        [MotorEntity] = Add_Currents_optimization1(MotorEntity,k,j,i);
        %             FEA_analysis
        [MotorEntity] = FEA_analysis_optimization(MotorEntity);
        %             Torque Calculation
        [MotorEntity] = Torque_Calculation_optimization1(MotorEntity,i);
        %             Magnetic Vector Potential A,B,C
        [MotorEntity] = Magnetic_Vector_Potential_optimization1(MotorEntity,k,j,i);
        %             ABC_to_DQ_quantities_optimization

        T(i) = MotorEntity.Results.T(i);
    end
%%
[MotorEntity] = ABC_to_DQ_quantities_optimization1(MotorEntity);
[cosf] = Power_Factor_optimization1(MotorEntity);
cosf = mean(abs(cosf));
Tmean = abs(squeeze(mean(T)));
Torque_Ripple = squeeze((max(-T)-min(-T)))./Tmean;

% Find Magnet Volume
mo_clearblock;
mo_groupselectblock(53);
MV = mo_blockintegral(10); % Magnets Volume
mo_clearblock;

% Save Results
MotorEntity.Results.cosf_opt(:,:,:) = cosf;
MotorEntity.Results.Tmean_opt(:,:,:) = Tmean;
MotorEntity.Results.Torque_Ripple_opt(:,:,:) = Torque_Ripple;
MotorEntity.Results.MV_opt(:,:,:) = MV;

end