function mainPDH(filePath,stateRandom,dis,comNums)
%filePath - ��Ҫ�����ͼƬ�����ļ��У����Զ�ɨ��
%epoch - ���ԵĴ���
%stateRandom - ������Ƿ�Ҫ�̶�1-�̶� 0-�����
%stateFlag - �ж�Major Assisiant����shadow �Ƿ�Ҫ���� 1-���� 0-�̶���һ������major

%��־�ļ�
fileLog = fopen('log.txt','w');

%��Ҫ�����ͼƬ�����ļ��У����Զ�ɨ��
fileFolder=fullfile(filePath);
dirOutput=dir(fullfile(fileFolder,'*.*'));
fileNames={dirOutput.name};

%ͼƬ����Ŀ
imageNumber = size(fileNames,2);
    
msg = createMSG(6*512*512,stateRandom);
    
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
               PVDHistogram( I, IS1, IS2,IS3,-20,20,fileNames{loop} )  
        end
  
  
    
end

fclose(fileLog);
end