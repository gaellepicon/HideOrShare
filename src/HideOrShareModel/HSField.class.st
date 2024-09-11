Class {
	#name : 'HSField',
	#superclass : 'Object',
	#instVars : [
		'epidemicStatus',
		'status',
		'reportedByOwner',
		'probabilityToSpread',
		'infectionType'
	],
	#category : 'HideOrShareModel',
	#package : 'HideOrShareModel'
}

{ #category : 'control' }
HSField >> checkInfectedNeighbors [

"..."

	
]

{ #category : 'pov' }
HSField >> color [ 

self subclassResponsibility 
]

{ #category : 'control' }
HSField >> increaseInfectionLevel [

"At each step, updates its infection level according to the following calculation:
infection_level + sensitivity_to_A*(1-infection_level)*infection_level"

]

{ #category : 'initialize' }
HSField >> initialize [

	super initialize.
	"bufferState := #olivetree"
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
