% create calibration files for the c++ robot program
Fid_Read=fopen('calibration.txt','r');
%Read all file
i=0;
while 1
    ReadLine = fgetl(Fid_Read);
    if ReadLine ==  -1
        break;
    end;
    Line=str2num(ReadLine);
    if length(Line) ~= 4 
        break;
    end;
    i = i+1;
    X_Cartes(i)= Line(1);
    Y_Cartes(i)= Line(2);
    X_Robot(i) = Line(3);
    Y_Robot(i) = Line(4);
end
fclose(Fid_Read);

X_Robot = X_Robot(:);
Y_Robot = Y_Robot(:);
X_Cartes = X_Cartes(:);
Y_Cartes = Y_Cartes(:);


allData = { {X_Robot Y_Robot X_Cartes Y_Cartes} {X_Cartes Y_Cartes X_Robot Y_Robot} };
allFiles = {'RegressBetaRob2Cart.txt' 'RegressBetaCart2Rob.txt'};
for dataNum = 1:2
    X1 = allData{dataNum}{1};
    Y1 = allData{dataNum}{2};
    X2 = allData{dataNum}{3};
    Y2 = allData{dataNum}{4};

    ArgumentsMat1 = [X1.^2  Y1.^2 X1.*Y1 X1 Y1 ones(length(X1),1)];

    Beta1to2_X = regress(X2, ArgumentsMat1);
    Beta1to2_Y = regress(Y2, ArgumentsMat1);
    
    Fid_Write=fopen(allFiles{dataNum},'w');
    
    for i=1:length(Beta1to2_X)
        fprintf(Fid_Write,' %f',Beta1to2_X(i));
    end
    fprintf(Fid_Write,' \n');
    for i=1:length(Beta1to2_Y)
        fprintf(Fid_Write,' %f',Beta1to2_Y(i));
    end
    fclose(Fid_Write);
end;