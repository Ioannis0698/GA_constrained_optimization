function[MotorEntity] = Torque_Calculation_optimization1(MotorEntity,i)
%            T1(k,j,i)= L*mo_gapintegral('BC SlidingBand',0);
            T(i)= mo_gapintegral('BC SlidingBand',0); % T(i) me i einai h diakymansh rophs (plot) 
            MotorEntity.Results.T(i) = T(i);
end