% Examen parcial Curs 2017-18 Q1 Problema 1 

clearvars
close all

f = @(x,y) 20 * (x.^2 + y.^2)./sqrt(x.^2 + y.^2 + 0.01);
p = [-0.6,0.6];
nodeHint=35;
elemHint=37;

eval('Circlemesh02')
 
numNod = size(nodes,1);
numElem = size(elem,1);

numbering = 0;
%plotElements(nodes, elem, numbering);

for e = 1:numElem
    n = elem(e,:);
    vertexs = nodes(n,:);
    [alphas, isInside]=baryCoord(vertexs, p);
    if isInside >= 1
        break;
    end
end

format short e

F = f(nodes(:,1),nodes(:,2)); %Temperature als nodes
Tp = alphas* F(n);            %Interpolated temperature
fp = f(p(1,1),p(1,2));        %Temperature at point p
absErr = abs(Tp - fp);
relErr = absErr/fp;           %Note that here f > 0 for all (x,y)

fprintf('\n%10s%12s%15s\n','numTriang','T(p)','RelError') 
fprintf('%6d%18.4e%14.4e\n',e,Tp,relErr)
fprintf('\n(Hint: For node %d the temperature value is %.4e.)\n',...
    nodeHint,F(nodeHint)) 

%Even though its not necessary, we plot the elements, and the point
numbering = 0;
plotElementsOld(nodes,elem,numbering);
hold on
plot(p(1,1),p(1,2),'o','Marker','o','MarkerFaceColor','red')
plot(vertexs(:,1),vertexs(:,2),'o','Marker','o','MarkerFaceColor',...
    'green','MarkerSize',4)
hold off

T=zeros(numElem,1);                %One-dimensional array to hold the
bC=zeros(numElem,2);               %Array to hold oll the barycenters
for e = 1:numElem                  %Temperatures at the barycenter
    n = elem(e,:);           
    vertexs = nodes(n,:);     
    bC(e,:) = [1,1,1]*vertexs/3;   %Coord.of the barycenter of element e
    T(e) = f(bC(e,1),bC(e,2));     %Temperature at the barycenter
end

[tempMax,numTriangTempMax] = max(T);

fprintf('\n%10s%12s\n','numTriang','Temp')
fprintf('%6d%18.4e\n',numTriangTempMax,tempMax)
fprintf('\n(Hint: For element %d the temperature value is %.4e.)\n',...
    elemHint,T(elemHint)) 

%Even though its not necessary, we plot all the barycenters 
figure()
plotElementsOld(nodes,elem,numbering);
hold on
plot(bC(:,1),bC(:,2),'o','Marker','o','MarkerFaceColor','blue',...
    'markerSize',5)
hold off