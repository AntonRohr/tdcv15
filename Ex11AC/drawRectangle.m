function [ outputImage ] = drawRectangle(rgbImg, topLeftRow, topLeftCol, botRightRow, botRightCol, color)

topLeft = [topLeftCol, topLeftRow];
topRight = [botRightCol, topLeftRow];
botLeft = [topLeftCol, botRightRow];
botRight = [botRightCol, botRightRow];

line1 = [topLeft, topRight];
line2 = [topRight, botRight];
line3 = [botRight, botLeft];
line4 = [botLeft, topLeft];

lines = [line1;line2;line3;line4];

lines = int32(lines);

outputImage = insertShape(rgbImg, 'Line', lines, 'LineWidth', 2, 'Color', color);
%output = insertShape(RGBimage, 'Line', lines, 'Color', color);

end