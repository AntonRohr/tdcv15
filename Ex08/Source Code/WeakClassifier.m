classdef WeakClassifier < handle
    %WEAKCLASSIFIER 此处显示有关此类的摘要
    %   此处显示详细说明
    
    properties
        dimensionThreshold;
        Threshold;
        polarity;
        errRate;
    end
    
    methods
        
        function obj = WeakClassifier()
            obj.dimensionThreshold = 1;
            obj.Threshold = 0;
            obj.polarity = 1;
            obj.errRate = 1;
        end
        
        function obj = Train(obj, trainingExamples, lables, importanceWeights)
            [numSample, numDim] = size(trainingExamples);
            for dim = 1 : numDim
                for j = 1 : numSample
                    oneDimData = trainingExamples(:,dim);
                    [oneDimData, index] = sort(oneDimData);
                    oneDimLables = lables(index);
                    oneDimImportanceWeights = importanceWeights(index);
                    splitters = oneDimData(1:end-1) + 0.5*(oneDimData(2:end) - oneDimData(1:end-1));
                    splitters = [oneDimData(1)-1;splitters;oneDimData(end)+1];
                    for k = 1 : size(splitters,1)
                        thres = splitters(k);
                        for polar = -1 : 2 : 1 
                            positive = find(polar.*oneDimData <= polar.*thres);
                            negative = find(polar.*oneDimData > polar.*thres);
                            positive(find(oneDimLables(positive) == 1)) = [];
                            negative(find(oneDimLables(negative) == -1)) = [];
                            incorrects = [positive; negative];
                            errorRate = sum(oneDimImportanceWeights(incorrects));
                            if errorRate <= obj.errRate
                                obj.errRate = errorRate;
                                obj.Threshold = thres;
                                obj.dimensionThreshold = dim;
                                obj.polarity = polar;
                            end
                        end
                    end
                end
            end
            
        end
        
        function [dat1_x, dat1_y, dat2_x, dat2_y] = Test(obj, testExamples)
            dat1_x = [];
            dat1_y = [];
            dat2_x = [];
            dat2_y = [];
            for i = 1 : size(testExamples,1)
                if testExamples(i,obj.dimensionThreshold)*obj.polarity <= obj.Threshold*obj.polarity
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

