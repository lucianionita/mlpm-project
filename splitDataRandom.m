function [trainingData,testData] = splitDataRandom(data)
[m, n] = size(data); % m data points, n dimensions
percentTraining = 1;
training = zeros(m * percentTraining,n);
for i=1:m * percentTraining 
     index = random('unid', m ); % Pick the index at random.
     training(i,:) = data(index,:); % Add random point.
     data(index,:) = []; % Delete selected row.
     m = m-1;   
end
testData = data;
trainingData  = training;
end