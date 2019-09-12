function SimilarityFunction(A)
%Mario G. Martínez-Montalvo   12/08/2019

%Esta función realiza una matriz de similitud calculando la similitud
%coseno de "n" vectores poblacionales.

%Cada vector poblacional está constituido por una columna de la matriz a
%analizar, en donde podemos encontrar las neuronas activas e inactivas 
%(cada una determinada por una fila) en un bin determinado de tiempo.

SimilarityIndex=[]; %Abre la matriz que será llenada por el for
for columna=1:size(A,2)
    cos=[];

    for fila=1:size(A,2)
        x=(dot(A(:,columna),A(:,fila)))/(sqrt(sum(A(:,columna).^2)).*sqrt(sum(A(:,fila).^2)));
        cos=[cos;x];      
    end
    SimilarityIndex=[SimilarityIndex cos];%Matriz con la similitud coseno con todas las posibles comparaciones
                                          %entre los vectores poblacionales 
end

imagesc(SimilarityIndex) %Grafica la matriz de similitud
colormap(jet) %Establece el mapa de colores
colorbar %Aparece la barra de color con la escala de similitud
title('Similarity Index') %Título de la imagen
xlabel('Vector i (t)') 
ylabel('Vector i (t)')
set(gca,'YDir','normal') %Invierte en espejo la imagen de la matriz de similitud


end

