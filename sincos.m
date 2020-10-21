fs = 22000;                         %frequency of audio signal
ts = 1/fs;                          %step time
N = 200;            
tmax = (N-1)*ts                     %maximum value of time (5 seconds) 
t = 0 : 1/fs : tmax;                %defining time domain for plotting 
f1 = 100;                           % frequency (Hz) for h1
A1 = 4;                            %amplitude for h2
w = 0;                              % phase for h3
h1 = A1 * cos( 2 * pi * f1 * t + w );
plot(h1)