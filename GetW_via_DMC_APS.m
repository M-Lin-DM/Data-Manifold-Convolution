function out=GetW_via_DMC_APS(STRM,sigma,K,szsub)
%Input: STRM=cell array with each cell holding a dat-like matrix (the data
%manifold)
%See DMC_avg_pairwise_sim for info on inputs
%szsub=number of rows to use if you just want to get the upper left corner
%of the similarity matrix (to take a sample for speed). 
%If you want the full sim matrix, let szsub=total number of data manifolds
out=zeros(szsub,szsub);

for j=1:szsub
%     j
    for k=1:j
        %pdist2(Phop{k},Phop{j},'euclidean')'=[Mk x Mj] distance matrix
            out(j,k)=DMC_avg_pairwise_sim(STRM{j,1},STRM{k,1},sigma,K);
    end
end
out=symmetrize(out);
%  out=out/mean(out(:));%centers mean of similarity values at 1
end