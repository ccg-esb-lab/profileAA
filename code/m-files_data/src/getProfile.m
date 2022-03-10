function profile=getProfile(X, Y, XY, B0)

        %B0=[0.,0.]; %tmp
        %mixXT=mixXY; %tmp
        %mixYT=mixXY; %tmp
        
        %[X Y XY]
        
        if XY<B0 && (X>B0 && Y>B0)
            profile=0; %colapso
            
        elseif XY>B0 && (X<B0 || Y<B0)
            profile=4;  %Competitive Exclusion
            
        elseif XY>X && XY>Y
            profile=1;  %Mutualism
            
        elseif (XY>X && XY<Y) || (XY>Y && XY<X)
            profile=2;  %Parasitism
            
        elseif (XY<X) && (XY<Y)    
            profile=3;  % Competition
            
        else
            profile=-1;  %WTF?
        end
        
        %{
        
        
        %if mixXT<B0(1) && mixYT<B0(2)
        %    profile=0;  %Colapso
            
        %else
        %if (mixXT<B0(1) && mixYT>B0(2)) || (mixYT<B0(2) && mixXT>B0(1))
        %    profile=4;  %Competitive Exclusion
            
        %else
        if (soloXT>max([mixXT, mixYT]) && soloYT<min([mixXT, mixYT])) || (soloYT>max([mixXT, mixYT]) && soloXT<min([mixXT, mixYT]))
            profile=2;  %Parasitismo
            
        elseif min([mixXT mixYT])>max([soloXT soloYT])
            profile=1;  %Mutualismo
            
            
        elseif max([mixXT, mixYT])<min([soloXT, soloYT])
            profile=3;  % Competencia
            
        else
            profile=-1;  %WTF?
        end
        
%}        
        