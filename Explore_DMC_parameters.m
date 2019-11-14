%% test DMC function on sample data and observe the effect of its parameters
Npoints=load('Npoints.mat'); Npoints=Npoints.Npoints;
text_points=load('text_points.mat'); text_points=text_points.text_points;
% kernel=rand(4,2)-0.5;
% kernel=[1,0];
kernel=Npoints;
% dat2=5*rand(100,2);

[XX, YY]=meshgrid(1:2:350, 1:2:100);
grid=[XX(:), YY(:)];
plot(kernel(:,1), kernel(:,2), 'r.'); hold on
plot(text_points(:,1), text_points(:,2), 'k.'); axis equal
%%
K=3;%number of nearest neighbors in the convolved set 
sig=1;%neighborhood size (standard deviation of normal distribution based similarity function)
A=zeros(size(XX));
S=zeros(size(XX));
for j=1:length(grid)
    j
%     A(j)=DMC_asymmetric(kernel+grid(j,:), dat2,sig,K);
    S(j)=DMC_symmetric(kernel+grid(j,:), text_points,sig,K);
end
%%
figure(1)

image([1,350], [-1,-100], S, 'CDataMapping', 'scaled');
hold on
% plot(text_points(1:2:end,1), -text_points(1:2:end,2), 'k.');
axis equal
% figure(2)

% image([0,5], [0,5], A, 'CDataMapping', 'scaled');
% hold on
% plot(text_points(:,1), text_points(:,2), 'wo');