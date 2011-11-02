function [  ] = lrf_svm_main( )
% 0.5 percentErrValey     0.1839    0.2410
% 1 percentErrValey  0.1405    0.2443
%0.1    0.1773    0.4658
load database\hill\trainWithNoise.mat;
load database\hill\testWithNoise.mat;
   percent = 0.02;
   sizeTr = round(percent * size(data,1))
    trainData = data(1:sizeTr ,1:100);
    trainLabels = data(1:sizeTr ,101);
    for i = 1: size(trainLabels,1)
        if trainLabels(i) == 0
            trainLabels(i) =-1;
        end
    end

    %training phase
    global  X;% defined for the svm algorithm 
    X = trainData; 
  
    [SOL,B] = primal_svm(1,trainLabels,0.5);
    
    % test phase   
    testingData = testData(:,1:100);
    labelsTest = testData(:,101);
    hold all;
    
    % k r g b a
    for i = [-6:0.4:6 -1:0.1:1 -40:4:40 -800:40:-40 40:80:800]
    [percentErrValey, percentErrHill] = testPhase(i, SOL, B,testingData, labelsTest);
    plot(percentErrValey,1 - percentErrHill,'--rs','LineWidth',1,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','a',...
                'MarkerSize',3);
    end
  [percentErrValey, percentErrHill] = testPhase(0, SOL, B,testingData, labelsTest)
 
 
    ylabel('Hill detection rate');
    xlabel('Error valey detected as hills') ;
end

