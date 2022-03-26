function d=dist(source,target,type)

d=abs(source(1)-target(1))+abs(source(2)-target(2))-1;

if type==2
    d=d*2;
end

end