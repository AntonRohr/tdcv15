classdef AdaboostClassifier < handle
    %ADABOOSTCLASSIFIER 此处显示有关此类的摘要
    %   此处显示详细说明
    
    properties
        WeakClassifierArr;
        Alpha;
    end
    
    methods
        function obj = AdaboostClassifier(numberWeakClassifiers)
            obj.WeakClassifierArr = zeros(numberWeakClassifiers, 4);%dimThres,Thres, polarity, errRate;
            obj.Alpha = zeros(numberWeakClassifiers, 1);
        end
        
        function obj = Train(obj, trainingExamples, Lables)
            importanceWeights = ones(size(Lables,1),1) ./ size(Lables,1);
            for i = 1 : size(obj.Alpha)
                importanceWeights = importanceWeights ./ sum(importanceWeights);
                weak = WeakClassifier;
                weak.Train(trainingExamples, Lables, importanceWeights);
                obj.Alpha(i) = log((1 - weak.errRate)/weak.errRate);
                obj.WeakClassifierArr(i,1) = weak.dimensionThreshold;
                obj.WeakClassifierArr(i,2) = weak.Threshold;
                obj.WeakClassifierArr(i,3) = weak.polarity;
                obj.WeakClassifierArr(i,4) = weak.errRate;
                %upadate weights
                polarity = weak.polarity;
                dimensionThreshold = weak.dimensionThreshold;
                Threshold = weak.Threshold;
                errRate = weak.errRate;
                positive = find(polarity.*trainingExamples(:,dimensionThreshold) <= polarity*Threshold);
                negative = find(polarity.*trainingExamples(:,dimensionThreshold) > polarity*Threshold);
                positive(find(Lables(positive) ~= 1)) = [];
                negative(find(Lables(negative) ~= -1)) = [];
                corrects = [positive; negative];
                importanceWeights(corrects) = importanceWeights(corrects) .* (errRate / (1-errRate));
            end
        end
        
        function [dat1_x, dat1_y, dat2_x, dat2_y] = Test(obj, testExamples)
                dat1_x = [];
                dat1_y = [];
                dat2_x = [];
                dat2_y = [];
                dimensions = obj.WeakClassifierArr(:,1);
                thresholds = obj.WeakClassifierArr(:,2);
                polars = obj.WeakClassifierArr(:,3);
                for i = 1 : size(testExamples, 1)
                    data = testExamples(i, :);
                    features = data(dimensions);
                    features = features';
                    hypothesis = (polars .* features) < (polars .* thresholds);
                    label = (obj.Alpha' * hypothesis) > (sum(obj.Alpha) * 0.5);
                    if label 
                        dat1_x = [dat1_x, testExamples(i,1)];
                        dat1_y = [dat1_y, testExamples(i,2)];
                    else
                        dat2_x = [dat2_x, testExamples(i,1)];
                        dat2_y = [dat2_y, testExamples(i,2)];
                    end
                end
        end
    end
    
end

