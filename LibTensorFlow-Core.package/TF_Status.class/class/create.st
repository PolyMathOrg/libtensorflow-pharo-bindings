instance creation
create
	| answer |
	answer := self persistent.
	answer autoRelease.
	^ answer