initialize-release
import: aTF_Buffer
	| options status |
	status := TF_Status create.
	options := TF_ImportGraphDefOptions create.
	self halt.
	self library
		importGraphDefInto: self
		from: aTF_Buffer
		options: options
		status: status.
	options delete.
	status check