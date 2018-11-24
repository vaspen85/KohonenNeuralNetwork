y=zeros(1000,2);
z1=zeros(100,1);
z2=zeros(100,1);
k=1;
j=1;
d0=3;
n0=0.1;
T=1000;
distances = zeros(1000,100)
%y includes all 1000 inputs x(i,j)
while k<=1000 
    x = rand(1,2);
    if x(2)<=1-x(1)
       y(k,1)=x(1);
       y(k,2)=x(2);
       k=k+1;
    end
end
%z includes all 100 weights w(i,j)
while j<=100
    w = rand(1,2);  
    if sqrt((w(1)-.25)^2 + (w(2)-.25)^2)<=sqrt(.0025)
       z1(j,1)=w(1);
       z2(j,1)=w(2);
       j=j+1;
    end
end
z3 = reshape(z1,[10,10]);
z4 = reshape(z2,[10,10]);
%f includes distances(input-weight)
f = zeros(100,1);

for k = 1:1000
    eg = 1;
  for i = 1:10
    for j = 1:10
      distances(k, eg) = sqrt((y(k,1)-z3(i,j))^2 + (y(k,2)-z4(i,j))^2);
      eg = eg +1;
    end
  end
end
      
t=0;
figure
        hold on
        plot (y(:,1),y(:,2),'r.')
        for i=1:10
            plot(z3(i,:),z4(i,:)) 
        end 
        for i=1:10
            plot(z3(:,i),z4(:,i)) 
        end
        hold off
d = round(d0*(1-t/T),0);
n = n0*(1-t/T);
for t=1:1000
    if t == 0
        figure
        hold on
        plot (y(:,1),y(:,2),'r.')
        for i=1:10
            plot(z3(i,:),z4(i,:)) 
        end 
        for i=1:10
            plot(z3(:,i),z4(:,i)) 
        end
        hold off
    end
    if t == 10
        figure
        hold on
        plot (y(:,1),y(:,2),'r.')
        for i=1:10
            plot(z3(i,:),z4(i,:)) 
        end 
        for i=1:10
            plot(z3(:,i),z4(:,i)) 
        end
        hold off
    end
    if t == 100
        figure
        hold on
        plot (y(:,1),y(:,2),'r.')
        for i=1:10
            plot(z3(i,:),z4(i,:)) 
        end 
        for i=1:10
            plot(z3(:,i),z4(:,i)) 
        end
        hold off
    end
    if t == 500
        figure
        hold on
        plot (y(:,1),y(:,2),'r.')
        for i=1:10
            plot(z3(i,:),z4(i,:)) 
        end 
        for i=1:10
            plot(z3(:,i),z4(:,i)) 
        end
        hold off
    end
    
    if t == 600
        figure
        hold on
        plot (y(:,1),y(:,2),'r.')
        for i=1:10
            plot(z3(i,:),z4(i,:)) 
        end 
        for j=1:10
            plot(z3(:,j),z4(:,j)) 
        end
        hold off
    end
    %{
    if t == 1000
        figure
        hold on
        plot (y(:,1),y(:,2),'r.')
        for i=1:10
            plot(z3(i,:),z4(i,:)) 
        end 
        for j=1:10
            plot(z3(:,j),z4(:,j)) 
        end
        hold off
    end
    %}
 
    for k=1:1000  
           d = round(d0*(1-t/T),0);
    n = n0*(1-t/T);
        neighbx = [];
        neighby = [];
        p = zeros(1,2);
        c=1;
%        for i=1:10
%            for j=1:10
%                f(c) = sqrt((y(k,1)-z3(i,j))^2+(y(k,2)-z4(i,j))^2);
%                c = c+1;
%            end    
%        end
        f = distances(k,:);
        m = find(f==min(f));
        if m < 10
            p = [1,m];
        elseif m == 100
            p = [10,10];
        elseif mod(m,10) == 0
            p = [floor(m/10),10];
        else
            p = [floor(m/10),mod(m,10)];
        end
        
        %{
        i=p(2);
        j=0;
        while i>=1 && j<=d 
            neighbx = [neighbx,i];
            i = i-1;
            j = j+1;
        end
        i=p(2)+1;
        j=1;
        while i<=10 && j<=d 
            neighbx = [neighbx,i];
            i = i+1;
            j = j+1;
        end
        i=p(1)-1;
        j=1;
        while i>=1 && j<=d 
            neighby = [neighby,i];
            i = i-1;
            j = j+1;
        end
        i=p(1)+1;
        j=1;
        while i<=10 && j<=d 
            neighby = [neighby,i];
            i = i+1;
            j = j+1;
        end
        %}
        for gx=p(1)-d:p(1)+d
            if gx>=1 && gx<=10
                dwx = n*(-z3(gx,p(2))+y(k,1));
                dwy = n*(-z4(gx,p(2))+y(k,2));
                z3(gx,p(2)) = z3(gx,p(2)) + dwx;
                z4(gx,p(2)) = z4(gx,p(2)) + dwy;
            end    
        end    
        for gy=p(2)-d:p(2)+d
            if gy>=1 && gy<=10
                dwx = n*(-z3(p(1),gy)+y(k,1));
                dwy = n*(-z4(p(1),gy)+y(k,2));
                z3(p(1),gy) = z3(p(1),gy) + dwx;
                z4(p(1),gy) = z4(p(1),gy) + dwy;
            end
        end
        cols = 1;
        for ii = 1:10
          for jj = 1:10
            distances(k, cols) = sqrt((y(k,1)-z3(ii,jj))^2 + (y(k,2)-z4(ii,jj))^2);
            cols = cols + 1;
          end
        end
    end
    t
end   
