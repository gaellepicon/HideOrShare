Class {
	#name : 'HSAlmondTree',
	#superclass : 'HSField',
	#instVars : [
		'sensitivityBacteriaA',
		'sensitivityBacteriaB'
	],
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
