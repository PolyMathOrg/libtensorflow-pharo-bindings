instance creation
create
	| answer |
	answer := self persistent.
	answer useFinalization.
	^ answer