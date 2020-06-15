% COMPONENTE RUIDOSA:
% COMPONENTES DE MENOS DEL 0.1% DEL N�MERO TOTAL DE P�XELES DE LA IMAGEN
% O N�MERO DE P�XELES MENOR AL AREA DEL OBJETO MAYOR /5
% SE DEBE CUMPLIR CUALQUIERA DE LAS DOS CONDICIONES
function IbinFilt = funcion_elimina_regiones_ruidosas(Ibin)
 
IbinFilt = Ibin;

    [IEtiq N] = bwlabel(Ibin);
    
    numTotalPix = sum(sum(Ibin));
    
    if N>0
        stats=regionprops(Ibin, 'Area');
        areas = cat(1,stats.Area);
        
        small_obj = find(areas < 0.1/100*numTotalPix);
        if ~isempty(small_obj)
            for i=1:length(small_obj)
                IbinFilt = and(IEtiq ~= small_obj(i), Ibin);   
            end
        end

        
        [IEtiq N] = bwlabel(Ibin);
        if N>0
            stats=regionprops(Ibin, 'Area');
            areas = cat(1,stats.Area);
            small_obj = find(areas < max(areas)/5);

            for i=1:length(small_obj)
                IbinFilt = and(IEtiq ~= small_obj(i), IbinFilt);   
            end
        
        end
    end
    

end