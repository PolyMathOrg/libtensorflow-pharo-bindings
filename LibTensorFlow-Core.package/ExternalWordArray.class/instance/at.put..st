accessing
at: index put: anExternalStructure
	"This method was automatically generated. See PointerArray class>>fields."
	^ self elementAtOffset: index  - 1 * anExternalStructure class byteSize + 1 put: anExternalStructure
	