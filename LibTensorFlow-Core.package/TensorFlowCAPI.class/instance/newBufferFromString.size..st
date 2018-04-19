buffer
newBufferFromString: aString size: anInteger
	"<cdecl: TF_Buffer* 'TF_NewBufferFromString' (char* size_t)>"

	^ self
		ffiCall: #(TF_Buffer * TF_NewBufferFromString #(String aString , size_t anInteger))
		module: TensorFlowCAPI