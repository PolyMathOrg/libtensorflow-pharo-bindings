accessing
current
	^ current ifNil: [ current := self new forceLoading ]