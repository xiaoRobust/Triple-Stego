function main(filePath,stateRandom,dis,comNums)


% The log file
fileLog = fopen('log.txt','w');

% Open the images
fileFolder=fullfile(filePath);
dirOutput=dir(fullfile(fileFolder,'*.*'));
fileNames={dirOutput.name};
% The number of images
imageNumber = size(fileNames,2);
    
% Construct the random bits
msg = createMSG(10*512*512,stateRandom);
    
% Travel each image
for loop = 4:imageNumber
    myPrint(fileLog,['image-',num2str(loop-2),':',fileNames{loop}]);
    
    path = strcat(strcat(filePath,'/'),fileNames{loop});
    I = imread(path);  % Read the image
    I = double(I);
    [m,n]=size(I);
    
    
    % The PSNR for three stegos
    psnr1 = double(0);
    psnr2 = double(0);
    psnr3 = double(0);
    
   
    
        % Travel each number of Orientation Combinations
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


            % Extraction 
            [ msg_extract,IS ] = extracting( IS1,IS2,IS3,msg,dis,t,number );
            % Testing result
            if 0==testing(fileLog,I,IS,msg,msg_extract)
                 error('error');
            end

        end
end
fclose(fileLog);
end