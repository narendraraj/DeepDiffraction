%produce average image for NN training
%Weizong, April, 2017
tot_cat=38;%80,120
chk_err=0;
for i=1:tot_cat
    try
        data=load(['image_sum_tilt_',num2str(i),'_cat38_14mrad.mat']);
        if i==1
            image_sum=data.image_sum;
            num=double(data.num);
        else
            image_sum=image_sum+data.image_sum;
            num=num+double(data.num);
        end
%         figure;imshow(image_sum(:,:,1)/double(num),[])
    catch ME
        disp(ME.message)
        chk_err=1;
    end
end
avgI=image_sum/num;
avgI=(avgI+rot90(avgI,1)+rot90(avgI,2)+rot90(avgI,3))/4;
avgI=(avgI+flip(avgI,2))/2;
figure;imshow(avgI(:,:,1),[])
if chk_err==0
    save('average_image_data.mat','avgI')
    disp('Average Image is saved.')
end