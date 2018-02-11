private
percentile: percent from: collection
	| position sorted |
	position := (collection size * percent) ceiling.
	sorted := collection sorted: nil.
	^ sorted at: position