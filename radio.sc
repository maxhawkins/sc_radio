Server.default.waitForBoot({

b = Buffer.alloc(s,44100 * 2, 2);

// play a demo sound

SynthDef("help-PingPong",{ arg out=0,bufnum=0,feedback=0.5,delayTime=0.2;
    var left, right;
    left = Decay2.ar(Impulse.ar(0.7, 0.25), 0.01, 0.25,
        SinOsc.ar(SinOsc.kr(3.7,0,200,500)));
    right = Decay2.ar(Impulse.ar(0.5, 0.25), 0.01, 0.25,
        Resonz.ar(PinkNoise.ar(4), SinOsc.kr(2.7,0,1000,2500), 0.2));

    Out.ar(0,
        PingPong.ar(bufnum, [left,right], delayTime, feedback, 1)
    )
}).play(s,[\out, 0, \bufnum, b.bufnum,\feedback,0.5,\delayTime,0.1]);

});
