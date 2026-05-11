function [MotorEntity] = Magnetic_Vector_Potential_optimization1(MotorEntity,k,j,i)

% Select PhaseA
mo_groupselectblock(401);
mo_groupselectblock(411);
mo_groupselectblock(421);
mo_groupselectblock(431);
% Magnetic Vector Potential (PhaseA)
Az1(i) = mo_blockintegral(1)/mo_blockintegral(5); % (1/Sq)integral(Az)dS (check) (2*(Poles/2)*L*PoleTurns*)
mo_clearblock;
MotorEntity.Results.Az1(i) = Az1(i);

% Select PhaseB
mo_groupselectblock(404);
mo_groupselectblock(414);
mo_groupselectblock(424);
mo_groupselectblock(434);
% Magnetic Vector Potential (PhaseB)
Az2(i) = mo_blockintegral(1)/mo_blockintegral(5); % (1/Sq)integral(Az)dS (check) (2*(Poles/2)*L*PoleTurns*)
mo_clearblock;
MotorEntity.Results.Az2(i) = Az2(i);

% Select PhaseC
mo_groupselectblock(405);
mo_groupselectblock(415);
mo_groupselectblock(425);
mo_groupselectblock(435);
% Magnetic Vector Potential (PhaseC)
Az3(i) = mo_blockintegral(1)/mo_blockintegral(5); % (1/Sq)integral(Az)dS (check) (2*(Poles/2)*L*PoleTurns*)
mo_clearblock;
MotorEntity.Results.Az3(i) = Az3(i);
end