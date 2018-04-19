accessing
current
	^ current ifNil: [ current := self uniqueInstance ]