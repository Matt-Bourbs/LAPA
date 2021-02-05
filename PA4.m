function[] = PA4()

%boundary conditions
left = 1;
right = 1;
top = 0;
bottom = 0;

%create matix V
nx = 12;
ny = 12;
V = zeros(nx,ny);

for k = 0:1000
    for i = 1:(nx)
        for j = 1:(ny)
            if i == 1
                V(i,j) = left;
            elseif i == nx
                V(i,j) = right;        
            elseif j == 1
                V(i,j) = bottom;
            elseif j == ny
                V(i,j) = top;
            else  
                V(i,j) = (V((i+1),j)+V((i-1),j)+V(i,(j+1))+V(i,(j-1)))/4;
            end
        end
    end
    
    subplot(4,1,1)
    surf(V);
    pause(0.1)

    [Ex,Ey] = gradient(V);
    subplot(4,1,2)
    surf(-Ex,-Ey)
    pause(0.1)
    
    subplot(4,1,3)
    quiver(-Ex,-Ey) 
    
    subplot(4,1,4)
    A = imboxfilt(V,3);
    imshowpair(V,A)
    
end