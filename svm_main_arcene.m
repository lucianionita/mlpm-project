function [  ] = lrf_svm_main( )


load database\arcene\arceneValid.mat;
load database\arcene\arceneTrain.mat;
    percent = 0.5;
    sizeTr = round(percent * size(arceneTrain,1))
    trainData = arceneTrain(1:sizeTr,2:1001);
    trainLabels = arceneTrain(1:sizeTr,1);
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
    testingData = arceneValid(:,2:1001);
    labelsTest = arceneValid(:,1);
    hold all;
    
    %-4:0.5:4, 
    for i = -4: 0.05: 4
    [percentErrValey, percentErrHill] = testPhase(i, SOL, B,testingData, labelsTest);
    plot(percentErrValey,1 - percentErrHill,'--rs','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','b',...
                'MarkerSize',4);
    end
  [percentErrValey, percentErrHill] = testPhase(0, SOL, B,testingData, labelsTest)
 
 
    ylabel('Cancer Detection Rates');
    xlabel('Error: not cancer patients classified with cancers') ;
end

