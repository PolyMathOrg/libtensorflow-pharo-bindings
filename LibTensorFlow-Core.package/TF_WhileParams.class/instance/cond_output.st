accessing structure variables
cond_output
	"This method was automatically generated"
	^ TF_Output fromHandle: (handle referenceStructAt: OFFSET_COND_OUTPUT length: TF_Output byteSize)