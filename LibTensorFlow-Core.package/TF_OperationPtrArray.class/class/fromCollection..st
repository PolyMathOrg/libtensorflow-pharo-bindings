instance creation
fromCollection: aCollection
|answer|
answer := self externalNewType: self type size: aCollection size.
aCollection withIndexDo: [ :each :index | answer at: index put: each ].
^answer