testing operation
testDecodeCSVGraphCreate
	| defaults |
	defaults := {
		TF_Tensor fromInt64s: #(-1).
		TF_Tensor fromInt64s: #(-1).
		TF_Tensor fromInt64s: #(-1).
		TF_Tensor fromInt64s: #(-1)}.
		
	self decodeCSVGraphDefaults: defaults.