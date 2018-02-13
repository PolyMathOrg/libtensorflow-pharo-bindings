testing - Regression
testSinglePointRegression
	| function loss net results rnd x y |
	net := RegressionNNExample new.
	function := RegressionNNExample exampleFunction.
	rnd := Random new.
	x := rnd next.
	y := function value: x.
	100 timesRepeat:[net predict: {{x}} andLearnFrom:{{y}}].
	results := net predict: {{x}} andCompareTo: {{y}}.
	loss := results numbersAt: 2.
	self assert: loss first closeTo: 0.
	