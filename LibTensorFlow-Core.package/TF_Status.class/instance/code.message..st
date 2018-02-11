accessing
code: aTF_Code message: aString
	| externalized |
	self assert: aTF_Code ~= 0.
	externalized := self library externalizeString: aString.
	self library setStatus: self code: aTF_Code message: externalized