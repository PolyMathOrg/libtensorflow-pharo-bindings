private
percentile: percent from: collection
	| position sorted |
	position := (collection size * percent) ceiling.
	sorted := collection sorted: [:x :y| x <= y].
	^ sorted at: position