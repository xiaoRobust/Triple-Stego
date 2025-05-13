function main(filePath,stateRandom,dis,comNums)
%filePath - 需要处理的图片所在文件夹，会自动扫描
%stateRandom - 随机数是否要固定1-固定 0-真随机

%日志文件
fileLog = fopen('log.txt','w');

%需要处理的图片所在文件夹，会自动扫描
fileFolder=fullfile(filePath);
dirOutput=dir(fullfile(fileFolder,'*.*'));
fileNames={dirOutput.name};
%图片的数目
imageNumber = size(fileNames,2);
    

msg = createMSG(10*512*512,stateRandom);
    
%遍历所有图片，记得从3开始，前两个是 . 和 .. 要跳过
for loop = 4:imageNumber
    myPrint(fileLog,['image-',num2str(loop-2),':',fileNames{loop}]);
    
    path = strcat(strcat(filePath,'/'),fileNames{loop});
    I = imread(path);  %原始图像
    I = double(I);
    [m,n]=size(I);
    
    
    
    psnr1 = double(0);
    psnr2 = double(0);
    psnr3 = double(0);
    
   
    
   
        for t=1:length(comNums)
            number = comNums(t);
            
            %embedding
                [IS1,IS2,IS3,EC] = embedding(I,msg,t,number,dis);
                myPrint(fileLog,['number:',num2str(number)]);
                myPrint(fileLog,['EC(bpp):',num2str(EC/3/m/n)]);
                myPrint(fileLog,['EC(bits):',num2str(EC)]);
                psnr1 =  PSNR(uint8(I),uint8(IS1));       
                psnr2 =  PSNR(uint8(I),uint8(IS2));     
                psnr3 =  PSNR(uint8(I),uint8(IS3));

                myPrint(fileLog,['PSNR1:',num2str(psnr1)]);
                myPrint(fileLog,['PSNR2:',num2str(psnr2)]);
                myPrint(fileLog,['PSNR3:',num2str(psnr3)]);
        end
end
fclose(fileLog);
end