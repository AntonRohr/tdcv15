
weakClassifier = WeakClassifier;

importanceWeights = ones(size(data1,1),1);
weakClassifier.Train(data1(:,1:2),data1(:,3),importanceWeights);




%weakClassifier.testMet()