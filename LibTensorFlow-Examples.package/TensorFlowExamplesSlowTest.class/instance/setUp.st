initialization
setUp
	| imageSet labelSet N |
	imageSet := MNISTImageFile testSet.
	labelSet := MNISTLabelFile testSet.
	N := 2.
	images := (1 to: N) collect: [ :i | imageSet bytesAt: i ].
	labels := (1 to: N) collect: [ :i | labelSet at: i ]