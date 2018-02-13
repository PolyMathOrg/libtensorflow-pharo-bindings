examples
exampleTrainedOn: function
	| net rnd interval xs ys |
	net := self new.
	rnd := Random new.
	xs :=  (1 to: 100) collect: [:i | {rnd next}].
	ys := xs collect: [:x | {function value: x first}].
	interval := 1 to: xs size.
	
	10000 timesRepeat: [
		|x indices y |
		indices := (1 to: 60) collect: [:i| interval atRandom].
		x := indices collect: [:index | xs at: index].
		y :=  indices collect: [:index | ys at: index].
		net predict: x andLearnFrom: y].
	^ net