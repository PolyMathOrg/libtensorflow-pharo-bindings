accessing
bytesAt: base take: batchSize
	^ (base to: base + batchSize -1) collect:[:index| self bytesAt: index]