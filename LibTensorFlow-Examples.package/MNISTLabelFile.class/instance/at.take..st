accessing
at: base take: batchSize
	^ (base to: base + batchSize - 1) collect:[:index| self at: index]