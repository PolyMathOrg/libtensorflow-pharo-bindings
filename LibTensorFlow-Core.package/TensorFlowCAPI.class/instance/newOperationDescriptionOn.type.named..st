operation
newOperationDescriptionOn: graph type: type named: aName
	"<cdecl: TF_OperationDescription* 'TF_NewOperation' (TF_Graph* char* char*)>"

	^ self
		ffiCall:
			#(TF_OperationDescription * TF_NewOperation #(TF_Graph * graph , String type , String aName))
		module: TensorFlowCAPI