function out=DMC_asymmetric(kernel, dat, sigma, K)
%Initial version: Michael Lin 2019
% This function computes
%the data manifold convolution value from the "perpective" of the kernel.
%i.e we look at the K nearest neighbors of each point of the kernel, in
%dat. We take the average similarity across all such neighbors

%INPUT: kernel=[N1 x D] rows are vectors in D dimensional space. kernel is
%what we are convolving over another set of points.
%sigma=neighborhood size
%K=number of nearest neighbors to use in the other set
%dat=[N2 x D] rows are vectors in D dimensional space
G=@(d) exp(-d.^2/(2*sigma^2));
N1=size(kernel,1);
N2=size(dat,1);
if (K>N1)||(K>N2)
    disp('Error: K must be <= the number of dat points')
    return
end

[~, D] = knnsearch(dat, kernel, 'K', K);%D,IDX=[N1 x K]

out=mean(mean(G(D)));%this version of DMC is normalized by the number of points in kernel and K. So convolving larger kernels or using larger K wont lead to larger DMC values
end