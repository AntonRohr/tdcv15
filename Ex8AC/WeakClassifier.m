classdef WeakClassifier
    %WEAKCLASSIFIER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Threshold = 0;
    end
    
    methods
        function obj = Train(obj, trainingExamples, labels, importanceWeights)
            % first choose random if vertical or horizontal line
            %orientation = round(rand(1))+1;
            orientation = 1;
            trainingExamples = trainingExamples(:,orientation);
            
            for i = 1:size(trainingExamples,1)
                if(obj.classify(trainingExamples(i)) ~= labels(i))
                    fprintf('%4.0f wrongly classified, it is class %4.0f\n',trainingExamples(i), labels(i));
                    if(labels(i) == 1)
                        obj.Threshold = obj.Threshold - trainingExamples(i);
                    else
                        obj.Threshold = obj.Threshold + trainingExamples(i);
                    end
                end
            end
            fprintf('threshold: %4.0f\n', obj.Threshold);
        end
        function class = classify(obj, example)
            if(example > obj.Threshold)
                class = 1;
            else
                class = -1;
            end
        end
    end
    
end

