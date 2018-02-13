learning
learnAll: samples to: targets steps: n
	n timesRepeat: [
		samples with: targets do:[:sample :target| self learn: sample with: target]
		]