Class {
	#name : 'HSField',
	#superclass : 'Object',
	#category : 'HideOrShareModel',
	#package : 'HideOrShareModel'
}

{ #category : 'accessing' }
HSField >> color [ 

self subclassResponsibility 
]

{ #category : 'testing' }
HSField >> isAlmondTree [

	^ false
]

{ #category : 'testing' }
HSField >> isOliveTree [

	^ false
]

{ #category : 'testing' }
HSField >> isVineyard [

	^ false
]

{ #category : 'accessing' }
HSField >> sensitivityToBacteria [

	self subclassResponsibility
]
