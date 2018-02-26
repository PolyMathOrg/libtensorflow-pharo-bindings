outputs
rankOf: aTF_OutputOrInput
	| status answer |
	status := TF_Status create.
	answer := self library graph: self getRankOf: aTF_OutputOrInput status: status.
	status check.
	^ answer