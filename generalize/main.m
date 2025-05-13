function main(filePath,stateRandom,dis,comNums)
%filePath - ��Ҫ�����ͼƬ�����ļ��У����Զ�ɨ��
%stateRandom - ������Ƿ�Ҫ�̶�1-�̶� 0-�����

%��־�ļ�
fileLog = fopen('log.txt','w');

%��Ҫ�����ͼƬ�����ļ��У����Զ�ɨ��
fileFolder=fullfile(filePath);
dirOutput=dir(fullfile(fileFolder,'*.*'));
fileNames={dirOutput.name};
%ͼƬ����Ŀ
imageNumber = size(fileNames,2);
    

msg = createMSG(10*512*512,stateRandom);
    
%��������ͼƬ���ǵô�3��ʼ��ǰ������ . �� .. Ҫ����
for loop = 4:imageNumber
    myPrint(fileLog,['image-',num2str(loop-2),':',fileNames{loop}]);
    
    path = strcat(strcat(filePath,'/'),fileNames{loop});
    I = imread(path);  %ԭʼͼ��
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