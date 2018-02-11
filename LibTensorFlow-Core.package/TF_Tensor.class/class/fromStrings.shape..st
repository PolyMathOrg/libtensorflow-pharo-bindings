instance creation
fromStrings: strings shape: shape
	| flatten |
	flatten := self elementsOf: strings.
	^ self fromStringArray:  flatten shape: shape.
