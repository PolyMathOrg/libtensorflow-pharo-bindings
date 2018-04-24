testing operation
testAttrSetStrings
	self assert: false description: 'DebugIdentity operation does not exist anymore in TF r1.7'.
	self testAttrSetStrings: #('file://tmp/TFDebug.log').
	self testAttrSetStrings: #('file://tmp/TFDebug.log' 'file://tmp/TFDebug.2.log')