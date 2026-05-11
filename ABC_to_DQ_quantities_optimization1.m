function [MotorEntity] = ABC_to_DQ_quantities_optimization1(MotorEntity)
% initial parameters
IEA       = MotorEntity.Vectors.IEA;
MechAngle_opt = MotorEntity.Vectors.MechAngle_opt;
Current   = MotorEntity.Vectors.Current;
FF        = MotorEntity.Configuration.FillFactor;
PoleTurns = MotorEntity.Configuration.Winding.PoleTurns;
SPP       = MotorEntity.Configuration.Stator.Spp;
PhaseAMechanicalAxis = MotorEntity.Configuration.Winding.PhaseAMechanicalAxis; %@Create_Winding
Poles     = MotorEntity.Configuration.Poles;
zLength     = MotorEntity.Configuration.ActiveLength;
idmaxT = 5;

mo_clearblock;
mo_groupselectblock(401);
mo_groupselectblock(411);
mo_groupselectblock(421);
mo_groupselectblock(431);

A = mo_blockintegral(5)*FF;
B = A;
C = A;
MotorEntity.Results.A = A;
% grad_x_H = J
%% Id_Iq_Calculations
            k = length(Current);
            j = length(IEA)-idmaxT;
            for i= 1:length(MechAngle_opt)

            %     %% Id Iq Calculations
                Ja(i) = MotorEntity.Results.Ja(i);
                Jb(i) = MotorEntity.Results.Jb(i);
                Jc(i) = MotorEntity.Results.Jc(i);

                Ia(i) = A*10^6/PoleTurns.*Ja(i);
                Ib(i) = B*10^6/PoleTurns.*Jb(i);
                Ic(i) = C*10^6/PoleTurns.*Jc(i);

                MotorEntity.Results.Ia(i) = Ia(i);
                MotorEntity.Results.Ib(i) = Ib(i);
                MotorEntity.Results.Ic(i) = Ic(i);

                % I_S = (rms(Ia,3)+rms(Ib,3)+rms(Ic,3))/3;
                % Id = cosd(IEA).*I_S(8,:);
                % Iq = sind(IEA).*I_S(8,:);
                theta = MechAngle_opt(i) ;
                [d, q] = park_transform_abc_to_dq(Ia, Ib, Ic, -theta);
                MotorEntity.Results.Id = d;
                MotorEntity.Results.Iq = q;
end   
%% Flux ( MVP)
%     FlxA = ((Poles/2)*PoleTurns*zLength/SPP)*MotorEntity.Results.Az1(k,j,i);
%     FlxB = -((Poles/2)*PoleTurns*zLength/SPP)*MotorEntity.Results.Az2(k,j,i);
%     FlxC = ((Poles/2)*PoleTurns*zLength/SPP)*MotorEntity.Results.Az3(k,j,i);
%     MotorEntity.Results.FlxA(k,j,i) = FlxA;
%     MotorEntity.Results.FlxB(k,j,i) = FlxB;
%     MotorEntity.Results.FlxC(k,j,i) = FlxC;
% 
%     [d, q] = park_transform_abc_to_dq(FlxA, FlxB, FlxC, -theta);
%     MotorEntity.Results.Flxd(k,j,i) = d;
%     MotorEntity.Results.Flxq(k,j,i) = q;


end