function [counts, colorLevels] = greenHistogram(colorImage)
[rows, columns, rgb] = size(colorImage);
counts = zeros(1, 256);
for col = 1 : columns
	for row = 1 : rows
	    % Get the color level.
	    colorLevel = colorImage(row, col, 2);
	    % Add 1 because graylevel zero goes into index 1 and so on.
	    counts(colorLevel+ 1) = counts(colorLevel+1) + 1;
	end
end
% Plot the histogram.
colorLevels = 0 : 255;
bar(colorLevels, counts, 'BarWidth', 1, 'FaceColor', 'b');
xlabel('Gray Level', 'FontSize', 20);
ylabel('Pixel Count', 'FontSize', 20);
title('Histogram', 'FontSize', 20);
grid on;
end
