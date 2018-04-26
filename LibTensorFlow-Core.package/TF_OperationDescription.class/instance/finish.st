accessing
finish
	| answer status |
	status := TF_Status create.
	answer := self library finishOperation: self status: status.
	"handle := nil."
	status check.
	^ answer