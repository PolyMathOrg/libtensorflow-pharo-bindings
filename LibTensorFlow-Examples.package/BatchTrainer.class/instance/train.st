running
train
	(1 to: labelSet count -1 by: batchSize) do: [:index| self trainAt: index].