examples
exampleTrainedAndPlot
	" self exampleTrainedAndPlot "
	| function net predictor g |
	function :=  self exampleFunction.
	net := self exampleTrainedOn: function.
	predictor := [:x |
		| result |
		result := net predict: {{x}}.
		result asNumbers first first] .
	
	g := FunctionGraphMorph new.
	g domain: (0 to: 1).
	g addFunction: function color: Color green.
	g addFunction: predictor color: Color red.
	(g embeddedInMorphicWindowLabeled: 'graph') openInWorld.
	^ net