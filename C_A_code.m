clc;
close all;
clear all;

%% A: For phase tap (3,8) 
shiftreg1 = [1; 1; 1; 1; 1; 1; 1; 1; 1; 1];
shiftreg2 = [1; 1; 1; 1; 1; 1; 1; 1; 1; 1];
C_A_code = zeros(1023,1);


for i = 1:1023
    %Shift Register 1
    Num1 = shiftreg1(10);
    xor_output1 = xor(shiftreg1(3), shiftreg1(10));
    G1 = circshift(shiftreg1,1);
    G1(1) = xor_output1;
    shiftreg1 = G1;
    
    %Shift Register 2
    Num2 = xor(shiftreg2(3), shiftreg2(8));
    xor_output21 = xor(shiftreg2(2), shiftreg2(3));
    xor_output22 = xor(xor_output21, shiftreg2(6));
    xor_output23 = xor(xor_output22, shiftreg2(8));
    xor_output24 = xor(xor_output23, shiftreg2(9));
    xor_output2 = xor(xor_output24, shiftreg2(10));
    G2 = circshift(shiftreg2,1);
    G2(1) = xor_output2;
    shiftreg2 = G2;
    
    C_A_code(i,1) = xor(Num1, Num2);
end

for i = 1:1023
    if C_A_code(i,1) == 0
        C_A_code(i,1) = -1;
    end
end

C_A_Trans = transpose(C_A_code);
auto_corr1 = zeros(1023,1);

for i = 0:1022
    C_A_shifted = circshift(C_A_code,i);
    auto_corr1(i+1) = C_A_Trans * C_A_shifted;
end

figure;
plot(auto_corr1)
title('Auto Correlation For (3,8)')
disp(sprintf('Peak of the Auto Correlation in part A = %d', max(auto_corr1)));


%% B: For phase tap (2,6)
shiftreg1 = [1; 1; 1; 1; 1; 1; 1; 1; 1; 1];
shiftreg2 = [1; 1; 1; 1; 1; 1; 1; 1; 1; 1];
C_A_code_new = zeros(1023,1);


for i = 1:1023
    %Shift Register 1
    Num1 = shiftreg1(10);
    xor_output1 = xor(shiftreg1(3), shiftreg1(10));
    G1 = circshift(shiftreg1,1);
    G1(1) = xor_output1;
    shiftreg1 = G1;
    
    %Shift Register 2
    Num2 = xor(shiftreg2(2), shiftreg2(6));
    xor_output21 = xor(shiftreg2(2), shiftreg2(3));
    xor_output22 = xor(xor_output21, shiftreg2(6));
    xor_output23 = xor(xor_output22, shiftreg2(8));
    xor_output24 = xor(xor_output23, shiftreg2(9));
    xor_output2 = xor(xor_output24, shiftreg2(10));
    G2 = circshift(shiftreg2,1);
    G2(1) = xor_output2;
    shiftreg2 = G2;
    
    C_A_code_new(i,1) = xor(Num1, Num2);
end

for i = 1:1023
    if C_A_code_new(i,1) == 0
        C_A_code_new(i,1) = -1;
    end
end

C_A_Trans = transpose(C_A_code_new);
auto_corr2 = zeros(1023,1);

for i = 0:1022
    C_A_shifted = circshift(C_A_code_new,i);
    auto_corr2(i+1) = C_A_Trans * C_A_shifted;
end

figure;
plot(auto_corr2)
title('Auto Correlation For (2,6)')
disp(sprintf('Peak of the Auto Correlation in part B = %d', max(auto_corr2)))
  
%% C: Cross - correlation
C_A_Trans = transpose(C_A_code_new);
cross_corr = zeros(1023,1);

for i = 0:1022
    C_A_shifted = circshift(C_A_code,i);
    cross_corr(i+1) = C_A_Trans * C_A_shifted;
end

figure;
plot(cross_corr)
title('Cross Correlation')
max(cross_corr);
disp(sprintf('Peak of the Cross Correlation in part C = %d', max(cross_corr)))
