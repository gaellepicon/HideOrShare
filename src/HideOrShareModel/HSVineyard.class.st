Class {
	#name : 'HSVineyard',
	#superclass : 'HSField',
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

{ #category : 'pov' }
HSVineyard >> sensitivityToBacteria [

	^ 0.6
]
