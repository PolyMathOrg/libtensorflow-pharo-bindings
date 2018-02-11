instance creation
fromNumbers: values type: type
	| shape |
	shape := self shapeOf: values.
	^ self fromNumbers: values type: type shape: shape