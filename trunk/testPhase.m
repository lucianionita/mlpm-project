function [percentErrorValey percentErrorHill] = testPhase( threshold ,SOL, B , testData, labels )
%TESTPHASE Function used to test the classifer. 
%   B and SOL are the parametrs learned from by the SVM on the training
%   data


    errorValey = 0; % 0 = valey
    errorHill = 0; % 1 = hill
    for i=1 : size(testData,1)
      value = testData(i,:) *SOL + B ;
      if value < threshold && labels(i) >0
        errorHill = errorHill + 1;
      end
      if value > threshold && labels(i) <=0
        errorValey = errorValey + 1;
      end
      
    end
   nrHill =0;
   for i=1 : size(labels)
   if labels(i) ==1
       nrHill = nrHill +1 ;
   end
   end
   nrValey = length(labels) - nrHill;
   
%     fprintf('percent error hill classification ' );
    percentErrorHill =  errorHill/ nrHill;
%     errorHill
%     fprintf('error non - pedestrians classification ' );
    percentErrorValey = errorValey/nrValey;
%     errorValey
end

