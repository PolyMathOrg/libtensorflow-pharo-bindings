release
finalize
	[self delete] on: Error do: [
		Transcript
			newLine;
			print: 'Error finalizing ';
			show: self
	].