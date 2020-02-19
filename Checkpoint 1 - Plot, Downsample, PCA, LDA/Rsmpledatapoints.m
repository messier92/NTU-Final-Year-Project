%Before obtaining the average Raman spectra of Pure CA and Pure PA, it must
%be downsampled to fit 1029 data points, same as CL and CL on CA. 

%y1 is the CL in x and y data, y2 is the individual values of x and y data
%of Pure CA/Pure PA

%linspace creates a row vector of evenly spaced points, interpolating the
%input y2 data with 1574 datapoints to fit the fixed y1 data with 1029
%datapoints (linear interpolation)

y1 = yPureCL; % sub in CL x and y data
y2 = y1PureCA; % sub in Pure Ca/Pure Pa y data, y2PureCA, y3... 
Fx1 = griddedInterpolant(y1);
Fx2 = griddedInterpolant(y2);
out = [Fx1(linspace(1,numel(y1),1029)'), Fx2(linspace(1,numel(y2),1029)')];
