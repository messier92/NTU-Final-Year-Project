X1=LDAMatrix2(:,1) %all rows, 1st col
X2=LDAMatrix2(:,2:5) %all rows, 2nd to 5th col
X3=LDAMatrix2(:,6:14) %all rows, 6th to 14th col


%find mean and overall mean
Mu1=mean(X1')';
Mu2=mean(X2')';
Mu3=mean(X3')';

Mu=(Mu1+Mu2+Mu3)./5;

%covariance and within class
S1=cov(X1');    
S2=cov(X2');
S3=cov(X3');

Sw=S1+S2+S3;

%number of samples per class
N1 = size(X1,2);
N2 = size(X2,2);
N3 = size(X3,2);


%between class
SB1 = N1.*(Mu1-Mu)*(Mu1-Mu)'; 
SB2 = N2.*(Mu2-Mu)*(Mu2-Mu)';
SB3 = N3.*(Mu3-Mu)*(Mu3-Mu)';


SB = SB1+SB2+SB3;

%computing LDA projection
invSw=inv(Sw);
invSw_by_SB=invSw*SB;

%get projection vector
%[V,D] = EIG(X) produces diagonal matrix D of eigenvalues and a full matrix
%V whose columns are corresponding eigenvectors

[V,D]=eig(invSw_by_SB);

%projection vectors
P1=V(:,1);
P2=V(:,2);


%visualization on scatter plot, uncomment to see 2D data
hfig=figure;
axes1=axes('Parent',hfig,'FontWeight','bold','Fontsize',12);
hold ('all');

%create x and y labels
xlabel('X_1 - first feature','FontWeight','bold','Fontsize',12,...
'FontName','Garamond');
ylabel('X_2 - second feature','FontWeight','bold','Fontsize',12,...
'FontName','Garamond');

%first class
scatter(X1(1,:),X1(2,:),'r','LineWidth',2,'Parent',axes1);
hold on

%second class
scatter(X2(1,:),X2(2,:),'g','LineWidth',2,'Parent',axes1);
hold on

%third class
scatter(X3(1,:),X3(2,:),'b','LineWidth',2,'Parent',axes1);
hold on


%drawing projection vectors
t=-10:20;
line_x1=t .* P1(1);
line_y1=t .* P1(1);

%second vector
t=-5:25;
line_x2=t .* P2(1);
line_y2=t .* P2(2);


plot(line_x1,line_y1,'k-','LineWidth',3);
hold on
plot(line_x2,line_y2,'m-','LineWidth',3);
hold on
legend('Pure CL','Ca on CL','Pure Ca');
grid on
title('LDA')

