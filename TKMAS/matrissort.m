function B=matrissort(A)
B=reshape(sort(A(:)),fliplr(size(A))).'