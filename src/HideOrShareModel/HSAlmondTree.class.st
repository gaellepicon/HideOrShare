Class {
	#name : 'HSAlmondTree',
	#superclass : 'HSField',
	#category : 'HideOrShareModel',
	#package : 'HideOrShareModel'
}

{ #category : 'accessing' }
HSAlmondTree >> color [

	^ CMColor gold
]

{ #category : 'testing' }
HSAlmondTree >> isAlmondTree [ 

	^ true
]

{ #category : 'accessing' }
HSAlmondTree >> sensitivityToBacteria [ 

	^ 0.1
]
