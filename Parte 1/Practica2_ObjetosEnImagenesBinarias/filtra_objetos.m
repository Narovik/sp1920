% -Ib: matriz binaria con dos posibles valores,0�s y 1�s. 
% -numPix: se  eliminar�n  todas  las  agrupaciones  de 1�s  de Matriz_Binaria que tengan un �rea menor a este valor. 
% -Ib_filtrada: matriz binaria, de las mismas dimensiones que Ib,
%     con dos posibles valores,0�s y 1�s, con el valor 1indicando los p�xeles de los objetos 
%     cuya �rea es mayor oigual a numPix.

function Ib_filtrada = filtra_objetos(Ib, numPix)

    [Ietiq, num_objetos] = funcion_etiquetar(Ib);
    
    areas = calcula_areas(Ietiq)
    
    obj_mayores = find(areas>numPix)
    
    Ib_filtrada = zeros(size(Ietiq));
    for obj=1:length(obj_mayores)
        for x=1:size(Ietiq,1)
            for y=1:size(Ietiq,2)
                if Ietiq(x,y) == obj_mayores(obj)
                    Ib_filtrada(x,y) = 1;
                end
            end
        end
    end
    

end