function out=DMC_NNS_asymmetric_weighted(bigdat,dat,w1,sigma,K)
%INPUT: sigma=neighborhood size
%K=number of nearest neighbors to use in the other set
%dat=[N x D] rows are vectors in D dimensional space
%w1/w2 = (column vector) weights of corresponding rows in dat1/2
%OUTPUT: the manifold convolution value between two data sets. Higher->
%better overlap
G=@(d) exp(-d.^2/(2*sigma^2));
N1=size(bigdat,1);
N2=size(dat2,1);
if (K>N1)||(K>N2)
    disp('Error: K must be <= the number of dat points')
    return
end

[D,I]=pdist2(bigdat,dat,'euclidean','Smallest',K);%returns a K-by-MY matrix I containing indices of the observations in X corresponding to the Ksmallest pairwise distances in D.
out=sum(sum(w1(I).*G(D), 1),2)/(sum(w1(:)));%use knnsearch may be faster!!!!
end