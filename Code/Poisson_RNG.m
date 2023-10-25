%%
clc
clear all
close all
%%
holdholdPoisson = zeros(10000,1000);
r = poissrnd(10.0); %initialize r, test 
holdPoisson = poissrnd(100.0,10000,1); %lambda, row size, col size
tic
holdholdPoisson = poissrnd(100.0,10000,1000);
%%
holdtime = toc; %timer to see code execution for presentation, note parfor is slower!
meanSmall = mean(holdPoisson); %% the mean approaches lambda, ~10.0840
meanLarge = mean(mean(holdholdPoisson));
stdLarge = mean(std(holdholdPoisson)); %call to standard deviation
stdSmall = std(holdPoisson);
%%
%For small RNG we should see left skew
holdPoisson2 = poissrnd(10.0,100,1);
meanSmall2 = mean(holdPoisson2);
stdSmall2 = std(holdPoisson2);
%%
%
txt1a = ["Average= "+ num2str(meanSmall)];
txt1b= ["Standard Deviation= "+ num2str(stdSmall)];
txt1 = [txt1a,txt1b];
txt2a = ["Average= "+ num2str(meanSmall2)];
txt2b= ["Standard Deviation= "+ num2str(stdSmall2)];
txt2 = [txt2a,txt2b];
%
fig1a = figure(); %assign figure object to variable to manipulate later
histogram(holdPoisson,'FaceAlpha',0.1,'EdgeAlpha',0.1) %roughly normal for one 1000 set, set transparent for analysis.
title("Poisson RNG Histogram for n=10000") %plot title
subtitle(txt1)
movegui('northwest')%moves plot object to the upper left quadrant of the user's screen
hold on %allows multiple plotting
xline([meanSmall-stdSmall meanSmall  meanSmall+stdSmall],'-',{'-1 Standard Dev.','Average','+1 Standard Dev.'})
%Above line creates three vertical lines at +/-1 standard deviation away
%from the mean and the mean itself.
%
fig1b = figure();
boxplot(holdPoisson) %Native MATLAB Whisker Plot
title("Poisson RNG BoxPlot for n=1000")
movegui('north')
%
fig2a = figure();
histogram(holdPoisson2,'FaceAlpha',0.1,'EdgeAlpha',0.1)
title("Poisson RNG Histogram for n=100")
subtitle(txt2)
movegui('west')
hold on
xline([meanSmall2-stdSmall2 meanSmall2  meanSmall2+stdSmall2],'-',{'-1 Standard Dev.','Average','+1 Standard Dev.'})
%
fig2b = figure();
boxplot(holdPoisson2)
title("Poisson RNG BoxPlot for n=100")
movegui('center')