testing operation
testPlaceholderTypes
	self testPlaceholderType: TF_Tensor typeInt64.
	self testPlaceholderType: TF_Tensor typeInt32.
	self testPlaceholderType: TF_Tensor typeFloat