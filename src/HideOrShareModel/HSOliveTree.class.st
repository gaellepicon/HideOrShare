Class {
	#name : 'HSOliveTree',
	#superclass : 'HSField',
	#instVars : [
		'sensitivityBacteriaA',
		'sensitivityBacteriaB'
	],
	#category : 'HideOrShareModel',
	#package : 'HideOrShareModel'
}

{ #category : 'accessing' }
HSOliveTree >> color [

	^ Color fromHexString: '959504'
]

{ #category : 'testing' }
HSOliveTree >> isOliveTree [

	^ true
]
