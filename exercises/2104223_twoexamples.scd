/*
23.04.21
checking two examples combined
*/

// play two sounds together example 1


(
d={|l,h,f,p|({Ringz.ar(LFPulse.ar(f,p,0.01),exprand(l,h),0.5)}!20).sum};{d.(50,100,2,[0,1/4])+d.(3e3,1e4,4,0)+d.(2e2,3e3,1,0.5)*3e-4!2}.play;
d={|l,h,f,p,n|sum({Ringz.ar(LFPulse.ar(f,p,0.01),exprand(l,h).round(n),0.5)}!20)};{d.(50,150,[2,1,1],[0,1/4,3/4],[1,40,50])*3e-4!2}.play;
)


// play two sounds together example 2

(
d={|l,h,f,p|({Ringz.ar(LFPulse.ar(f,p,0.01),exprand(l,h),0.5)}!20).sum};{d.(50,100,2,[0,1/4])+d.(3e3,1e4,4,0)+d.(2e2,3e3,1,0.5)*3e-4!2}.play;
f=0;Routine({inf.do{|i|f=i/12+f%[4,3];{Formant.ar(2**f*100,2**(i%8*f*0.2)*100,100)*Line.kr(0.1,0,1)}.play;0.25.wait;}}).play;
)

// analysis of line 18 into its parts
(
d = { | l, h, f, p | ({ Ringz.ar( LFPulse.ar(f, p, 0.01), exprand(l, h), 0.5) } ! 20).sum };
{d.(50,100,2,[0,1/4])+d.(3e3,1e4,4,0)+d.(2e2,3e3,1,0.5)*3e-4!2}.play;
)
// play a sound for 10 sec then stop

// this is called a Routine

(
{ // this is the Routine
	var synth, d;
	d = {|l,h,f,p|({Ringz.ar(LFPulse.ar(f,p,0.01),exprand(l,h),0.5)}!20).sum};
	synth = {d.(50,100,2,[0,1/4])+d.(3e3,1e4,4,0)+d.(2e2,3e3,1,0.5)*3e-4!2}.play;
	10.wait;
	synth.release(0.5);
}.fork;

)

d

// understanding phase
(
{
	SinOsc.ar(110, [0, pi], 0.3)
}.plot
)