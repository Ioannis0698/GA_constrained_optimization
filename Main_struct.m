function [MotorEntity] = Main_struct(MotorEntity)
%% 2. Define a simplified parametric vector for the geometry 

% Run MSV - basic design parameter definition
MSV_SPM_EMDesignCourse_optimization;
% Call Config file
[MotorEntity] = Configuration_File(MotorEntity);

%% 3. FEMM drawing - To be completed by students
 
% a. Open FEMM problem and define material properties and BCs
[MotorEntity] = Open_Femm_Problem(MotorEntity);
[MotorEntity] = Add_Materials_and_BCs(MotorEntity);
% b. Create stator 
[MotorEntity] = Draw_Stator_Geometry(MotorEntity);
% c. Create rotor
[MotorEntity] = Draw_Rotor_Geometry(MotorEntity);
% d. create winding
[MotorEntity] = Create_Winding(MotorEntity);
%       iv)   FEA_analysis
[MotorEntity] = FEA_analysis(MotorEntity);
end