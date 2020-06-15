% Compacticidad: 1
% Excentricidad: 2
% Solidez_CHull(Solidity): 3
% Extension_BBox(Extent): 4
% Extension_BBox(Invariante Rotacion): 5
% Hu1-Hu7: 6-12
% DF1-DF10: 13-22
% NumEuler: 23
function  XImagen = funcion_calcula_descriptores_imagen(Ietiq,N)
    XImagen = zeros(N,23);
    
    stats = regionprops(Ietiq,'Perimeter','Area','Eccentricity','Solidity','Extent','EulerNumber');
    
    perimetros = cat(1,stats.Perimeter);
    areas = cat(1,stats.Area);
    exc = cat(1,stats.Eccentricity);
    
    %A�adimos la excentricidad
    XImagen(:,2) = exc;
    
    solidez = cat(1,stats.Solidity);
    %A�adimos la solidez
    XImagen(:,3) = solidez;
    
    extent = cat(1,stats.Extent);
    %A�adimos la extension
    XImagen(:,4) = extent;
    
    euler = cat(1,stats.EulerNumber);
    %A�adimos euler
    XImagen(:,23) = euler;
    
    
    %C�LCULO COMPACTICIDAD 
    compacticidad = perimetros.^2 ./ areas;
    XImagen(:,1) = compacticidad;
    
    %CALCULO HU, DF, y Extent invariante
    for i=1:N
        
        XImagen(i,6:12) = Funcion_Calcula_Hu(Ietiq==i)';
        

        XImagen(i,13:22) = Funcion_Calcula_DF(Ietiq==i,10)';
  

        %Extension invariante
        XImagen(i,5) = Funcion_Calcula_Extent(Ietiq==i);
        
    end
    
end