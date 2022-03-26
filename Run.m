clc
clear
close all

house=struct;
shop=struct;
bridge=struct;
pier=struct;
node=struct;
river=struct;
river(1).lat=4;

%% Input Data
prompt = {'number of houses:','Enter space-separated numbers:',...
    'number of shops:','Enter space-separated numbers:',...
    'number of bridges:','Enter space-separated numbers:',...
    'number of piers:','Enter space-separated numbers:'};
dlgtitle = 'Data Input';
definput = {'5','2 6 9 11 15','4','3 7 12 14','3','5 9 15','2','7 14'};
dims = [1 40];
opts.Interpreter = 'tex';
answer = inputdlg(prompt,dlgtitle,dims,definput,opts);

%% Importing Data
house.count=str2double(answer{1});
house.y=str2num(answer{2});
house.x=ones(1,house.count);
bridge.count=str2double(answer{5});
bridge.y=str2num(answer{6});
bridge.x=3*ones(1,bridge.count);
pier.count=str2double(answer{7});
pier.y=str2num(answer{8});
pier.x=3*ones(1,pier.count);
shop.count=str2double(answer{3});
shop.y=str2num(answer{4});
shop.x=5*ones(1,shop.count);


node.count=house.count+shop.count+bridge.count+pier.count;
node.order=1:node.count;
node.graph=zeros(node.count,node.count);
%% Graph Assignment

type=1; %1=bicycle, 2=pedestrian
for i=1:house.count
    for j=1:bridge.count
        source=[house.x(i) house.y(i)];
        destination=[bridge.x(j) bridge.y(j)];
        node.graph(i,j+house.count)=dist(source,destination,type);  %to do: write dist function
    end
end

type=2;

for i=1:house.count
    for j=1:pier.count
        source=[house.x(i) house.y(i)];
        destination=[pier.x(j) pier.y(j)];
        node.graph(i,j+house.count+bridge.count)=dist(source,destination,type);;  %to do: write dist function
    end
end

type=1;

for i=1:bridge.count
    for j=1:shop.count
        source=[bridge.x(i) bridge.y(i)];
        destination=[shop.x(j) shop.y(j)];
        node.graph(i+house.count,j+pier.count+house.count+bridge.count)=dist(source,destination,type);;  %to do: write dist function
    end
end

type=2;

for i=1:pier.count
    for j=1:shop.count
        source=[pier.x(i) pier.y(i)];
        destination=[shop.x(j) shop.y(j)];
        node.graph(i+house.count+bridge.count,j+pier.count+house.count+bridge.count)=dist(source,destination,type);;  %to do: write dist function
    end
end

%% Calculation of the Shortest path matrix
final=zeros(house.count,shop.count);
for i=1:house.count
    for j=1:shop.count
        [final(i,j),~]=dijkstra(node.graph,i,j+pier.count+house.count+bridge.count);
    end
end
final=final+river(1).lat;