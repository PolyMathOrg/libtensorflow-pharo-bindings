private
trainAt: index
	| images labels loss report result |
	images := imageSet bytesAt: index take: batchSize.
	labels := labelSet at: index take: batchSize.
	result := plan predict: images andLearnFrom: labels.
	loss := result at: 2.
	report := index asString, ': ', loss asNumbers asString.
	Transcript show: report;
					newLine
	