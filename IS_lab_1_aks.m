%Classification using perceptron % obuolių ir kriaušių atskyrimas apmokytu perceptronu
clc; clear; close all;
%Reading apple images
A1=imread('apple_04.jpg');
A2=imread('apple_05.jpg');
A3=imread('apple_06.jpg');
A4=imread('apple_07.jpg');
A5=imread('apple_11.jpg');
A6=imread('apple_12.jpg');
A7=imread('apple_13.jpg');
A8=imread('apple_17.jpg');
A9=imread('apple_19.jpg');

%Reading pears images
P1=imread('pear_01.jpg');
P2=imread('pear_02.jpg');
P3=imread('pear_03.jpg');
P4=imread('pear_09.jpg');

%Calculate for each image, colour and roundness
%For Apples
hsv_value_A1=spalva_color(A1); %color
metric_A1=apvalumas_roundness(A1); %roundness
hsv_value_A2=spalva_color(A2); %color
metric_A2=apvalumas_roundness(A2); %roundness
hsv_value_A3=spalva_color(A3); %color
metric_A3=apvalumas_roundness(A3); %roundness
hsv_value_A4=spalva_color(A4); %color
metric_A4=apvalumas_roundness(A4); %roundness
hsv_value_A5=spalva_color(A5); %color
metric_A5=apvalumas_roundness(A5); %roundness
hsv_value_A6=spalva_color(A6); %color
metric_A6=apvalumas_roundness(A6); %roundness
hsv_value_A7=spalva_color(A7); %color
metric_A7=apvalumas_roundness(A7); %roundness
hsv_value_A8=spalva_color(A8); %color
metric_A8=apvalumas_roundness(A8); %roundness
hsv_value_A9=spalva_color(A9); %color
metric_A9=apvalumas_roundness(A9); %roundness

%For Pears
hsv_value_P1=spalva_color(P1); %color
metric_P1=apvalumas_roundness(P1); %roundness
hsv_value_P2=spalva_color(P2); %color
metric_P2=apvalumas_roundness(P2); %roundness
hsv_value_P3=spalva_color(P3); %color
metric_P3=apvalumas_roundness(P3); %roundness
hsv_value_P4=spalva_color(P4); %color
metric_P4=apvalumas_roundness(P4); %roundness

%selecting features(color, roundness, 3 apples and 2 pears)
%------apmokinimui naudojame puse nuotrauku 3 obuolius ir 2 kriauses
%---------------------mokinimi pasirinkome------------A1,A2,A3,P1,P2
%building matrix 2x5
x1_mok=[hsv_value_A1 hsv_value_A2 hsv_value_A3 hsv_value_P1 hsv_value_P2];
x2_mok=[metric_A1 metric_A2 metric_A3 metric_P1 metric_P2];
% estimated features are stored in matrix P:
P_mok=[x1_mok;x2_mok];
%Desired output vector
Tikslas_mok=[1;1;1;-1;-1]; %%%%%%%%%%%( Turi buti 1=obuolys, -1=kriause, sablone buvo klaida)

disp('3 obuoliai ir 2 kriauses nuskaitytos');
disp('spalvos ');%disp(x1);
disp('apvalumas ');%disp(x2);
disp('+1=obuolys, -1=kriause');%disp((T'));
%disp('bendrai');
disp(P_mok);
disp((Tikslas_mok')); %horizontaliam vaizdui transponuojame
figure(1)
plot(x1_mok,x2_mok,'d');xlabel('apvalumas');ylabel('spalva');title('spalva ir apvalumas');
hold on; %%% piešime ant to paties grafiko

%%%%%% train single perceptron with two inputs and one output
% generate random initial values of w1, w2 and b 
%%%%%% pradinei iteracijai bet kokius svorinius koeficientus pasirenkame
w1 = randn(1);
w2 = randn(1);
b = randn(1);
% w1=0.3714; %%%%%%%%%%%%%% uzfiksuojame kad nesokinetu pradiniai w1, w2 ir b
% w2=-0.2256; 
% b=1.1174 ;


disp('pradinis w1');disp(w1);
disp('pradinis w2 ');disp(w2);
disp('pradinis b');disp(b);

% calculate wieghted sum with randomly generated parameters
%%%%%%skaičiuojame svorines sumas - Haikino pradžia

% v1= <...>; % write your code here  %%%%%%%%%%%skaičiuojame svorines sumas
svor_suma_1= x1_mok(1) * w1 + x2_mok(1) * w2 + b;            % 
if svor_suma_1 > 0  % output of the i-th perceptron
	out_1 = 1;
else
	out_1= -1;
end
klaid_1 = Tikslas_mok(1) - out_1;% calculate the error
% repeat the same for the rest 4 inputs x1 and x2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
svor_suma_2= x1_mok(2) * w1 + x2_mok(2) * w2 + b;             %%
if svor_suma_2 > 0 % output of the i-th perceptron
	out_2 = 1;
else
	out_2= -1;
end
klaid_2 = Tikslas_mok(2) - out_2;% calculate the error
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
svor_suma_3= x1_mok(3) * w1 + x2_mok(3) * w2 + b;             %%%
if svor_suma_3 > 0 % output of the i-th perceptron
	out_3 = 1;
else
	out_3= -1;
end
klaid_3 = Tikslas_mok(3) - out_3;% calculate the error
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
svor_suma_4= x1_mok(4) * w1 + x2_mok(4) * w2 + b;             %%%%
if svor_suma_4 > 0 % output of the i-th perceptron
	out_4 = 1;
else
	out_4= -1;
end
klaid_4 = Tikslas_mok(4) - out_4;% calculate the error
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
svor_suma_5= x1_mok(5) * w1 + x2_mok(5) * w2 + b;             %%%%%
if svor_suma_5 > 0 % output of the i-th perceptron
	out_5 = 1;
else
	out_5= -1;
end
klaid_5 = Tikslas_mok(5) - out_5;% calculate the error
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% % % % % % % % % % 
% disp('svor sumos pradines');
% disp(svor_suma_1);
% disp(svor_suma_2);
% disp(svor_suma_3);
% disp(svor_suma_4);
% disp(svor_suma_5);

klaida_bendra = abs(klaid_1) + abs(klaid_2) + abs(klaid_3) + abs(klaid_4) + abs(klaid_5);

disp('bendra klaida');
disp(klaida_bendra);

%%%%%%%%%%%%%%%%%%%%%%uzfiksavus w1, w2, b pradinius ties random const, 
%%%%%%%%%%%%%%%%%%%%%%didinant pataisa (pat) sparteja apsimokinimas, 
%%%%%%%%%%%%%%%%%%%%%%%mazeja zingsniu skaicius paklaidai iki nulio sumazeti
pat=0.1;   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%pataisos koeficientas pseudorandom pradzioje
zingsnis=0; %pradedame apmokinima

disp('pataisa');disp(pat);
disp('zingsnis');disp(zingsnis);
disp('pradedam apmokinti');
% write training algorithm
while klaida_bendra ~= 0 % executes while the total error is not 0
	zingsnis=zingsnis+1; 
    
    % here should be your code of parameter update
    %   calculate output for current example
    %   calculate error for current example
    %   update parameters using current inputs ant current error
    % 	w1 = 
    w1 = w1 + pat*klaid_1*x1_mok(1); %%% iteracijoje pridedam pataisele svor koef 1 nuo kiekvienos klaidos
    w1 = w1 + pat*klaid_2*x1_mok(2);
    w1 = w1 + pat*klaid_3*x1_mok(3);
    w1 = w1 + pat*klaid_4*x1_mok(4);
    w1 = w1 + pat*klaid_5*x1_mok(5);

    %   w2 =
    w2 = w2 + pat*klaid_1*x2_mok(1);%%% iteracijoje pridedam pataisele svor koef 2 nuo kiekvienos klaidos
    w2 = w2 + pat*klaid_2*x2_mok(2);
    w2 = w2 + pat*klaid_3*x2_mok(3);
    w2 = w2 + pat*klaid_4*x2_mok(4);
    w2 = w2 + pat*klaid_5*x2_mok(5);

    %   b =
    b = b + pat*klaid_1;   %% iteracijoje pridedam pataisele  b nuo kiekvienos klaidos
    b = b + pat*klaid_2;
    b = b + pat*klaid_3;
    b = b + pat*klaid_4;
    b = b + pat*klaid_5;


    %   Test how good are updated parameters (weights) on all examples used for training:
    %   calculate outputs and errors for all 5 examples using current values of the parameter set {w1, w2, b}
    %   calculate 'v1', 'v2', 'v3',... 'v5'
    svor_suma_1 = x1_mok(1) * w1 + x2_mok(1) * w2 + b;
    svor_suma_2 = x1_mok(2) * w1 + x2_mok(2) * w2 + b;
    svor_suma_3 = x1_mok(3) * w1 + x2_mok(3) * w2 + b;
    svor_suma_4 = x1_mok(4) * w1 + x2_mok(4) * w2 + b;
    svor_suma_5 = x1_mok(5) * w1 + x2_mok(5) * w2 + b;   
    %   calculate 'y1', ..., 'y5'
    out_1 = sign(svor_suma_1);
    out_2 = sign(svor_suma_2);
    out_3 = sign(svor_suma_3);
    out_4 = sign(svor_suma_4);
    out_5 = sign(svor_suma_5);
    %     
    %   calculate 'e1', ... 'e5'   %%%%%%%%% atnaujiname paklaidas
    klaid_1 = Tikslas_mok(1) - out_1;
    klaid_2 = Tikslas_mok(2) - out_2;
    klaid_3 = Tikslas_mok(3) - out_3;
    klaid_4 = Tikslas_mok(4) - out_4;
    klaid_5 = Tikslas_mok(5) - out_5;
	% calculate the total error for these 5 inputs 
	klaida_bendra = abs(klaid_1) + abs(klaid_2) + abs(klaid_3) + abs(klaid_4) + abs(klaid_5);
end

disp('zingsniu atlikta');disp(zingsnis);  %%%%isvedam kas gavosi po apmokinimo
disp('pataisa');disp(pat);
disp('surastas w1');disp(w1);
disp('surastas w2');disp(w2);
disp('surastas b');disp(b);
disp('bendra klaida');disp(klaida_bendra);
disp(' ');
disp('apmokinima baigeme, pradedame testavima');
%%%%% toliau testuosime kaip atpazysta

% mokymui buvo rinkinys: A1,A2,A3,P1,P2
% testavimui liko nepanaudoti A4, A5, A6, A7, A8, A9 ir P3 su P4
% building test matrix 2x7
x1_test = [ hsv_value_A4 hsv_value_A5 hsv_value_A6 hsv_value_A7 hsv_value_A8 hsv_value_A9 hsv_value_P3 hsv_value_P4];
x2_test = [    metric_A4   metric_A5    metric_A6    metric_A7     metric_A8  metric_A9    metric_P3   metric_P4];

% estimated test features are stored in test matrix P:
P_testinis = [x1_test; x2_test];
% expected output vector:
Tikslas_test = [1;1;1;1;1;1;-1;-1];
%%%%%%%%%%%%%%%+1=obuolys, -1=kriause

disp(P_testinis);
disp((Tikslas_test')); %horizontaliam vaizdui transponuojame

figure(1)
plot(x1_test,x2_test,'x');xlabel('apvalumas');ylabel('spalva');title('spalva ir apvalumas x-testuojami romb-mokymas');
hold off; %%% piešime ant to paties grafiko kaip pirmą

% neuron values for the test input:
skaic_test = [ 0; 0; 0; 0; 0; 0; 0; 0];

% activation-fn values for the test input:
ats_test = [ 0; 0; 0; 0; 0; 0; 0; 0];



% produced errors vector for test input:
atsakymas = [ 0; 0; 0; 0; 0; 0; 0; 0];

    skaic_test(1) = x1_test(1) * w1 + x2_test(1) * w2 + b;
    skaic_test(2) = x1_test(2) * w1 + x2_test(2) * w2 + b;
    skaic_test(3) = x1_test(3) * w1 + x2_test(3) * w2 + b;
    skaic_test(4) = x1_test(4) * w1 + x2_test(4) * w2 + b;
    skaic_test(5) = x1_test(5) * w1 + x2_test(5) * w2 + b;
    skaic_test(6) = x1_test(6) * w1 + x2_test(6) * w2 + b;
    skaic_test(7) = x1_test(7) * w1 + x2_test(7) * w2 + b;
    skaic_test(8) = x1_test(8) * w1 + x2_test(8) * w2 + b;

    ats_test(1) = sign(skaic_test(1));
    ats_test(2) = sign(skaic_test(2));
    ats_test(3) = sign(skaic_test(3));
    ats_test(4) = sign(skaic_test(4));
    ats_test(5) = sign(skaic_test(5));
    ats_test(6) = sign(skaic_test(6));
    ats_test(7) = sign(skaic_test(7));
    ats_test(8) = sign(skaic_test(8));

    atsakymas(1) = Tikslas_test(1) - ats_test(1);
    atsakymas(2) = Tikslas_test(2) - ats_test(2);
    atsakymas(3) = Tikslas_test(3) - ats_test(3);
    atsakymas(4) = Tikslas_test(4) - ats_test(4);
    atsakymas(5) = Tikslas_test(5) - ats_test(5);
    atsakymas(6) = Tikslas_test(6) - ats_test(6);
    atsakymas(7) = Tikslas_test(7) - ats_test(7);
    atsakymas(8) = Tikslas_test(8) - ats_test(8);


disp('Testiniai duomenys');disp(P_testinis);
disp('turi atpažinti');disp(Tikslas_test');
disp('atpažino:');disp(ats_test');
disp('paklaida');disp(atsakymas');

disp('palaužymui galima apgauti įrašant į x1_mok ir į x2_mok obuoliu spalvas ir apvalumus į kriaušių pozicijas');
disp('If paklaida=00000000 GOTO moodle execute(pažymėti laboratorinį atlikta)');

