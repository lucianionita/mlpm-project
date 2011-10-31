function [  ] = lrf_svm_main( )
% main function fot the svm algortihm and hill-valey dataset
% runs and evaluates the combination
% percent error pedestrians classification   0.3060
% error non - pedestrians classification     0.1780
% total = 24.2



load database\hill\trainNoNoise.mat;
load database\hill\testNoNoise.mat;
   
    trainData = data(1:100,1:100);
    trainLabels = data(1:100,101);
    for i = 1: size(trainLabels,1)
        if trainLabels(i) == 0
            trainLabels(i) =-1;
        end
    end
    trainLabels
    %training phase
    global  X;% defined for the svm algorithm 
    X = trainData; 
  
    [SOL,B] = primal_svm(1,trainLabels,0.5);
    
    % test phase   
    testingData = testData(:,1:100);
    labelsTest = testData(:,101);
    hold all;
    
    %-4:0.1:4, -400:400 the extreme values where selected running the testPhase on
    %the training function and ploting the min and max val of f(x)
    for i = -4: 0.1: 4
    [percentErrValey, percentErrHill] = testPhase(i, SOL, B,testingData, labelsTest);
    plot(percentErrValey,1 - percentErrHill,'--rs','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','b',...
                'MarkerSize',5);
    end
  [percentErrValey, percentErrHill] = testPhase(0, SOL, B,testingData, labelsTest)
 
 
    ylabel('Hill detection rate');
    xlabel('Error valey detected as hills') ;
end

