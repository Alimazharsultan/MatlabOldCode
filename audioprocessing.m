%Ali bin Mazhar
%160487
clc
clear all
[s, fs] = audioread('ali.wav');     %loading the recorder voice
x = s(:,1);                         %making x(t) of the recorderd value
fs = 44100;                         %frequency of audio signal
ts = 1/fs;                          %step time
N = size(s);                        %size of signal
N = N(1)            
tmax = (N-1)*ts                     %maximum value of time (5 seconds) 
t = 0 : 1/fs : tmax;                %defining time domain for plotting 
fsteps = fs/(N-1);                  % steps for frequency plotting
f =  -fs/2 : fsteps : fs/2;         %defining the frequency domain for plotting fourier transform
f1 = 250;                           % frequency (Hz) for h1
A1 = .4;                            %amplitude for h2
w = 0;                              % phase for h3
h1 = A1 * cos( 2 * pi * f1 * t + w );
h2 = zeros(size(t)); h2(20000) = 1;h2(25000) = 1;h2(30000) = 1;h2(35000) = 1;h2(40000) = 1;
h3 = zeros(size(t)); h3(t>=1) = 1;h3 = 0.5*sin(2*pi*f1*t).*exp(1*t);
h4 = f
h5 = 0.05*t.*exp(0.05*t);
h = h5;
%y = zeros(size(x),1);
y = conv(x, h);
X = fftshift(fft(x));
H = fftshift(fft(h));
Y = fftshift(fft(y));
%x = fft((x));
%H = fft((h));
%C = fft((c));
subplot(3,2,1);
plot(t,s);
title('Original Sound')
subplot(3,2,3);
plot(h);
title('h(t)')
subplot(3,2,5);
plot(y);
title('Convolved signal')
subplot(3,2,2);
stem(f,abs(X));
title('Fourier of Original SOund')
subplot(3,2,4);
stem(f,abs(H));
title('Fourier of h(t)')
subplot(3,2,6);
stem(abs(Y));
title('Fourier of Convolved')
sound( y, fs, 16 );