function out=DMC_symmetric(dat1, dat2, sigma, K)
%Initial version: Michael Lin 2019
% This function computes
%the symmetric data manifold convolution value. ie we consider the
%perspective of each dat into the final value.
%We look at the K nearest neighbors of each point of dat1, in
%dat2, and vsv. We take the average similarity across all such neighbors

%INPUT: dat1=[N1 x D] rows are vectors in D dimensional space. kernel is
%what we are convolving over another set of points.
%sigma=neighborhood size
%K=number of nearest neighbors to use in the other set
%dat2=[N2 x D] rows are vectors in D dimensional space
G=@(d) exp(-d.^2/(2*sigma^2));
N1=size(dat1,1);
N2=size(dat2,1);
if (K>N1)||(K>N2)
    disp('Error: K must be <= the number of dat points')
    return
end

[~, D1] = knnsearch(dat2, dat1, 'K', K);%D,IDX=[N1 x K] distance from each element of dat1 to its K nearest neighbors in dat2
[~, D2] = knnsearch(dat1, dat2, 'K', K);%D,IDX=[N2 x K] distance from each element of dat2 to its K nearest neighbors in dat1

out=mean(mean([G(D1); G(D2)]));%this version of DMC is normalized by the number of points in dat1+dat2 and K. So convolving larger kernels or using larger K wont lead to larger DMC values.
%Note: the dat with larger number of points will have a greater influence
%on the DMC value
% out=mean(mean([mean(G(D1),1); mean(G(D2),1)]));%this version eliminates the bias toward the perspective of the dat with more points.
end