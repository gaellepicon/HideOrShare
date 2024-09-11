Class {
	#name : 'HSVineyard',
	#superclass : 'HSField',
	#instVars : [
		'sensitivityBacteriaA',
		'sensitivityBacteriaB'
	],
	#category : 'HideOrShareModel',
	#package : 'HideOrShareModel'
}

{ #category : 'accessing' }
HSVineyard >> color [

	^ Color fromHexString: '80066D'
]

{ #category : 'testing' }
HSVineyard >> isVineyard [

	^ true
]
