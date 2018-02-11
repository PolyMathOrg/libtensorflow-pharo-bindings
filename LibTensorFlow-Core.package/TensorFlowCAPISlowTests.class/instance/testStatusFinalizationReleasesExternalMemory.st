testing status
testStatusFinalizationReleasesExternalMemory
	" WeakArray restartFinalizationProcess "
	| handles |
	handles := (1 to: 11) collect: [:i |
		Smalltalk garbageCollect.
		TF_Status create getHandle].

	self assert: (handles asSet size) < 11.