Class {
	#name : 'HSOliveTree',
	#superclass : 'HSField',
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

{ #category : 'pov' }
HSOliveTree >> sensitivityToBacteria [

	^ 0.4
]
