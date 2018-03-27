initialization
setUp
	| imageSet labelSet n |
	imageSet := MNISTImageFile testSet.
	labelSet := MNISTLabelFile testSet.
	n := 2.
	images := (1 to: n) collect: [ :i | imageSet bytesAt: i ].
	labels := (1 to: n) collect: [ :i | labelSet at: i ]