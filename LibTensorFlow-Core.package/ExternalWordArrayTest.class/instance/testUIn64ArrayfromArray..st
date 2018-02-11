testing
testUIn64ArrayfromArray: template
	| array |
	array := Int64Array externalFromArray: template.
	template
		withIndexDo:
			[ :each :index | self assert: (template at: index) equals: (array at: index) ]