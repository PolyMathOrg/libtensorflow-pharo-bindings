accessing
at: index
	"This method was automatically generated. See PointerArray class>>fields."
	^ self elementAtOffset: index  - 1 * self class byteSize + 1
	