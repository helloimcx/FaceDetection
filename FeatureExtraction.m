N = 21;   % ѵ������ģ
cb = zeros(N,1); %���ÿ����Ƭ��cb��ֵ
cr = zeros(N,1); %���ÿ����Ƭ��cr��ֵ
C_ = zeros(2,2,N); %���ÿ����Ƭ��Э�������

% ��ȡѵ����ͼ������
for i=1:N
    imageName=strcat('D:\FaceDetection\skin\',num2str(i),'.jpg');
    I = imread(imageName);
    si=size(I);
    m=si(1);
    n=si(2);
    img=rgb2ycbcr(I);

    temp_cb = medianFiltering(img(:,:,2));
    temp_cr = medianFiltering(img(:,:,3));
    
    cb(i,1) = mean(temp_cb(:));
    cr(i,1) = mean(temp_cr(:));
    
    C_(:,:,i) = cov(double(temp_cb),double(temp_cr));
end

mean_cb = mean(cb(:));
mean_cr = mean(cr(:));
str_cb = ['the value of mean_cb is ' num2str(mean_cb)];
disp(str_cb);
str_cr = ['the value of mean_cr is ' num2str(mean_cr)];
disp(str_cr);

% Э����̫С��Ӧ�ð�������������Ϊѵ����
C = mean(C_, 3) * 10;
% C = cov(cb, cr);
disp(C);







        
        




