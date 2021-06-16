function GT = bdd_label(fname)
% fname is labels root
fid = fopen(fname);
raw = fread (fid, inf);
str = char (raw');
fclose (fid);
data = jsondecode (str);

imageFilename = string([]);
Ped = {};
Rid = {};
Car = {};
Tru = {};
Bus = {};
Tra = {};
Mot = {};
Bic = {};
TraL = {};
TraS = {};
fname = strcat(fname(1:11),'images\track\train', fname(37:54));
for i = 1:size(data,1)
    imageFilename(i) = strcat(fname, '\', string(data(i).name));
    for j =  1:size(data(i).labels,1)
        if string(data(i).labels(j).category) == 'pedestrian'
            C = {[data(i).labels(j).box2d.x1 data(i).labels(j).box2d.y1, (data(i).labels(j).box2d.x2-data(i).labels(j).box2d.x1), (data(i).labels(j).box2d.y2-data(i).labels(j).box2d.y1)]};
            Ped(i,j) = C;
        elseif string(data(i).labels(j).category) == 'rider'
            C = {[data(i).labels(j).box2d.x1 data(i).labels(j).box2d.y1, (data(i).labels(j).box2d.x2-data(i).labels(j).box2d.x1), (data(i).labels(j).box2d.y2-data(i).labels(j).box2d.y1)]};
            Rid(i,j) = C;
        elseif string(data(i).labels(j).category) == 'car'
            C = {[data(i).labels(j).box2d.x1 data(i).labels(j).box2d.y1, (data(i).labels(j).box2d.x2-data(i).labels(j).box2d.x1), (data(i).labels(j).box2d.y2-data(i).labels(j).box2d.y1)]};
            Car(i,j) = C;
        elseif string(data(i).labels(j).category) == 'truck'
            C = {[data(i).labels(j).box2d.x1 data(i).labels(j).box2d.y1, (data(i).labels(j).box2d.x2-data(i).labels(j).box2d.x1), (data(i).labels(j).box2d.y2-data(i).labels(j).box2d.y1)]};
            Tru(i,j) = C;
        elseif string(data(i).labels(j).category) == 'bus'
            C = {[data(i).labels(j).box2d.x1 data(i).labels(j).box2d.y1, (data(i).labels(j).box2d.x2-data(i).labels(j).box2d.x1), (data(i).labels(j).box2d.y2-data(i).labels(j).box2d.y1)]};
            Bus(i,j) = C;
        elseif string(data(i).labels(j).category) == 'train'
            C = {[data(i).labels(j).box2d.x1 data(i).labels(j).box2d.y1, (data(i).labels(j).box2d.x2-data(i).labels(j).box2d.x1), (data(i).labels(j).box2d.y2-data(i).labels(j).box2d.y1)]};
            Tra(i,j) = C;
        elseif string(data(i).labels(j).category) == 'motorcycle'
            C = {[data(i).labels(j).box2d.x1 data(i).labels(j).box2d.y1, (data(i).labels(j).box2d.x2-data(i).labels(j).box2d.x1), (data(i).labels(j).box2d.y2-data(i).labels(j).box2d.y1)]};
            Mot(i,j) = C;
        elseif string(data(i).labels(j).category) == 'bicycle'
            C = {[data(i).labels(j).box2d.x1 data(i).labels(j).box2d.y1, (data(i).labels(j).box2d.x2-data(i).labels(j).box2d.x1), (data(i).labels(j).box2d.y2-data(i).labels(j).box2d.y1)]};
            bic(i,j) = C;
        elseif string(data(i).labels(j).category) == 'traffic light'
            C = {[data(i).labels(j).box2d.x1 data(i).labels(j).box2d.y1, (data(i).labels(j).box2d.x2-data(i).labels(j).box2d.x1), (data(i).labels(j).box2d.y2-data(i).labels(j).box2d.y1)]};
            TraL(i,j) = C;
        elseif string(data(i).labels(j).category) == 'traffic sign'
            C = {[data(i).labels(j).box2d.x1 data(i).labels(j).box2d.y1, (data(i).labels(j).box2d.x2-data(i).labels(j).box2d.x1), (data(i).labels(j).box2d.y2-data(i).labels(j).box2d.y1)]};
            TraS(i,j) = C;
        end
    end
end

Car = mcc(Car);
if size(Car,1) ~= 0
    Car(size(Car,1)+1:size(data,1),1) = {[]};
end
Rider = mcc(Rid);
if size(Rider,1) ~= 0
    Rider(size(Rid,1)+1:size(data,1),1) = {[]};
end
Pedestrian = mcc(Ped);
if size(Ped,1) ~= 0
    Pedestrian(size(Ped,1)+1:size(data,1),1) = {[]};
end
Truck = mcc(Tru);
if size(Truck,1) ~= 0
    Truck(size(Tru,1)+1:size(data,1),1) = {[]};
end
Bus = mcc(Bus);
if size(Bus,1) ~= 0
    Bus(size(Bus,1)+1:size(data,1),1) = {[]};
end
Motorcycle = mcc(Mot);
if size(Motorcycle,1) ~= 0
    Motorcycle(size(Mot,1)+1:size(data,1),1) = {[]};
end
Train = mcc(Tra);
if size(Train,1) ~= 0
    Train(size(Tra,1)+1:size(data,1), 1) = {[]};
end
Bicycle = mcc(Bic);
if size(Bicycle, 1) ~=0
    Bicycle(size(Bic,1)+1:size(data,1), 1) = {[]};
end
TrafficLight = mcc(TraL);
if size(TrafficLight,1) ~= 0
    TrafficLight(size(TraL,1)+1:size(data,1), 1) = {[]};
end
TrafficSign = mcc(TraS);
if size(TrafficSign,1) ~= 0
    TrafficSign(size(TraS,1)+1:size(data,1), 1) = {[]};
end
imageFilename = imageFilename';
GT = table(imageFilename);
if ~isempty(Car) ; GT.Car = Car; end
if ~isempty(Pedestrian) ; GT.Pedestrian= Pedestrian; end
if ~isempty(Rider) ; GT.Rider = Rider; end
if ~isempty(Truck) ; GT.Truck = Truck; end
if ~isempty(Train) ; GT.Train = Train; end
if ~isempty(Bus) ; GT.Bus = Bus; end
if ~isempty(Bicycle) ; GT.Bicycle = Bicycle; end
if ~isempty(Motorcycle) ; GT.Motorcycle = Motorcycle; end
if ~isempty(TrafficSign) ; GT.TrafficSign = TrafficSign; end
if ~isempty(TrafficLight) ; GT.TrafficLight = TrafficLight; end
end

