function outputMat = normalize( inputMat )

%only normalizes when possible

sumOfMat = sum(sum(inputMat));

if sumOfMat == 0
    outputMat = inputMat;
else

outputMat = inputMat./sumOfMat;

end

