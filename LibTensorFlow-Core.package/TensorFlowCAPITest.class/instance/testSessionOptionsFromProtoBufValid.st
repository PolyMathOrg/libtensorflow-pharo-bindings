testing options
testSessionOptionsFromProtoBufValid
	"
	In [241]: tf.ConfigProto(allow_soft_placement=True, log_device_placement=True).SerializeToString()
	Out[241]: b'8\x01@\x01'
	"

	| config |
	config := #[16r38 1 16r40 1].
	TF_SessionOptions fromProtoBuf: config