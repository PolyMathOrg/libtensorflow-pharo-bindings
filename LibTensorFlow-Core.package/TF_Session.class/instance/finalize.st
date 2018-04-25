release
finalize
"deprecated"
self halt.
	[self delete] on: Error do: [
		Transcript
			cr;
			print: 'Error finalizing ';
			show: self
	].