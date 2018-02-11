root operations
truncatedNormalRandomShaped: shapeArray stddev: aNumber
	| random |
	random := self truncatedNormalRandomShaped: shapeArray.
	^ random @* (self const: aNumber asTensor)