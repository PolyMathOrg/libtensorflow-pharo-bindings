testing session
testSessionFinalizationReleasesExternalMemory 
	" WeakArray restartFinalizationProcess "
	| tries total handles graph |
	total := 0.
	tries := 20.
	graph := TF_Graph create.
	handles := Set new.
	
	20 timesRepeat: [
		total := total + tries.
		handles addAll: ((1 to: tries) collect: [:i |
			Smalltalk garbageCollect.
			(TF_Session on: graph) getHandle]).
		handles size < total ifTrue: [
			^ self]].
	
	self assert: (handles size) < total.
