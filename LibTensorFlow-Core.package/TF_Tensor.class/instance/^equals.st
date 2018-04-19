comparing
= aTF_Tensor

"We have to tests both side in order to be correct under Pharo 6.1 and Pharo 7.0"
"Because TestAsserter>>assert: actual equals: expected is not really the same between these 2 versions"

	^ self class = aTF_Tensor class and: [( handle = aTF_Tensor getHandle ) or: [aTF_Tensor getHandle = handle getHandle]]