release
finalize
	[self delete] on: Error do: [
		Transcript
			cr;
			print: 'Error finalizing ';
			show: self
	].