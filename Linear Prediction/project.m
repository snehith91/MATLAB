speech=wavread('C:\Users\Pranathi Nandhigam\Desktop\sp20.wav');
figure(1);
plot(speech)
xlabel('time');
ylabel('amplitude');
figure(2);
sound(speech,8000);
specgram(speech,512,8000,hamming(40));
input_frame=speech(3000:4739);
figure(3);
plot(input_frame)
xlabel('time');
ylabel('amplitude');
figure(4);
periodogram(input_frame,[],512);
[ai,sigma_square]=lpc(input_frame,10);
sigma=sqrt(sigma_square);
[HI,WI]=freqz(ai,1,512);
[H,W]=freqz(1,ai,512);
figure(5);
plot(W,20*log10(abs(H)),'-',WI,20*log10(abs(HI)),'--');
xlabel('normalized frequency');
ylabel('magnitude');
figure(6);
periodogram(input_frame,[],512,2)
hold on;
plot(W/pi,20*log10(sigma*abs(H)));
xlabel('frequency');
ylabel('power density');
hold off;
figure(8);
zplane(1,ai);
LP_residual=filter(ai,1,input_frame);
figure(9);
plot(LP_residual)
xlabel('time');
ylabel('amplitude');
figure(10);
periodogram(LP_residual,[],512);
figure(11);
output_frame=filter(1, ai,LP_residual);
plot(output_frame);
xlabel('time');
ylabel('amplitude');
excitation = [1;zeros(64,1);1;zeros(64,1);1;zeros(64,1);1;zeros(44,1)];
gain=sigma/sqrt(1/65);
figure(12);
plot(gain*excitation);
xlabel('time');
ylabel('amplitude');
figure(13);
periodogram(gain*excitation,[],512);
synt_frame=filter(gain,ai,excitation);
figure(14);
plot(synt_frame);
xlabel('time');
ylabel('amplitude');
figure(15);
periodogram(synt_frame,[],512);


speech_HF=wavread('C:\Users\Pranathi Nandhigam\Desktop\sp20_airport_sn5.wav');
input_frame=speech_HF(3500:4739);
figure(16);
plot(input_frame);
xlabel('time');
ylabel('amplitude');
figure(17);
pwelch(input_frame);
[ai, sigma_square]=lpc(input_frame,10);
sigma=sqrt(sigma_square);
excitation=randn(240,1);
synt_frame=filter(sigma,ai,excitation);
figure(18);
plot(synt_frame);
xlabel('time');
ylabel('amplitude');
figure(19);
pwelch(synt_frame);



