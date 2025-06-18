classdef CEC17_F1 < PROBLEM
% <single> <real> 
% CEC'17 constrained optimization benchmark problem

%------------------------------- Reference --------------------------------
% G. Wu, R. Mallipeddi, and P. N. Suganthan, Problem definitions and
% evaluation criteria for the CEC 2017 Special Session and competition on 
% Single Objective Real-Parameter Numerical optimization, Nanyang
% Technological University, Singapore, 2016.
%------------------------------- Copyright --------------------------------
% Copyright (c) 2023 BIMK Group. You are free to use the PlatEMO for
% research purposes. All publications which use this platform or any code
% in the platform should acknowledge the use of "PlatEMO" and reference "Ye
% Tian, Ran Cheng, Xingyi Zhang, and Yaochu Jin, PlatEMO: A MATLAB platform
% for evolutionary multi-objective optimization [educational forum], IEEE
% Computational Intelligence Magazine, 2017, 12(4): 73-87".
%--------------------------------------------------------------------------

  
    methods
        %% Default settings of the problem
        function Setting(obj)
           
            obj.M = 1;
            if isempty(obj.D); obj.D = 10; end

            obj.lower    = zeros(1,obj.D) - 100;
            obj.upper    = zeros(1,obj.D) + 100;
            obj.encoding = ones(1,obj.D);
        end
        %% Calculate objective values
%         function Population = Initialization(obj,N)

%             PopDec = load();
%             Population = obj.Evaluation(PopDec);
% 
%         end

        function PopObj = CalObj(obj,PopDec)
             % PopDec = PopDec+0.3.*(obj.upper -obj.lower);
              PopObj = cec17_func(PopDec',1)';
%             fhd = str2func('cec17_func');
%             PopObj = feval(fhd,PopDec',1)';

        
            
        end
        
    end
end