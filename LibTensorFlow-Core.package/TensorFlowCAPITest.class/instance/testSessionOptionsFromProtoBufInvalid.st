testing options
testSessionOptionsFromProtoBufInvalid
	self should: [ TF_SessionOptions fromProtoBuf: '.' ] raiseError: 'INVALID_ARGUMENT: Unparseable ConfigProto'