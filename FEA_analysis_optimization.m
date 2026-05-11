function [MotorEntity] = FEA_analysis_optimization(MotorEntity)
mi_zoomnatural;
fem_name = sprintf('test.fem');
mi_saveas(fem_name);
mi_setprevious('test.ans');
mi_analyze(1);
mi_loadsolution;
end