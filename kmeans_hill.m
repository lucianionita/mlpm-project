
% 9. Class Distribution:
% 
%    Hill_Valley_with_noise_Training.data (307 / 299)
%    Hill_Valley_with_noise_Testing.data  (299 / 307)
% 
%    Hill_Valley_without_noise_Training.data (305 / 301)
%    Hill_Valley_without_noise_Testing.data  (295 / 311)

load database\hill\trainNoNoise.mat;
load database\hill\testNoNoise.mat;
   percent = 1 ;
   %no noise
   maxClassA = 305; 
%  with noise
%  maxClassA = 305; 
    
   sortedData = sortrows(data,101);
   trainDataA =  sortedData(1:round(percent*maxClassA),1:100);
   trainDataB =  sortedData(maxClassA+1:round(percent*606),1:100);
    
    
    
    nrMeans = 1;
    [idx meanClassA] = kmeans(trainDataA, nrMeans);
    [idx meanClassB] = kmeans(trainDataB, nrMeans);
    
 % test phase   
    testingData = testData(:,1:100);
    labelsTest = testData(:,101);
    hold all;
    
    % k r g b a
    for i = [ -1000:100:2000 ]
    [percentErrValey, percentErrHill] = testPhaseKmeans(i, meanClassA, meanClassB,testingData, labelsTest);
    plot(percentErrValey,1 - percentErrHill,'--rs','LineWidth',1,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','g',...
                'MarkerSize',3);
    end
    
    ylabel('Hill detection rate');
    xlabel('Error valey detected as hills') ;