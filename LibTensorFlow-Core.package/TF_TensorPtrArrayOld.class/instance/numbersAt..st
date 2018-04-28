accessing
numbersAt: index
	| tensor |
	tensor := self at: index.
	^ tensor asNumbers