"SC_JACK_DEFAULT_OUTPUTS".setenv(
        "darkice:left,"
        "darkice:right,"
);

ServerQuit.add({
	'FAIL: scsynth quit'.postln;
	1.exit();
}, Server.default);
