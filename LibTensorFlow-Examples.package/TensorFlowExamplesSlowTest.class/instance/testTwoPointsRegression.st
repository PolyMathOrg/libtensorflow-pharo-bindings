testing - Regression
testTwoPointsRegression
	| function loss net results  interval xs ys |
	net := RegressionNNExample new.
	function := RegressionNNExample exampleFunction.
	xs := {{0.1}. {0.6}}.
	ys := {{function value: xs first first}. 
			{function value: xs second first}}.
	interval := 1 to: xs size.
	1000 timesRepeat: [ |index |
		index := interval atRandom.
		net predict: {xs at: index} andLearnFrom:{ys at: index}].
	results := net predict: xs andCompareTo: ys.
	loss := results numbersAt: 2.
	self assert: loss first closeTo: 0.
	