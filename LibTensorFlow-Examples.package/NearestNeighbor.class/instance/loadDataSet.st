initialization
loadDataSet
	| dataSet description stream |
	stream := self irisFile.
	stream nextLine.
	dataSet := self testingAndTrainingFrom: stream.
	description := self irisDescription.
	^ dataSet collect: [ :csv |
		self
			decodeCSV: csv
			graphRun: description ].