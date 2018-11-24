y=zeros(1000,2);
z=zeros(100,2);
k=1;
j=1;
d0=3;
n0=0.1;
T=1000;
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
       z(j,1)=w(1);
       z(j,2)=w(2);
       j=j+1;
    end
end

%f includes distances(input-weight)
f = zeros(100,1);
t=0;
d = round(d0*(1-t/T),0);
n = n0*(1-t/T);
for t=1:1000
    d = round(d0*(1-t/T),0);
    n = n0*(1-t/T); 
    if t == 1
        figure
        hold on
        plot (y(:,1),y(:,2),'r.')
        plot(z(:,1),z(:,2))
        hold off
    end
    if t == 50
        figure
        hold on
        plot (y(:,1),y(:,2),'r.')
        plot(z(:,1),z(:,2))
        hold off
    end
    if t == 100
        figure
        hold on
        plot (y(:,1),y(:,2),'r.')
        plot(z(:,1),z(:,2))
        hold off
    end
    if t == 200
        figure
        hold on
        plot (y(:,1),y(:,2),'r.')
        plot(z(:,1),z(:,2))
        hold off
    end
    if t == 500
        figure
        hold on
        plot (y(:,1),y(:,2),'r.')
        plot(z(:,1),z(:,2))
        hold off
    end
    if t == 700
        figure
        hold on
        plot (y(:,1),y(:,2),'r.')
        plot(z(:,1),z(:,2))
        hold off
    end
    if t == 1000
        figure
        hold on
        plot (y(:,1),y(:,2),'r.')
        plot(z(:,1),z(:,2))
        hold off
    end
    for k=1:1000            
        for j=1:100
            f(j) = sqrt((y(k,1)-z(j,1))^2+(y(k,2)-z(j,2))^2);
        end
        minim=min(f);
        for m=1:100
            if f(m) == minim
               p = m;
               break;
            end
        end
        %{
        i=p;
        j=0;
        while i>=1 && j<=d 
            neighb = [neighb,i];
            i = i-1;
            j = j+1;
        end
        i=p+1;
        j=1;
        while i<=100 && j<=d 
            neighb = [neighb,i];
            i = i+1;
            j = j+1;
        end
        %}
        for g=p-d:p+d
            if g>=1 && g<=100
            dwx = n*(-z(g,1)+y(k,1));
            dwy = n*(-z(g,2)+y(k,2));
            z(g,1) = z(g,1) + dwx;
            z(g,2) = z(g,2) + dwy;
            end
        end
        t
    end
end   
