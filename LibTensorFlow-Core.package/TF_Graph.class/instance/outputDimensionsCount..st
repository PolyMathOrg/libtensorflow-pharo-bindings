outputs
outputDimensionsCount: aTF_Output
	| status answer |
	status := TF_Status create.
	self halt.
	answer := self library forGraph: self outputDims: aTF_Output status: status.
	status check.
	^ answer