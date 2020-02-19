%   PCA is not optimal for classification, note that there 
%   is no mention of the class label no mention of the class label in
%   the definition of in the definition of PCA

y1=yCL1(2:1029)
y2=ycaonCL1(2:1029)
y3=ycaonCL2(2:1029)
y4=ycaonCL3(2:1029)
y5=ycaonCLavg(2:1029)
y6=yCa1(2:1029)
y7=yCa2(2:1029)
y8=yCa3(2:1029)
y9=yCa4(2:1029)
y10=yCa5(2:1029)
y11=yCa6(2:1029)
y12=yCa7(2:1029)
y13=yCa8(2:1029)
y14=yCaavg(2:1029)


data=[y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14];
[coeff,score,latent,tsquared,explained] = pca(data);

%remove the mean row-wise
data=data-repmat(mean(data,2),1,size(data,2));
 
%calculate eigenvectors W and eigenvalue of covariance matrix
[W, EvalueMatrix]=eig(cov(data'));
Evalues=diag(EvalueMatrix);
 
% order by largest eigenvalue
Evalues = Evalues (end:-1:1);
W=W(:,end:-1:1); 
W=W';
 
%generate PCA scores
pc=W*data;

% %plot PCA of all PCs
% figure;
% plot(pc(1,:),pc(2,:),'.') %plotting principal components of first row all columns, 2nd row all columns
% title('PCA 2D')

%plot PCA labelled
figure;
plot(pc(1,1),pc(2,1),'o') %plotting principal component of 1st row 1st column against 2nd row 1st column, pure CL
hold on
plot(pc(1,2:5),pc(2,2:5),'.') %plotting principal component of 1st row 2nd-5th column against 2nd row 2nd-5th column, ca on CL
hold on
plot(pc(1,6:14),pc(2,6:14),'*') %plotting principal component of 1st row 6th-14th column against 2nd row 6th-14th column, pure CA
legend('Pure CL','Ca on CL','Pure Ca');
title('PCA 2D labelled')

% %plot PCA in 3d
% figure;
% scatter3(pc(1,:),pc(2,:),pc(3,:),'.') 
% title('PCA 3D')

%plot PCA in 3d labelled
figure;
scatter3(pc(1,1),pc(2,1),pc(3,1),'o') %plot pc 1st row 1st column, 2nd row 2nd column, 3rd row 3rd column
hold on
scatter3(pc(1,2:5),pc(2,2:5),pc(3,2:5),'.') %plot pc 1st row 2-5th column, 2nd row 2-5th column, 3rd row 2-5th column
hold on
scatter3(pc(1,6:14),pc(2,6:14),pc(3,6:14),'*') %plot pc 1st row 6-14th col, 2nd row 6-14th col, 3rd row 6-14th col
legend('Pure CL','Ca on CL','Pure Ca');
title('PCA 3D labelled')

explained

%obtain LDA matrix from 1st 2 principal components
LDAMatrix2=pc(1:2,:);

%obtain LDA matrix from 1st 3 principal components
LDAMatrix3=pc(1:3,:);
