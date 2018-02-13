accessing
bytesAt: imageIndex
	| size base |
	size := columns * rows.
	base := imageIndex - 1 * size + 1.
	^ items copyFrom: base to: base + size - 1.