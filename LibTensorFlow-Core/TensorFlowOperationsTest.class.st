Class {
	#name : #TensorFlowOperationsTest,
	#superclass : #TestCase,
	#instVars : [
		'library'
	],
	#category : 'LibTensorFlow-Core'
}

{ #category : #initialization }
TensorFlowOperationsTest >> assert: aNumber closeTo: anotherNumber [
	^ self
		assert: (aNumber closeTo: anotherNumber)
		description: (self comparingStringBetween: aNumber and: anotherNumber)

]

{ #category : #'other operations' }
TensorFlowOperationsTest >> assert: integers sizeOn: dimension is: expected [
	| graph session const result size |
	graph := TF_Graph create.
	const := graph const: integers asInt32Tensor.
	
	size := const sizeOn: dimension.

	session := TF_Session on: graph.
	result := session runOutput: size output.
	
	self assert: expected equals: result asNumbers.
]

{ #category : #initialization }
TensorFlowOperationsTest >> assertAll: expectedArray closeTo: actualArray [
	expectedArray with: actualArray do: [:expected :actual |
		self assert: expected closeTo: actual]
]

{ #category : #'other operations' }
TensorFlowOperationsTest >> assertSlice: integers from: begin size: size is: expected [
	| graph session const result slice |
	graph := TF_Graph create.
	const := graph const: integers asInt32Tensor.
	slice := const sliceFrom: begin asInt32Tensor size: size asInt32Tensor.
	session := TF_Session on: graph.
	result := session runOutput: slice output.
	self assert: expected equals: result asNumbers
]

{ #category : #'other operations' }
TensorFlowOperationsTest >> mean: aCollectionOfNumbers [
	
	aCollectionOfNumbers isEmpty ifTrue: [^0].
	^((aCollectionOfNumbers
		inject: 0
		into: [:subTotal :next | subTotal + next]) / aCollectionOfNumbers size)
		asFloat
]

{ #category : #private }
TensorFlowOperationsTest >> percentile: percent from: collection [
	| position sorted |
	position := (collection size * percent) ceiling.
	sorted := collection sorted: [:x :y| x <= y].
	^ sorted at: position
]

{ #category : #initialization }
TensorFlowOperationsTest >> setUp [
	library := TensorFlowCAPI current
]

{ #category : #initialization }
TensorFlowOperationsTest >> should: aBlock raiseError: aString [
	| message |
	message := 'No Error was signaled'.
	aBlock ifError: [ :description :receiver | message := description ].
	self assert: 'Error: ' , aString equals: message
]

{ #category : #'other operations' }
TensorFlowOperationsTest >> standardDeviation: aCollectionOfNumbers [	
	^(self variance: aCollectionOfNumbers) sqrt
]

{ #category : #'random ops' }
TensorFlowOperationsTest >> testGraphMultinomialShaped [
	| graph session result random values shape |	
	graph := TF_Graph create.
	shape := graph const:  {{10. 10}} asFloatTensor.
	shape log.
	random := graph multinomialShaped: shape numSamples: 25.

	session := TF_Session on: graph.
	result := session runOutput: (random output: 0).
	values := result allFloats.
	
		
	self assert: result shape equals: #(1 25).
	self assert: values size equals: 25.
	self assert: values min  >= 0.
	self assert: values max <=1.


	
]

{ #category : #'random ops' }
TensorFlowOperationsTest >> testGraphNormal [
	| graph session result random values std theoreticalDecile expected |
	graph := TF_Graph create.
	random := graph randomNormalShaped: #(100 100 10).
	session := TF_Session on: graph.
	result := session runOutput: (random output: 0).
	values := result allFloats.
	theoreticalDecile := -1.1840324666939051.
	std := self standardDeviation: values.
	self assert: result shape equals: #(100 100 10).
	self assert: values size equals: 100 * 100 * 10.
	self assert: values min + 2 < 0.01.
	self assert: 2 - values max < 0.01.
	self assert: (self mean: values) abs < (0.01 * std).
	expected := {theoreticalDecile.
	theoreticalDecile negated}.
	#(0.1 0.9)
		with: expected
		do: [ :p :e | 
			| observed |
			observed := self percentile: p from: values.
			self assert: (observed - e) abs < 0.2 ]
]

{ #category : #'random ops' }
TensorFlowOperationsTest >> testGraphNormalStddev [
	| graph session result random values sigma twoSigma std theoreticalDecile expected |	
	graph := TF_Graph create.
	
	sigma := 3.14.
	twoSigma := 2 * sigma.
	random := graph randomNormalShaped: #(100 100 10) stddev: sigma.

	session := TF_Session on: graph.
	result := session runOutput: (random output: 0).
	values := result allFloats.
	
	std := self standardDeviation: values.
	theoreticalDecile := -1.1840324666939051.
		
	self assert: result shape equals: #(100 100 10).
	self assert: values size equals: 100*100*10.
	self assert: twoSigma - (values min abs)  < 0.1.
	self assert: twoSigma - values max < 0.1.
	self assert: (self mean: values) abs < (0.01 * std).
	expected :=  { theoreticalDecile * sigma. 
							theoreticalDecile negated * sigma.
							-2.
							2}.

	
]

{ #category : #'random ops' }
TensorFlowOperationsTest >> testGraphParametrizedTruncatedNormal [
	| graph session result random values std|
	graph := TF_Graph create.
	random := graph parametrizedTruncatedNormalShaped: #(100 100 10) 
																means:#(0) 
																stdevs:#(1)
																minVals:#(-1) 
																maxVals:#(1).
	session := TF_Session on: graph.
	result := session runOutput: (random output: 0).
	values := result allFloats.

	std := self standardDeviation: values.
	self assert: result shape equals: #(100 100 10).
	self assert: values size equals: 100 * 100 * 10.
	self assert: values min > -1.
	self assert: values max < 1.

]

{ #category : #'random ops' }
TensorFlowOperationsTest >> testGraphRandomGamma [
	| graph session result random values std|
	graph := TF_Graph create.
	random := graph randomGamma: #(100 100 10) alpha:1.
													
	session := TF_Session on: graph.
	result := session runOutput: (random output: 0).
	values := result allFloats.

	std := self standardDeviation: values.
	self assert: result shape equals: #(100 100 10).
	self assert: values size equals: 100 * 100 * 10.


]

{ #category : #'random ops' }
TensorFlowOperationsTest >> testGraphRandomPoisson [
	| graph session result random values std|
	graph := TF_Graph create.
	random := graph randomPoisson: #(100 100 10) rate:1.
													
	session := TF_Session on: graph.
	result := session runOutput: (random output: 0).
	values := result allFloats.

	std := self standardDeviation: values.
	self assert: result shape equals: #(100 100 10).
	self assert: values size equals: 100 * 100 * 10.


]

{ #category : #'random ops' }
TensorFlowOperationsTest >> testGraphRandomUniformShaped [
	| graph session result random values |	
	graph := TF_Graph create.
	
	random := graph randomUniformIntShaped: {100. 100. 10} minVal: 3 maxVal: 5.

	session := TF_Session on: graph.
	result := session runOutput: (random output: 0).
	values := result allInt32s.
	
		
	self assert: result shape equals: #(100 100 10).
	self assert: values size equals: 100*100*10.
	self assert: values min  >= 3.
	self assert: values max <5.


	
]

{ #category : #'random ops' }
TensorFlowOperationsTest >> testGraphTensorRandomShuffle [
	| graph session result random values |
	graph := TF_Graph create.
	random := graph randomShuffle: {{1. 2. 3}. {4. 5. 6}. {7. 8. 9}} asInt32Tensor.
	session := TF_Session on: graph.
	result := session runOutput: (random output: 0).
	values := result allFloats.
	
	self assert: result shape equals: #(3 3).
	self assert: values size equals: 9.

]

{ #category : #'random ops' }
TensorFlowOperationsTest >> testGraphTruncatedNormal [
	| graph session result random values std theoreticalDecile expected |
	graph := TF_Graph create.
	random := graph truncatedNormalRandomShaped: #(100 100 10).
	session := TF_Session on: graph.
	result := session runOutput: (random output: 0).
	values := result allFloats.
	theoreticalDecile := -1.1840324666939051.
	std := self standardDeviation: values.
	self assert: result shape equals: #(100 100 10).
	self assert: values size equals: 100 * 100 * 10.
	self assert: values min + 2 < 0.01.
	self assert: 2 - values max < 0.01.
	self assert: (self mean: values) abs < (0.01 * std).
	expected := {theoreticalDecile.
	theoreticalDecile negated}.
	#(0.1 0.9)
		with: expected
		do: [ :p :e | 
			| observed |
			observed := self percentile: p from: values.
			self assert: (observed - e) abs < 0.2 ]
]

{ #category : #'random ops' }
TensorFlowOperationsTest >> testGraphTruncatedNormalStddev [
	| graph session result random values sigma twoSigma std theoreticalDecile expected |	
	graph := TF_Graph create.
	
	sigma := 3.14.
	twoSigma := 2 * sigma.
	random := graph truncatedNormalRandomShaped: #(100 100 10) stddev: sigma.

	session := TF_Session on: graph.
	result := session runOutput: (random output: 0).
	values := result allFloats.
	
	std := self standardDeviation: values.
	theoreticalDecile := -1.1840324666939051.
		
	self assert: result shape equals: #(100 100 10).
	self assert: values size equals: 100*100*10.
	self assert: twoSigma - (values min abs)  < 0.1.
	self assert: twoSigma - values max < 0.1.
	self assert: (self mean: values) abs < (0.01 * std).
	expected :=  { theoreticalDecile * sigma. 
							theoreticalDecile negated * sigma.
							-2.
							2}.
							
	#(0.1 0.9 0.25 0.75) with: expected do:[:p :e| | observed | 
		observed := self percentile: p from: values.
		self assert: (observed - e) abs < 0.2].
	
]

{ #category : #'binary operations' }
TensorFlowOperationsTest >> testGraphUnnamedConst [
	| graph session result const |
	graph := TF_Graph create.
	const := graph const: #(1 2 3 4) asFloatTensor.
	session := TF_Session on: graph.
	result := session runOutput: (const output: 0).
	self assert: result shape equals: #(4).
	self assert: result allFloats equals: #(1 2 3 4)
]

{ #category : #'binary operations' }
TensorFlowOperationsTest >> testGraphVariableFromTruncatedNormalStddev [
	| graph session result1 result2 var random values1 values2 init sigma std twoSigma |	
	graph := TF_Graph create.
	
	sigma := 3.14.
	twoSigma := 2 * sigma.
	random := graph truncatedNormalRandomShaped: #(100 100 10) stddev: sigma.
	var := graph variable: 'var' initialValueFrom: random.
	
	session := TF_Session on: graph.
	init := graph operationNamed: 'var_initializer'.
	result1 := session runOutput: (init output: 0).
	result2 := session runOutput: (var output: 0).

	self assert: result1 shape equals: #(100 100 10).
	
	values1 := result1 allFloats.
	std := self standardDeviation: values1.
	self assert: values1 size equals: 100*100*10.	
	self assert: twoSigma - (values1 min abs)  < 0.1.
	self assert: twoSigma - values1 max < 0.1.
	self assert: (self mean:values1 ) abs < (0.01 * std).	
	
	self assert: result1 shape equals: result2 shape.
	values2 := result2 allFloats.
	self assert: values1 equals: values2
]

{ #category : #'binary operations' }
TensorFlowOperationsTest >> testGraphZeros [
	| graph session result zeros values |
	graph := TF_Graph create.
	zeros := graph zerosShaped: #(100 100 10).
	session := TF_Session on: graph.
	result := session runOutput: (zeros output: 0).
	values := result allFloats.
	self assert: #(100 100 10) equals: result shape.
	self assert: 100 * 100 * 10 equals: values size.
	self assert: 0 equals: values min.
	self assert: 0 equals: values max
]

{ #category : #'unary operations' }
TensorFlowOperationsTest >> testOperationAbs [
	| graph template session const result output |
	template := TF_Tensor fromFloats: #(#(-1.1 1.2) #(-2.1 -2.2)).
	graph := TF_Graph create.
	const := graph const: 'const' value: template.
	output := const abs output: 0.
	session := TF_Session on: graph.
	result := session runOutput: output.
	self assert: result shape equals: template shape.
	self assert: result allFloats equals: template allFloats abs
]

{ #category : #'unary operations' }
TensorFlowOperationsTest >> testOperationAcos [
	| graph template session const result output intput |
	template := #(1.1 0.2 2.34 0.717273).
	intput := TF_Tensor fromFloats: template cos.
	graph := TF_Graph create.
	const := graph const: 'const' value: intput.
	output := const arcCos output: 0.
	session := TF_Session on: graph.
	result := session runOutput: output.
	self assert: result shape equals: intput shape.
	result allFloats with: template do: [ :res :temp | self assert: (res closeTo: temp) ]
]

{ #category : #'unary operations' }
TensorFlowOperationsTest >> testOperationAlias [
	| graph template const result same1 same2 |
	graph := TF_Graph create.
	template := TF_Tensor fromFloats: #(
		((1) (2) (3)) 
		((4) (5) (6))
	).
	const := graph const: 'const' value: template.
	same1 := const alias: 'another_name'.
	same2 := graph operationNamed: 'another_name'.
	
	result := (TF_Session on: graph) runOutput: (same1 output: 0).
	
	self assert: template shape equals: result shape.
	self assert: #(1 2 3 4 5 6) equals: result allFloats.
	
	result := (TF_Session on: graph) runOutput: (same2 output: 0).
	
	self assert: template shape equals: result shape.
	self assert: #(1 2 3 4 5 6) equals: result allFloats.
	

]

{ #category : #'binary operations' }
TensorFlowOperationsTest >> testOperationArgMax [
	| graph a session const result output0 output1 axis0 axis1 |
	a := TF_Tensor fromFloats: #(#(1.1 1.2) #(2.1 2.2) #(3.1 0.2)).
	graph := TF_Graph create.
	const := graph const: 'a' value: a.
	axis0 := graph const: 'axis0' value: (TF_Tensor fromInt32: 0).
	axis1 := graph const: 'axis1' value: (TF_Tensor fromInt32: 1).
	output0 := const findMaxOn: axis0.
	output1 := const findMaxOn: axis1.
	session := TF_Session on: graph.
	result := session runOutput: (output0 output: 0).
	self assert: result shape equals: #(2).
	result allInt64s with: #(2 1) do: [ :r :t | self assert: r equals: t ].
	result := session runOutput: (output1 output: 0).
	self assert: result shape equals: #(3).
	result allInt64s with: #(1 1 0) do: [ :r :t | self assert: r equals: t ]
]

{ #category : #'binary operations' }
TensorFlowOperationsTest >> testOperationArgMin [
	| graph a session const result output0 output1 axis0 axis1 |
	
	a := TF_Tensor fromFloats: #(
		(1.1 1.2)
		(2.1 2.2)
		(3.1 0.2)
	).
	
	graph := TF_Graph create.
	
	const := graph const: 'a' value: a.
	axis0 := graph const: 'axis0' value: (TF_Tensor fromInt32: 0).
	axis1 := graph const: 'axis1' value: (TF_Tensor fromInt32: 1).
	
	output0 := const findMinOn: axis0.
	output1 := const findMinOn: axis1.
	
	session := TF_Session on: graph.
	result := session runOutput: (output0 output: 0).
	
	self assert: result shape equals: #(2).
	result allInt64s with: #(0 2) do: [:r :t |
		self assert: r equals: t].
	
	result := session runOutput: (output1 output: 0).
	
	self assert: result shape equals: #(3).
	result allInt64s with: #(0 0 1) do: [:r :t |
		self assert: r equals: t].
]

{ #category : #'binary operations' }
TensorFlowOperationsTest >> testOperationArgMinTwoOutputs [
	| graph a session const results first second output0 output1 axis0 axis1 |
	
	a := TF_Tensor fromFloats: #(
		(1.1 1.2)
		(2.1 2.2)
		(3.1 0.2)
	).
	
	graph := TF_Graph create.
	
	const := graph const: 'a' value: a.
	axis0 := graph const: 'axis0' value: (TF_Tensor fromInt32: 0).
	axis1 := graph const: 'axis1' value: (TF_Tensor fromInt32: 1).
	
	output0 := (const findMinOn: axis0) output: 0.
	output1 := (const findMinOn: axis1) output: 0.
	
	session := TF_Session on: graph.
	results := session
		runOutputs: {output0. output1}.
	
	first := results at: 1.
	second := results at: 2.
	
	self assert: first shape equals: #(2).
	first allInt64s with: #(0 2) do: [:r :t |
		self assert: r equals: t].
	
	self assert: second shape equals: #(3).
	second allInt64s with: #(0 0 1) do: [:r :t |
		self assert: r equals: t].
]

{ #category : #'unary operations' }
TensorFlowOperationsTest >> testOperationAsin [
	| graph template session const result output intput |
	
	template := #(1.1 0.2 -1.34 0.717273).
	intput := TF_Tensor fromFloats: template sin.
	graph := TF_Graph create.
	
	const := graph const: 'const' value: intput.
	output := const arcSin output: 0.
	
	session := TF_Session on: graph.
	result := session runOutput: output.
	
	self assert: result shape equals: intput shape.
	result allFloats with: template do: [:res :temp |
		self assert: (res closeTo: temp)]
]

{ #category : #'binary operations' }
TensorFlowOperationsTest >> testOperationAssignSub [
	| graph var output pi result session |
	graph := TF_Graph create.
	var := graph variable: 'var' initialValue: 1.0 asTensor.
	pi := graph const: 'pi' value: TF_Tensor pi.
	output := var -= pi.
	
	session := TF_Session on: graph.
	graph initializeOn: session.
	result := session runOutput: (output output: 0).
	
	self assert: (1-Float pi closeTo: result allFloats first)
]

{ #category : #'unary operations' }
TensorFlowOperationsTest >> testOperationAtan [
	| graph template session const result output intput |
	
	template := #(1.1 0.2 -1.34 0.717273).
	intput := TF_Tensor fromFloats: template tan.
	graph := TF_Graph create.
	
	const := graph const: 'const' value: intput.
	output := const arcTan output: 0.
	
	session := TF_Session on: graph.
	result := session runOutput: output.
	
	self assert: result shape equals: intput shape.
	result allFloats with: template do: [:res :temp |
		self assert: (res closeTo: temp)]
]

{ #category : #'binary operations' }
TensorFlowOperationsTest >> testOperationCastTo [
	| graph template cast input result |
	
	template := #((1.1 1.2) (2.1 2.2)).	
	graph := TF_Graph create.
	
	input := graph const: template asFloatTensor.
	cast := input castTo: TF_Tensor typeInt32.

	result := graph runOutput: cast output.

	self assert: template truncated equals: result asNumbers.
]

{ #category : #'unary operations' }
TensorFlowOperationsTest >> testOperationCos [
	| graph template session const result output intput |

	template := #(0.1 0.0 -0.94 0.717273).
	intput := TF_Tensor fromFloats: template arcCos.
	graph := TF_Graph create.
	
	const := graph const: 'const' value: intput.
	output := const cos output: 0.
	
	session := TF_Session on: graph.
	result := session runOutput: output.
	
	self assert: result shape equals: intput shape.
	result allFloats with: template do: [:res :temp |
		self assert: (res closeTo: temp)]
]

{ #category : #'other operations' }
TensorFlowOperationsTest >> testOperationDescentRate [
	| graph var output pi result session rate |
	graph := TF_Graph create.
	var := graph variable: 'var' initialValue: 1.0 asTensor.
	pi := graph const: 'pi' value: TF_Tensor pi.
	rate := graph const: 'rate' value: 0.7 asTensor.
	output := var descent: pi rate: rate.
	session := TF_Session on: graph.
	graph initializeOn: session.
	result := session runOutput: (output output: 0).
	self assert: (1 - (Float pi * 0.7) closeTo: result allFloats first)
]

{ #category : #'other operations' }
TensorFlowOperationsTest >> testOperationDescentRateConstants [
	| graph var output pi result session rate |
	graph := TF_Graph create.
	var := graph variable: 'var' initialValue: 1.0 asTensor.
	pi := Float pi asTensor.
	rate := 0.7 asTensor.
	output := var descent: pi rate: rate.
	
	session := TF_Session on: graph.
	graph initializeOn: session.
	result := session runOutput: (output output: 0).
	
	self assert: (1-(Float pi * 0.7) closeTo: result allFloats first)
]

{ #category : #'binary operations' }
TensorFlowOperationsTest >> testOperationDiv [
	| graph a b session constA constB result output template |
	
	a := TF_Tensor fromFloats: #((1.1 1.2) (2.1 2.2)).
	b := TF_Tensor fromFloats: #((2.0 4.0) (8.0 16.0)).
	
	graph := TF_Graph create.
	
	constA := graph const: 'a' value: a.
	constB := graph const: 'b' value: b.
	
	output := constA @/ constB.
	template := a allFloats / b allFloats.
	
	session := TF_Session on: graph.
	result := session runOutput: (output output: 0).
	
	self assert: result shape equals: a shape.
	result allFloats with: template do: [:r :t |
		self assert: (r closeTo: t)].
]

{ #category : #'binary operations' }
TensorFlowOperationsTest >> testOperationDivScalar [
	| graph a b session constA constB result div template |
	
	a := TF_Tensor fromFloats: #((1.1 1.2) (2.1 2.2)).
	b := TF_Tensor fromFloats: 2.0.
	
	graph := TF_Graph create.
	
	constA := graph const: 'a' value: a.
	constB := graph const: 'b' value: b.
	
	div := constA @/ constB.
	template := a allFloats / 2.0.
	
	session := TF_Session on: graph.
	result := session runOutput: (div output: 0).
	
	self assert: result shape equals: a shape.
	result allFloats with: template do: [:r :t |
		self assert: (r closeTo: t)].
]

{ #category : #'unary operations' }
TensorFlowOperationsTest >> testOperationExp [
	| graph inputs template session const result output |
	
	template := #(-1.1 1.2).
	
	inputs := TF_Tensor fromFloats: template.
	graph := TF_Graph create.
	
	const := graph const: 'const' value: inputs.
	output := const exp output: 0.
	
	session := TF_Session on: graph.
	result := session runOutput: output.
	
	self assert: result shape equals: inputs shape.
	result allFloats with: template exp do: [:res :temp |
		self assert: (res closeTo: temp)]
]

{ #category : #'binary operations' }
TensorFlowOperationsTest >> testOperationGreater [
	| graph a b session constA constB result  template comparisons |
	
	a := TF_Tensor fromFloats: #((1.1 1.2) (3.14 2.2)).
	b := TF_Tensor fromFloats: #((3.14 3.14) (2.1 3.14)).
	
	graph := TF_Graph create.
	
	constA := graph const: 'a' value: a.
	constB := graph const: 'b' value: b.
	
	comparisons := constA > constB.
	template := a allFloats with: b allFloats collect:[:x :y| x > y].
	
	session := TF_Session on: graph.
	result := session runOutput: (comparisons output: 0).
	
	self assert: result shape equals: a shape.
	result allElements with: template do: [:r :t |
		self assert: r equals: t].
]

{ #category : #'unary operations' }
TensorFlowOperationsTest >> testOperationIdentity [
	| graph template const result same |
	graph := TF_Graph create.
	template := TF_Tensor fromFloats: #(
		((1) (2) (3)) 
		((4) (5) (6))
	).
	const := graph const: 'const' value: template.
	same := const identity output: 0.
	
	result := (TF_Session on: graph) runOutput: same.
	
	self assert: template shape equals: result shape.
	self assert: #(1 2 3 4 5 6) equals: result allFloats.
]

{ #category : #'binary operations' }
TensorFlowOperationsTest >> testOperationMatMul [
	| graph a b session constA constB result output template |
	
	a := TF_Tensor fromFloats: #((1.1 1.2) (2.1 2.2)).
	b := TF_Tensor fromFloats: #((2.0 4.0) (8.0 16.0)).
	
	graph := TF_Graph create.
	
	constA := graph const: 'a' value: a.
	constB := graph const: 'b' value: b.

	output := constA * constB.
	template := {
		1.1*2.0+(1.2*8.0).		1.1*4.0+(1.2*16.0).
		2.1*2.0+(2.2*8.0).		2.1*4.0+(2.2*16.0).
	}.

	session := TF_Session on: graph.
	result := session runOutput: (output output: 0).

	self assert: result shape equals: a shape.
	result allFloats with: template do: [:r :t |
		self assert: (r closeTo: t)].
]

{ #category : #'binary operations' }
TensorFlowOperationsTest >> testOperationMatMul1x1 [
	| graph a b session constA constB output result |
	
	a := #((1.1)) asFloatTensor.
	b := #((3.14)) asFloatTensor.
	
	graph := TF_Graph create.
	
	constA := graph const: 'a' value: a.
	constB := graph const: 'b' value: b.

	output := constA * constB.

	session := TF_Session on: graph.
	result := session runOutput: (output output: 0).

	self assert: (1.1 * 3.14 closeTo: result allFloats first)
]

{ #category : #'binary operations' }
TensorFlowOperationsTest >> testOperationMatMul1x1Wrong [
	| graph a b constA constB output |
	a := #(1.1) asFloatTensor.
	b := #(2.02) asFloatTensor.
	graph := TF_Graph create.
	constA := graph const: 'a' value: a.
	constB := graph const: 'b' value: b.
	self
		should: [ output := constA * constB ]
		raiseError:
			'INVALID_ARGUMENT: Shape must be rank 2 but is rank 1 for ''MatMul_2'' (op: ''MatMul'') with input shapes: [1], [1].'
]

{ #category : #'binary operations' }
TensorFlowOperationsTest >> testOperationMatMulABTransposed [
	| graph a b session constA constB result output template |
	
	a := TF_Tensor fromFloats: #((1.1 1.2) (2.1 2.2)).
	b := TF_Tensor fromFloats: #((2.0 4.0) (8.0 16.0)).
	
	graph := TF_Graph create.
	
	constA := graph const: 'a' value: a.
	constB := graph const: 'b' value: b.
	
	output := constA \*\ constB.
	template := {
		1.1*2.0+(2.1*4.0).		1.1*8.0+(2.1*16.0).
		1.2*2.0+(2.2*4.0).		1.2*8.0+(2.2*16.0).
	}.

	session := TF_Session on: graph.
	result := session runOutput: (output output: 0).
	
	self assert: result shape equals: a shape.
	result allFloats with: template do: [:r :t |
		self assert: (r closeTo: t)].
]

{ #category : #'binary operations' }
TensorFlowOperationsTest >> testOperationMatMulATransposed [
	| graph a b session constA constB result output template |
	
	a := TF_Tensor fromFloats: #((1.1 1.2) (2.1 2.2)).
	b := TF_Tensor fromFloats: #((2.0 4.0) (8.0 16.0)).
	
	graph := TF_Graph create.
	
	constA := graph const: 'a' value: a.
	constB := graph const: 'b' value: b.
	
	output := constA \* constB.
	template := {
		1.1*2.0+(2.1*8.0).		1.1*4.0+(2.1*16.0).
		1.2*2.0+(2.2*8.0).		1.2*4.0+(2.2*16.0).
	}.

	session := TF_Session on: graph.
	result := session runOutput: (output output: 0).
	
	self assert: result shape equals: a shape.
	result allFloats with: template do: [:r :t |
		self assert: (r closeTo: t)].
]

{ #category : #'binary operations' }
TensorFlowOperationsTest >> testOperationMatMulBTransposed [
	| graph a b session constA constB result output template |
	
	a := TF_Tensor fromFloats: #((1.1 1.2) (2.1 2.2)).
	b := TF_Tensor fromFloats: #((2.0 4.0) (8.0 16.0)).
	
	graph := TF_Graph create.
	
	constA := graph const: 'a' value: a.
	constB := graph const: 'b' value: b.
	
	output := constA *\ constB.
	template := {
		1.1*2.0+(1.2*4.0).		1.1*8.0+(1.2*16.0).
		2.1*2.0+(2.2*4.0).		2.1*8.0+(2.2*16.0).
	}.

	session := TF_Session on: graph.
	result := session runOutput: (output output: 0).
	
	self assert: result shape equals: a shape.
	result allFloats with: template do: [:r :t |
		self assert: (r closeTo: t)].
]

{ #category : #'binary operations' }
TensorFlowOperationsTest >> testOperationMatMulWrongType [
	| graph a b constA constB |
	
	a := TF_Tensor fromFloats: #((1.1 1.2) (2.1 2.2)).
	b := #((2 4) (8 16)) asInt32Tensor.
	
	graph := TF_Graph create.
	
	constA := graph const: 'a' value: a.
	constB := graph const: 'b' value: b.

	self
		should: [constA * constB]
		raiseError: 'INVALID_ARGUMENT: Inconsistent values for attr ''T'' DT_FLOAT vs. DT_INT32 while building NodeDef ''MatMul_2'' using Op<name=MatMul; signature=a:T, b:T -> product:T; attr=transpose_a:bool,default=false; attr=transpose_b:bool,default=false; attr=T:type,allowed=[DT_BFLOAT16, DT_HALF, DT_FLOAT, DT_DOUBLE, DT_INT32, DT_COMPLEX64, DT_COMPLEX128]>'.
]

{ #category : #'unary operations' }
TensorFlowOperationsTest >> testOperationMatrixInverse [
	| graph template session const result identity inverse |
	template := TF_Tensor fromFloats: #((-1.1 1.2) (-2.1 -2.2)).
	graph := TF_Graph create.
	const := graph const: 'const' value: template.
	inverse := const inverse.
	identity := const * inverse output: 0.
	session := TF_Session on: graph.
	result := session runOutput: identity.
	self assert: result shape equals: template shape.
	result allFloats
		with: #(1.0 0.0 0.0 1.0)
		do: [ :real :expected | self assert: (real closeTo: expected) ]
]

{ #category : #'binary operations' }
TensorFlowOperationsTest >> testOperationMeanOn [
	| graph a session mean0 mean01 mean1 results meanNone |
	
	graph := TF_Graph create.
	a := graph const: #(
		(1.1 1.2)
		(2.1 2.2)
		(3.1 0.2)
	) asFloatTensor.
		
	mean0 := a meanOn: #(0) asInt32Tensor.
	mean1 := a meanOn: #(1) asInt32Tensor.
	mean01 := a meanOn: #(0 1) asInt32Tensor.
	meanNone := a meanOn: #() asInt32Tensor.
		
	session := TF_Session on: graph.
	results := session runOutputs: {mean0 output: 0. mean1 output: 0. mean01 output: 0. meanNone output: 0}." mean01bis output: 0}."
	
	self assert: #(2) equals: results first shape.
	self assert: #(3) equals: results second shape.
	self assert: #() equals: results third shape.
	self assert: #(3 2) equals: results fourth shape.

	self assertAll: #(2.1 1.2) closeTo: results first allFloats.
	self assertAll: #(1.15 2.15 1.65) closeTo: results second allFloats.
	self assertAll: #(1.65) closeTo: results third allFloats.
	self
		assertAll: #(
			1.1 1.2
			2.1 2.2
			3.1 0.2)
		closeTo: results fourth allFloats.
	
]

{ #category : #'binary operations' }
TensorFlowOperationsTest >> testOperationMinus [
	| graph a b session constA constB result sum template |
	
	a := TF_Tensor fromFloats: #((1.1 1.2) (2.1 2.2)).
	b := TF_Tensor fromFloats: #((3.14 3.14) (3.14 3.14)).
	
	graph := TF_Graph create.
	
	constA := graph const: 'a' value: a.
	constB := graph const: 'b' value: b.
	
	sum := constA - constB.
	
	session := TF_Session on: graph.
	result := session runOutput: (sum output: 0).
	
	template := a allFloats - b allFloats.

	self assert: result shape equals: a shape.
	result allFloats with: template do: [:r :t |
		self assert: (r closeTo: t)].
]

{ #category : #'binary operations' }
TensorFlowOperationsTest >> testOperationMod [
	| graph a b session constA constB result output template |
	
	a := TF_Tensor fromFloats: #((10.0 11.0) (12.0 13.0)).
	b := TF_Tensor fromFloats: #((3.0 2.0) (7.0 5.0)).
	
	graph := TF_Graph create.
	
	constA := graph const: 'a' value: a.
	constB := graph const: 'b' value: b.
	
	output := constA \\ constB.
	template := a allFloats \\ b allFloats.
	
	session := TF_Session on: graph.
	result := session runOutput: (output output: 0).
	
	self assert: result shape equals: a shape.
	result allFloats with: template do: [:r :t |
		self assert: (r closeTo: t)].
]

{ #category : #'binary operations' }
TensorFlowOperationsTest >> testOperationMul [
	| graph a b session constA constB result output template |
	
	a := TF_Tensor fromFloats: #((1.1 1.2) (2.1 2.2)).
	b := TF_Tensor fromFloats: #((2.0 4.0) (8.0 16.0)).
	
	graph := TF_Graph create.
	
	constA := graph const: 'a' value: a.
	constB := graph const: 'b' value: b.
	
	output := constA @* constB.
	template := a allFloats * b allFloats.
	
	session := TF_Session on: graph.
	result := session runOutput: (output output: 0).
	
	self assert: result shape equals: a shape.
	result allFloats with: template do: [:r :t |
		self assert: (r closeTo: t)].
]

{ #category : #'binary operations' }
TensorFlowOperationsTest >> testOperationMulScalar [
	| graph a b session constA constB result mul template |
	
	a := TF_Tensor fromFloats: #((1.1 1.2) (2.1 2.2)).
	b := TF_Tensor fromFloats: 2.0.
	
	graph := TF_Graph create.
	
	constA := graph const: 'a' value: a.
	constB := graph const: 'b' value: b.
	
	mul := constA @* constB.
	template := a allFloats * 2.0.
	
	session := TF_Session on: graph.
	result := session runOutput: (mul output: 0).
	
	self assert: result shape equals: a shape.
	result allFloats with: template do: [:r :t |
		self assert: (r closeTo: t)].
]

{ #category : #'unary operations' }
TensorFlowOperationsTest >> testOperationNegated [
	| graph template session const result negated |
	
	template := TF_Tensor fromFloats: #((1.1 1.2) (2.1 2.2)).
	graph := TF_Graph create.
	
	const := graph const: 'const' value: template.
	negated := const negated output: 0.
	
	session := TF_Session on: graph.
	result := session runOutput: negated.
	
	self assert: result shape equals: template shape.
	self assert: result allFloats equals: template allFloats negated
]

{ #category : #'binary operations' }
TensorFlowOperationsTest >> testOperationPlus [
	| graph a b session constA constB result sum template |
	
	a := TF_Tensor fromFloats: #((1.1 1.2) (2.1 2.2)).
	b := TF_Tensor fromFloats: #((3.14 3.14) (3.14 3.14)).
	
	graph := TF_Graph create.
	
	constA := graph const: 'a' value: a.
	constB := graph const: 'b' value: b.
	
	sum := constA + constB.
	template := a allFloats + b allFloats.
	
	session := TF_Session on: graph.
	result := session runOutput: (sum output: 0).
	
	self assert: result shape equals: a shape.
	result allFloats with: template do: [:r :t |
		self assert: (r closeTo: t)].
]

{ #category : #'binary operations' }
TensorFlowOperationsTest >> testOperationPlusNegated [
	| graph a b session constA constB result sum template |
	
	a := TF_Tensor fromFloats: #((1.1 1.2) (2.1 2.2)).
	b := TF_Tensor fromFloats: #((3.14 3.14) (3.14 3.14)).
	
	graph := TF_Graph create.
	
	constA := graph const: 'a' value: a.
	constB := graph const: 'b' value: b.
	
	sum := constA + constB negated.
	
	session := TF_Session on: graph.
	result := session runOutput: (sum output: 0).
	
	template := a allFloats - b allFloats.

	self assert: result shape equals: a shape.
	result allFloats with: template do: [:r :t |
		self assert: (r closeTo: t)].
]

{ #category : #'binary operations' }
TensorFlowOperationsTest >> testOperationPlusNegatedNegated [
	| graph a b session constA constB result sum template |
	
	a := TF_Tensor fromFloats: #((1.1 1.2) (2.1 2.2)).
	b := TF_Tensor fromFloats: #((3.14 3.14) (3.14 3.14)).
	
	graph := TF_Graph create.
	
	constA := graph const: 'a' value: a.
	constB := graph const: 'b' value: b.
	
	sum := (constA + constB negated) negated.
	template := (a allFloats + b allFloats negated) negated.
	
	session := TF_Session on: graph.
	result := session runOutput: (sum output: 0).
	
	self assert: result shape equals: a shape.
	result allFloats with: template do: [:r :t |
		self assert: (r closeTo: t)].
]

{ #category : #'binary operations' }
TensorFlowOperationsTest >> testOperationPlusNegatedNegatedPlus [
	| graph a b session constA constB result sum template |
	
	a := TF_Tensor fromFloats: #((1.1 1.2) (2.1 2.2)).
	b := TF_Tensor fromFloats: #((3.14 3.14) (3.14 3.14)).
	
	graph := TF_Graph create.
	
	constA := graph const: 'a' value: a.
	constB := graph const: 'b' value: b.
	
	sum := (constA + constB negated) negated + constB negated.
	template := (a allFloats + b allFloats negated) negated + b allFloats negated.
	
	session := TF_Session on: graph.
	result := session runOutput: (sum output: 0).
	
	self assert: result shape equals: a shape.
	
	result allFloats with: a allFloats negated do: [:r :t |
		self assert: (r closeTo: t)].
	
	result allFloats with: template do: [:r :t |
		self assert: (r closeTo: t)].
]

{ #category : #'unary operations' }
TensorFlowOperationsTest >> testOperationRelu [
	| graph template session const result output |
	
	template := #(
		(-1.1	1.2)
		(-2.1	2.2)
		(0		-0)) asFloatTensor.
		
	graph := TF_Graph create.
	
	const := graph const: 'const' value: template.
	output := const rectified output: 0.
	
	session := TF_Session on: graph.
	result := session runOutput: output.
	self assert: result shape equals: template shape.
	self assert: result allFloats equals: (template allFloats collect: [:each | each max: 0]).

]

{ #category : #'unary operations' }
TensorFlowOperationsTest >> testOperationReluGrad [
	| graph template session result previousGradient rectifiedGrad expected previousGradientTemplate |
	
	template := #(
		(-1.1	1.2)
		(-2.1	2.2)
		(0		-0)) asFloatTensor.
		

	graph := TF_Graph create.
	
	previousGradientTemplate := #(
		(0	1)
		(1	0)
		(1		1)) asFloatTensor.
		
	previousGradient := previousGradientTemplate asOperationOn: graph.
	rectifiedGrad := previousGradient timesRectifiedGradOf: template.
	
	session := TF_Session on: graph.
	result := session runOutput: rectifiedGrad output.
	
	self assert: result shape equals: template shape.
	expected := template allFloats with: previousGradientTemplate allFloats collect:[:x :y| (x sign max: 0) * y].
	self assert: result allFloats equals: expected.

]

{ #category : #'unary operations' }
TensorFlowOperationsTest >> testOperationShape [
	| graph template session const result shape |
	
	template := TF_Tensor fromFloats: #(((((-1.1 1.2 1)) ((-2.1 -2.2 0))))).
	graph := TF_Graph create.
	
	const := graph const: 'const' value: template.
	shape := const shape output.
	
	session := TF_Session on: graph.
	result := session runOutput: shape.
	
	self assert: {template rank} equals: result shape.
	self assert: #(1 1 2 1 3) equals: result asNumbers

]

{ #category : #'unary operations' }
TensorFlowOperationsTest >> testOperationSigmoid [
	| graph inputs template session const result output transformed |
	
	template := #(-1.1 1.2 0 4).
	
	inputs := TF_Tensor fromFloats: template.
	graph := TF_Graph create.
	
	const := graph const: 'const' value: inputs.
	output := const sigmoid output: 0.
	
	session := TF_Session on: graph.
	result := session runOutput: output.
	
	transformed := template collect:[:x| (x negated exp + 1) reciprocal].
	self assert: result shape equals: inputs shape.
	result allFloats with: transformed do: [:res :temp |
		self assert: (res closeTo: temp)]
]

{ #category : #'unary operations' }
TensorFlowOperationsTest >> testOperationSin [
	| graph template session const result output intput |

	template := #(0.1 0.0 -0.94 0.717273).
	intput := TF_Tensor fromFloats: template arcSin.
	graph := TF_Graph create.
	
	const := graph const: 'const' value: intput.
	output := const sin output: 0.
	
	session := TF_Session on: graph.
	result := session runOutput: output.
	
	self assert: result shape equals: intput shape.
	result allFloats with: template do: [:res :temp |
		self assert: (res closeTo: temp)]
]

{ #category : #'other operations' }
TensorFlowOperationsTest >> testOperationSizeOn [
	| t3x1x4 |
	t3x1x4 := #(	"shape: (3 1 3)"
		((1 2 3 0))
		((4 5 6 0))
		((7 8 9 0))
	).
	self assert: #(1 2 3 4 5 6 7) sizeOn: 0 is: #(7).
	self assert: t3x1x4 sizeOn: 0 is: #(3).
	self assert: t3x1x4 sizeOn: 1 is: #(1).
	self assert: t3x1x4 sizeOn: 2 is: #(4).
 

]

{ #category : #'other operations' }
TensorFlowOperationsTest >> testOperationSlice [
	| m3x3 |
	m3x3 := #(	"shape: (3 1 3)"
		((1 2 3))
		((4 5 6))
		((7 8 9))
	).
	self assertSlice: #(1 2 3 4 5 6 7) from: #(0) size: #(1) is: #(1).
	self assertSlice: m3x3 from: #(0 0 0) size: #(1 1 1) is: #(((1))).
	self assertSlice: m3x3 from: #(1 0 1) size: #(1 1 1) is: #(((5))).
	self assertSlice: m3x3 from: #(1 0 1) size: #(1 -1 1) is: #(((5))).
	self assertSlice: m3x3 from: #(1 0 1) size: #(1 1 -1) is: #(((5 6))).
	self assertSlice: m3x3 from: #(1 0 1) size: #(1 -1 -1) is: #(((5 6))).
	self assertSlice: m3x3 from: #(1 0 1) size: #(-1 1 -1) is: #(((5 6)) ((8 9))).

]

{ #category : #'other operations' }
TensorFlowOperationsTest >> testOperationSliceSimple [
	| graph session const result slice |
	graph := TF_Graph create.
	const := graph const: #(1 2 3 4 5 6 7) asInt32Tensor.
	slice := const sliceFrom: #(0) asInt32Tensor size: #(1) asInt32Tensor.

	session := TF_Session on: graph.
	result := session runOutput: slice output.
	
	self assert: #(1) equals: result asNumbers.
]

{ #category : #'binary operations' }
TensorFlowOperationsTest >> testOperationSparseSoftmaxCrossEntropyWithLogits [
	| graph label prediction results session xentropy gradient lastVector loss|
	
	graph := TF_Graph create.
	prediction := graph const: #(
		(0.1 0.2 0.3 0.9 0.0 0.5 0.4)
		(0.1 0.2 0.1 0.1 0.8 0.1 0.1)
		(0 0 0 0 0 0 1)
	) asFloatTensor.
	label := graph const: #(3 4 6) asInt32Tensor.
	
	xentropy := prediction sparseSoftmaxCrossEntropyWithLogits: label.
	
	session := TF_Session on: graph.
	results := session runOutputs: {xentropy output: 0. xentropy output: 1}.
	
	loss := results first.
	self assert: #(3) equals: loss shape.
	self assert: (loss allFloats first between: 1 and: 1.5).
	self assert: (loss allFloats second between: 1 and: 1.5).
	self assert: (loss allFloats third between: 1 and: 1.2).
	
	gradient := results second.
	self assert: #(3 7) equals: gradient shape.
	lastVector := gradient allFloats last: 7.
	self assert: lastVector last < 0.
	lastVector allButLastDo: [:x | self assert: x > 0] 

]

{ #category : #'binary operations' }
TensorFlowOperationsTest >> testOperationSparseSoftmaxCrossEntropyWithLogitsUseOutput [
	| graph label prediction results session xentropy gradient lastVector loss|
	
	graph := TF_Graph create.
	prediction := graph const: #(
		(0.1 0.2 0.3 0.9 0.0 0.5 0.4)
		(0.1 0.2 0.1 0.1 0.8 0.1 0.1)
		(0 0 0 0 0 0 1)
	) asFloatTensor.
	label := graph const: #(3 4 6) asInt32Tensor.
	
	xentropy := prediction sparseSoftmaxCrossEntropyWithLogits: label.
	
	session := TF_Session on: graph.
	results := session runOutputs: {xentropy output. (xentropy useOutput: 1) output}.
	
	loss := results first.
	self assert: #(3) equals: loss shape.
	self assert: (loss allFloats first between: 1 and: 1.5).
	self assert: (loss allFloats second between: 1 and: 1.5).
	self assert: (loss allFloats third between: 1 and: 1.2).
	
	gradient := results second.
	self assert: #(3 7) equals: gradient shape.
	lastVector := gradient allFloats last: 7.
	self assert: lastVector last < 0.
	lastVector allButLastDo: [:x | self assert: x > 0] 

]

{ #category : #'unary operations' }
TensorFlowOperationsTest >> testOperationSquared [
	| graph template session const result output |
	
	template := TF_Tensor fromFloats: #((-1.1 1.2) (-2.1 -2.2)).
	graph := TF_Graph create.
	
	const := graph const: 'const' value: template.
	output := const squared output: 0.
	
	session := TF_Session on: graph.
	result := session runOutput: output.
	
	self assert: result shape equals: template shape.
	result allFloats with: template allFloats squared do: [:res :temp |
		self assert: (res closeTo: temp)]
]

{ #category : #'binary operations' }
TensorFlowOperationsTest >> testOperationSub [
	| graph a b session constA constB result sub template |
	a := TF_Tensor fromFloats: #(#(1.1 1.2) #(2.1 2.2)).
	b := TF_Tensor fromFloats: #(#(3.14 3.14) #(3.14 3.14)).
	graph := TF_Graph create.
	constA := graph const: 'a' value: a.
	constB := graph const: 'b' value: b.
	sub := constA - constB.
	session := TF_Session on: graph.
	result := session runOutput: (sub output: 0).
	template := a allFloats - b allFloats.
	self assert: result shape equals: a shape.
	result allFloats with: template do: [ :r :t | self assert: (r closeTo: t) ]
]

{ #category : #'binary operations' }
TensorFlowOperationsTest >> testOperationSum [
	| graph a session const result output0 output1 axis0 axis1 template sumOn1 sumOn0 |
	
	template := #(
		(1.1 1.2)
		(2.1 2.2)
		(3.1 0.2)
	).
	
	sumOn0 := template sum.
	sumOn1 := template collect: [:line | line sum].
	
	a := TF_Tensor fromFloats: template.
	
	graph := TF_Graph create.
	
	const := graph const: 'a' value: a.
	axis0 := graph const: 'axis0' value: (TF_Tensor fromInt32: 0).
	axis1 := graph const: 'axis1' value: (TF_Tensor fromInt32: 1).
	
	output0 := const sumOn: axis0.
	output1 := const sumOn: axis1.
	
	session := TF_Session on: graph.
	result := session
		runOperation: output0
		output: (output0 output: 0).
	
	self assert: result shape equals: #(2).
	result allFloats with: sumOn0 do: [:r :t |
		self assert: (r closeTo: t)].
	
	result := session
		runOperation: output1
		output: (output1 output: 0).
	
	self assert: result shape equals: #(3).
	result allFloats with: sumOn1 do: [:r :t |
		self assert: (r closeTo: t)]
]

{ #category : #'binary operations' }
TensorFlowOperationsTest >> testOperationSumOnOutputs [
	| graph a session const results first second output0 output1 axis0 axis1 template sumOn1 sumOn0 |
	
	template := #(
		(1.1 1.2)
		(2.1 2.2)
		(3.1 0.2)
	).
	
	sumOn0 := template sum.
	sumOn1 := template collect: [:line | line sum].
	
	a := TF_Tensor fromFloats: template.
	
	graph := TF_Graph create.
	
	const := graph const: 'a' value: a.
	axis0 := graph const: 'axis0' value: (TF_Tensor fromInt32: 0).
	axis1 := graph const: 'axis1' value: (TF_Tensor fromInt32: 1).
	
	output0 := const sumOn: axis0.
	output1 := const sumOn: axis1.
	
	session := TF_Session on: graph.
	results := session runOutputs: {output0 output: 0. output1 output: 0}.
	first := results at: 1.
	second := results at: 2.
	
	self assert: first shape equals: #(2).
	first allFloats with: sumOn0 do: [:r :t |
		self assert: (r closeTo: t)].
	
	self assert: second shape equals: #(3).
	second allFloats with: sumOn1 do: [:r :t |
		self assert: (r closeTo: t)].
]

{ #category : #'unary operations' }
TensorFlowOperationsTest >> testOperationTan [
	| graph template session const result output intput |

	template := #(0.1 0.0 -0.94 0.717273).
	intput := TF_Tensor fromFloats: template arcTan.
	graph := TF_Graph create.
	
	const := graph const: 'const' value: intput.
	output := const tan output: 0.
	
	session := TF_Session on: graph.
	result := session runOutput: output.
	
	self assert: result shape equals: intput shape.
	result allFloats with: template do: [:res :temp |
		self assert: (res closeTo: temp)]
]

{ #category : #'unary operations' }
TensorFlowOperationsTest >> testSoftmax [
	| graph template session const result output denominator |
	
	template := TF_Tensor fromFloats: {{0. 3  ln}}.
	graph := TF_Graph create.
	
	const := graph const: 'const' value: template.
	output := const softmax output.
	
	session := TF_Session on: graph.
	result := session runOutput: output.

	self assert: result shape equals: template shape.
	
	denominator := template allFloats exp sum. 
	result allFloats with: template allFloats exp / denominator do: [:res :temp |
		| delta |
		delta := (res  - temp) abs.
		self assert: delta < 0.001]

]

{ #category : #'other operations' }
TensorFlowOperationsTest >> variance: aCollectionOfNumbers [
	| moy |
	aCollectionOfNumbers isEmpty
		ifTrue: [ ^ 0 ].
	moy := self mean: aCollectionOfNumbers.
	^ ((aCollectionOfNumbers inject: 0 into: [ :subTotal :next | subTotal + (next - moy) squared ])
		/ aCollectionOfNumbers size) asFloat
]
