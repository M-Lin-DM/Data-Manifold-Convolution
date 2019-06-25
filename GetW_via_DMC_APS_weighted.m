function out=GetW_via_DMC_APS_weighted(STRM,sigma,K,szsub)%SUPERNOTE: THIS FUNCTION ASSUMES A PARTICULAR FORM OF STRM (USED IN Multi_image_SIFT)
%Input: STRM=cell array with each cell holding a dat-like matrix (the data
%manifold)
%See DMC_avg_pairwise_sim for info on inputs
%szsub=number of rows to use if you just want to get the upper right corner
%of the similarity matrix (to take a sample for speed). 
%If you want the full sim matrix, let szsub=total number of data manifolds
out=zeros(szsub,szsub);

for j=1:szsub
     j
    for k=1:szsub
        if k<j%pdist2(Phop{k},Phop{j},'euclidean')'=[Mk x Mj] distance matrix
            out(j,k)=DMC_avg_pairwise_sim_weighted(STRM{j,2},STRM{k,2},STRM{j,1}(:,3),STRM{k,1}(:,3),sigma,K);
        end
    end
end
out=symmetrize(out);
%  out=out/mean(out(:));%centers mean of similarity values at 1
end