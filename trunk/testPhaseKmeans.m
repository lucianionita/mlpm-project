function [percentErrorClassA percentErrorClassB] = testPhaseKmeans(threshold, meanClassA, meanClassB,testData, labels)
%TESTPHASE Function used to test the classifer. 
%   B and SOL are the parametrs learned from by the SVM on the training
%   data


    errorClassA = 0; % 0 = valey
    errorClassB = 0; % 1 = hill
    for i=1 : size(testData,1)
      distanceA = sqrt( sum((meanClassA-testData(i)).*(meanClassA-testData(i)) ));
      distanceB = sqrt( sum((meanClassB-testData(i)).*(meanClassB-testData(i)) ));
        distanceA - distanceB
      if (distanceA + threshold < distanceB ) && (labels(i) >0)
        errorClassB = errorClassB + 1;
      end
      if (distanceA + threshold > distanceB) && (labels(i) <=0)
        errorClassA = errorClassA + 1;
      end 
      
    end
   nrClassB =0;
   for i=1 : size(labels)
   if labels(i) ==1
       nrClassB = nrClassB +1 ;
   end
   end
   nrClassA = length(labels) - nrClassB;
   
%     fprintf('percent error hill classification ' );
    percentErrorClassB =  errorClassB/ nrClassB;
%     errorHill
%     fprintf('error non - pedestrians classification ' );
    percentErrorClassA = errorClassA/nrClassA;
%     errorValey
end

