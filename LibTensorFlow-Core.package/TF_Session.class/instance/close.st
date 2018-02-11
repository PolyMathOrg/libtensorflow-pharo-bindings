release
close
	| status |
	status := TF_Status create.
	self library closeSession: self status: status.
	status check