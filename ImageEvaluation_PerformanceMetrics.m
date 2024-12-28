clear
clc

fprintf('Image Evaluation and Performance Metrics Calculation\n');
fprintf('=====================================================\n\n');

% Question 1
fprintf('Question 1: Evaluation of Image Comparison Metrics\n\n');

% Define the realImage1 and resultImage1 matrices
realImage1 = [
    0 0 0 0 0 1 1 0 0 0 0 0;
    1 1 1 0 0 1 1 1 0 0 0 0;
    1 1 1 0 0 1 1 1 0 0 0 0;
    1 1 1 0 0 1 1 1 0 0 0 0;
    0 0 1 0 0 1 1 1 0 1 1 1;
    0 0 1 0 0 1 1 1 1 1 1 1;
    0 0 1 1 1 1 0 1 1 1 1 1;
    0 0 1 1 1 1 0 1 1 1 1 1;
    0 0 1 1 1 1 0 0 0 1 1 1;
    0 0 1 1 1 1 0 0 0 1 1 1
];

resultImage1 = [
    0 0 0 0 0 1 1 0 0 0 0 0;
    1 1 1 0 0 1 1 1 0 0 0 0;
    1 1 1 1 1 1 1 1 0 0 0 0;
    1 1 1 0 0 0 0 0 0 0 0 0;
    1 1 1 0 0 0 0 0 0 1 1 1;
    1 1 1 1 1 1 1 1 1 1 1 1;
    1 1 1 1 1 1 0 1 1 1 1 1;
    1 1 1 1 1 1 0 1 1 1 1 1;
    0 0 1 1 1 1 0 0 0 1 1 1;
    0 0 1 1 1 1 0 0 0 1 1 1
];

% Initialize the variables
tp = 0;
tn = 0;
fn = 0;
fp = 0;

% Perform the evaluation
for i = 1:size(realImage1, 1)
    for j = 1:size(realImage1, 2)
        if realImage1(i, j) == 1 && resultImage1(i, j) == 1
            tp = tp + 1;
        elseif realImage1(i, j) == 1 && resultImage1(i, j) ~= 1
            fn = fn + 1;
        elseif realImage1(i, j) ~= 1 && resultImage1(i, j) == 1
            fp = fp + 1;
        else
            tn = tn + 1;
        end
    end
end

% Calculate the performance metrics
sensitivity = tp / (tp + fn);
specificity = tn / (fp + tn);
accuracy = (tp + tn) / (tp + tn + fp + fn);
fpr = fp / (tp + tn + fp + fn);
fnr = fn / (tp + tn + fp + fn);

% Display the results
fprintf('TP = %d\n', tp);
fprintf('FN = %d\n', fn);
fprintf('FP = %d\n', fp);
fprintf('TN = %d\n', tn);
fprintf('-------------------------------------------------\n');
fprintf('Sensitivity = %.2f%%\n', sensitivity * 100);
fprintf('Specificity = %.2f%%\n', specificity * 100);
fprintf('Accuracy    = %.2f%%\n', accuracy * 100);
fprintf('FP Rate     = %.2f%%\n', fpr * 100);
fprintf('FN Rate     = %.2f%%\n', fnr * 100);

fprintf('================================================\n');

% Question 2
fprintf('Question 2: Evaluation of Image Intensity Comparison Metrics\n\n');

realImage2 = [
    20 40 20 40 150 240 150 240;
    30 35 30 35 200 250 200 250;
    40 48 40 48 180 241 20 40;
    10 39 10 39 190 160 30 35;
    50 23 150 240 150 240 150 240;
    20 40 200 250 200 250 200 250;
    30 35 180 241 20 40 20 40;
    40 48 190 160 30 35 30 35;
    10 39 150 240 150 240 40 48;
    50 23 200 250 200 250 10 39
];

resultImage2 = [
    180 241 20 40 150 240 150 240;
    190 160 30 35 200 250 200 250;
    150 240 40 48 180 241 20 40;
    200 250 10 39 190 20 40 20;
    180 241 150 240 150 30 35 30;
    20 40 200 250 200 40 48 40;
    30 35 180 241 20 40 20 40;
    40 48 190 160 30 35 30 35;
    10 39 150 240 150 240 40 48;
    50 23 200 250 200 250 10 39
];

tp = 0;
tn = 0;
fn = 0;
fp = 0;

for i = 1:size(realImage2, 1)
    for j = 1:size(realImage2, 2)
        if realImage2(i, j) >= 100 && resultImage2(i, j) >= 100
            tp = tp + 1;
        elseif realImage2(i, j) >= 100 && resultImage2(i, j) < 100
            fn = fn + 1;
        elseif realImage2(i, j) < 100 && resultImage2(i, j) >= 100
            fp = fp + 1;
        else
            tn = tn + 1;
        end
    end
end

% Display the results
fprintf('TP = %d\n', tp);
fprintf('FN = %d\n', fn);
fprintf('FP = %d\n', fp);
fprintf('TN = %d\n', tn);
fprintf('-------------------------------------------------\n');
fprintf('Sensitivity = %.2f%%\n', tp / (tp + fn) * 100);
fprintf('Specificity = %.2f%%\n', tn / (fp + tn) * 100);
fprintf('Accuracy    = %.2f%%\n', (tp + tn) / (tp + tn + fp + fn) * 100);
fprintf('FP Rate     = %.2f%%\n', fp / (tp + tn + fp + fn) * 100);
fprintf('FN Rate     = %.2f%%\n', fn / (tp + tn + fp + fn) * 100);
