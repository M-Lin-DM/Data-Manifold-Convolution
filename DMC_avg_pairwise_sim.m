function out=DMC_avg_pairwise_sim(dat1,dat2,sigma,K)
%INPUT: sigma=neighborhood size
%K=number of nearest neighbors to use in the other set
%dat=[N x D] rows are vectors in D dimensional space
G=@(d) exp(-d.^2/(2*sigma^2));
N1=size(dat1,1);
N2=size(dat2,1);
if (K>N1)||(K>N2)
    disp('Error: K must be <= the number of dat points')
    return
end
%can extend this by weighting by the local density in either space. can
%also weight by the number of points in each data manifold
out=(N2*mean(sum(G(pdist2(dat1,dat2,'euclidean','Smallest',K)),1))+...
            N1*mean(sum(G(pdist2(dat2,dat1,'euclidean','Smallest',K)),1)))/(K*(N1+N2));
        %pdist2 creates an MX-by-MY matrix, with the
%     (I,J) entry equal to distance between observation I in X and
%     observation J in Y.
end