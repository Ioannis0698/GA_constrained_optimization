function value = obj_func(x)
        % initialize
        x1 = x(1);
        x2 = x(2);
        x3 = x(3);

        [Tmean,Torque_Ripple,cosf,MV] = main(x1,x2,x3);
    Val_in = 0;
    V_in = [Tmean,Torque_Ripple,cosf,MV];
    % save values
        set_Analyzed(V_in, Val_in);
    %     % Save final background parameters
    % save('background_params.mat', 'Val_in', 'V_in');

    % main(30,30,30) values

    % set the objective function parameters 
    Tmean0 = 51.6628;
    Torque_Ripple0 = 0.5511;
    cosf0 = 0.8271;
    MV0 = 1.8800e-05;
    w1 = 0.3;
    w2 = 0.1;
    w3 = 0.3;
    w4 = 0.3;
    value = w1*Tmean0/Tmean + w2*Torque_Ripple/Torque_Ripple0 + w3*cosf0/cosf + w4*MV/MV0;

        % Make sure the fitness value is a scalar
        value = sum(value);

end