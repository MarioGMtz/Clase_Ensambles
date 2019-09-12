function FuntionPCA(A)

%Mario G. Martínez   2019
%Ésta función contiene las combinaciones posibles entre dos algoritmos de reducción de dimenciones y
%dos algoritmos de clusterización. Los cuatro algoritmos y sus
%combinaciones son los que serán insertados en la GUI

clc

%PCA with K-Means
coeff=pca(A);
figure(1)
plot(coeff(:,1),coeff(:,2),'o'),xlabel('PCA1'),ylabel('PCA2')

%K-means
DataforKMeans=[coeff(:,1),coeff(:,2);];
idx = kmeans(DataforKMeans,2);

colores=[1 0 0;0 1 0];
figure(2);hold on
for k=1:length(idx)
    plot(DataforKMeans(k,1),DataforKMeans(k,2),'o','color',colores(idx(k),:))
end

%PCA with Heriarchical clustering
coeff=pca(A);
figure(1)
plot(coeff(:,1),coeff(:,2),'o'),xlabel('PCA1'),ylabel('PCA2')

%Heriarchical clustering
DataforHC=[coeff(:,1),coeff(:,2);];
T = clusterdata(DataforHC,1);



%ICA with K-Means
Mdl = rica(A,2);
figure(3)
plot(Mdl.TransformWeights(:,1),Mdl.TransformWeights(:,2),'o'),xlabel('Weight1'),ylabel('Weight2')

%K-means
idx = kmeans(Mdl.TransformWeights,2);

colores=[1 0 0;0 1 0];
figure(4);hold on
for k=1:length(idx)
    plot(Mdl.TransformWeights(k,1),Mdl.TransformWeights(k,2),'o','color',colores(idx(k),:))
end



%ICA with Heriarchical clustering
Mdl = rica(A,2);
figure(3)
plot(Mdl.TransformWeights(:,1),Mdl.TransformWeights(:,2),'o'),xlabel('Weight1'),ylabel('Weight2')

%Heriarchical clustering
T = clusterdata(Mdl.TransformWeights,1);

end

