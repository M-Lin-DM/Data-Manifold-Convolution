function out=DMC_avg_pairwise_sim_weighted(dat1,dat2,w1,w2,sigma,K)
%INPUT: sigma=neighborhood size
%K=number of nearest neighbors to use in the other set
%dat=[N x D] rows are vectors in D dimensional space
%w1/w2 = (column vector) weights of corresponding rows in dat1/2
%OUTPUT: the manifold convolution value between two data sets. Higher->
%better overlap
G=@(d) exp(-d.^2/(2*sigma^2));
N1=size(dat1,1);
N2=size(dat2,1);
if (K>N1)||(K>N2)
    disp('Error: K must be <= the number of dat points')
    return
end
%can extend this by weighting by the local density in either space. can
% weight by the number of points in each data manifold

out=(sum(w2'.*sum(G(pdist2(dat1,dat2,'euclidean','Smallest',K)),1),2)+...
            sum(w1'.*sum(G(pdist2(dat2,dat1,'euclidean','Smallest',K)),1),2))/((sum(w1)+sum(w2))*K);
end