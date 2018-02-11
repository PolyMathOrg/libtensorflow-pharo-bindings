attributes
attrMetadata: nameString
	| status answer |
	status := TF_Status create.
	answer := self library operation: self getMetadataFor: nameString asAsciiZ status: status.
	status check.
	^ answer