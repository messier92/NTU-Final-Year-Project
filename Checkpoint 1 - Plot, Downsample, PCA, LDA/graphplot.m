%Step 1: Process the data using Origins 

%For Origins Step, plot individual y values to x value. Smooth each y value
%using Adjacent-Averaging (5 pts window) and then subtract the baseline.
%Obtain the y average of all subtracted baseline of y values

%Step 2: Import the data from excel file; Home -> Import Data -> Select
%Excel File -> Import x and yavg for each sheet (Pure CA, CA on CL and
%Pure CL)

%Step 3: Create variables; let A be a matrix of x and y1; B be a matrix of
%x and y2, C be a matrix of x and y3

%Step 4 plot the related graph on the axis

% A=[x,yCL1]
% B=[x1,yavgcaonCL]
C=[x,yCaavg]

% figure;
% plot(A(:,1),A(:,2))
% title('Pure CL') %title
% xlabel('Raman Shift (cm-1)') % x-axis label
% ylabel('Intensity') % y-axis label

% figure;
% plot(B(:,1),B(:,2))
% title('CA on CL') %title
% xlabel('Raman Shift (cm-1)') % x-axis label
% ylabel('Intensity') % y-axis label

figure;
plot(C(:,1),C(:,2))
title('Pure CA') %title
xlabel('Raman Shift (cm-1)') % x-axis label
ylabel('Intensity') % y-axis label

