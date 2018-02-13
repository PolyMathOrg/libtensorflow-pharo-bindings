testing-ols
testOLS: ols
	| x y betas |
	x := TF_Tensor fromFloats: #(
		(1  2   3)
		(6  7   8)
		(4  5   6)
		(9  2   3)
		(1 10  2)
	).

	y := TF_Tensor fromFloats: #(
		(14)
		(44)
		(32)
		(22)
		(27)
	).
	
	betas := ols regress: x on: y.
	self assert: (betas first closeTo: 1);
		assert: (betas second closeTo: 2);
		assert: (betas third closeTo: 3)
	
		
