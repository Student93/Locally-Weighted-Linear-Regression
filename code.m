X = importdata('q3x.dat');
Y = importdata('q3y.dat');

theta = [0;0];
m = size(Y,1);

%design matrix X
X = [ones(m,1) X];

yUnWeighted = zeros(m,1);

theta = inv(X' * X) * X' * Y;

a=40;
figure  
hold on;
title('Unweighted Linear Regression using normal equations')
xlabel('Input')
ylabel('Output')

scatter(X(:,2),Y,a, 'MarkerEdgeColor',[0 .5 .5],...
    'MarkerFaceColor',[0 .7 .7],...
    'LineWidth',1.5);

line = theta(2) * X(:,2) + theta(1);
plot(X(:,2), line);
hold off;

%part 2
figure
hold on;
title('Locally weighted Linear Regression')
xlabel('Input')
ylabel('Output')
W = zeros(m,m);
tau = 0.8;
%calculating W
Ynew = zeros(m,1);
for i = 1:m
    for j = 1:m
        W(j,j) = exp(-(X(i,2) - X(j,2)).^2 /(2 * tau * tau));
    end
    thetaweighted = inv(X' * W * X) * X' * W * Y;
    Ynew(i) = thetaweighted(1) + X(i,2) * thetaweighted(2);
    line = thetaweighted(1) + [X(i,2)-0.5:X(i,2)+0.5]*thetaweighted(2);
    plot([X(i,2)-0.5 X(i,2)+0.5],line);
    
end

plot(X(:,2), Y, 'r+')

plot(X(:,2), Ynew,'bo');

title('tau = 0.8')
hold off;


% 3rd part
tau =0.1;
figure
hold on;
title('Locally weighted Linear Regression')
xlabel('Input')
ylabel('Output')
%calculating W
Ynew = zeros(m,1);
for i = 1:m
    for j = 1:m
        W(j,j) = exp(-(X(i,2) - X(j,2)).^2 /(2 * tau * tau));
    end
    thetaweighted = inv(X' * W * X) * X' * W * Y;
    Ynew(i) = thetaweighted(1) + X(i,2) * thetaweighted(2);
    line = thetaweighted(1) + [X(i,2)-0.5:X(i,2)+0.5]*thetaweighted(2);
    plot([X(i,2)-0.5 X(i,2)+0.5],line);
    
end
plot(X(:,2), Y, 'r+')
plot(X(:,2), Ynew, 'bo');
title('tau = 0.1')
hold off;


tau =0.3;
%calculating W
Ynew = zeros(m,1);
figure
hold on;
title('Locally weighted Linear Regression')
xlabel('Input')
ylabel('Output')
for i = 1:m
    for j = 1:m
        W(j,j) = exp(-(X(i,2) - X(j,2)).^2 /(2 * tau * tau));
    end
    thetaweighted = inv(X' * W * X) * X' * W * Y;
    Ynew(i) = thetaweighted(1) + X(i,2) * thetaweighted(2);
    line = thetaweighted(1) + [X(i,2)-0.5:X(i,2)+0.5]*thetaweighted(2);
    plot([X(i,2)-0.5 X(i,2)+0.5],line);
   
end

plot(X(:,2), Y, 'r+')
plot(X(:,2), Ynew, 'bo');
title('tau = 0.3')
hold off;


tau =2;
%calculating W
figure
hold on;
title('Locally weighted Linear Regression')
xlabel('Input')
ylabel('Output')
Ynew = zeros(m,1);
for i = 1:m
    for j = 1:m
        W(j,j) = exp(-(X(i,2) - X(j,2)).^2 /(2 * tau * tau));
    end
    thetaweighted = inv(X' * W * X) * X' * W * Y;
    Ynew(i) = thetaweighted(1) + X(i,2) * thetaweighted(2);
    line = thetaweighted(1) + [X(i,2)-0.5:X(i,2)+0.5]*thetaweighted(2);
    plot([X(i,2)-0.5 X(i,2)+0.5],line);
   
end
plot(X(:,2), Y, 'r+')
plot(X(:,2), Ynew, 'bo');
title('tau = 2')
hold off;


tau =10;
%calculating W
figure
hold on;
title('Locally weighted Linear Regression')
xlabel('Input')
ylabel('Output')
Ynew = zeros(m,1);
for i = 1:m
    for j = 1:m
        W(j,j) = exp(-(X(i,2) - X(j,2)).^2 /(2 * tau * tau));
    end
    thetaweighted = inv(X' * W * X) * X' * W * Y;
    Ynew(i) = thetaweighted(1) + X(i,2) * thetaweighted(2);
    line = thetaweighted(1) + [X(i,2)-0.5:X(i,2)+0.5]*thetaweighted(2);
    plot([X(i,2)-0.5 X(i,2)+0.5],line);
    
end
plot(X(:,2), Y, 'r+')
plot(X(:,2), Ynew, 'bo');
title('tau = 10')
hold off;

