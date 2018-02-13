running
run
	| covariatesTr covariatesTe predictions size dataset testing training |
	dataset := self loadDataSet.
	training := dataset first.
	testing := dataset second.
	covariatesTr := training allButLast asFloatTensor.
	size := testing first size.
	predictions := (1 to: size) collect: [ :i | | covariates index predicted results trueValue |
		covariates := testing  collect:[:col| {col at: i}].
		covariatesTe := covariates allButLast asFloatTensor.
		results := plan predict: covariatesTe from: covariatesTr.
		index := results first.
		trueValue := covariates fifth first.
		predicted := training fifth at: index.
		trueValue = predicted
			ifTrue: [ 1 ]
			ifFalse: [ 0 ]].
	^ predictions.