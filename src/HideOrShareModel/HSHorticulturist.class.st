Class {
	#name : 'HSHorticulturist',
	#superclass : 'CMAgent',
	#traits : 'TCMLocated',
	#classTraits : 'TCMLocated classTrait',
	#instVars : [
		'plots',
		'status',
		'detectionLevel',
		'availableForTraining',
		'detectedContaminatedPlots'
	],
	#classInstVars : [
		'minInitialDetectionLevel'
	],
	#category : 'HideOrShareModel',
	#package : 'HideOrShareModel'
}

{ #category : 'initialization' }
HSHorticulturist class >> initializeParameters [ 

	super initializeParameters.
	minInitialDetectionLevel := 0.5
]

{ #category : 'accessing' }
HSHorticulturist class >> minInitialDetectionLevel [

	^ minInitialDetectionLevel
]

{ #category : 'accessing' }
HSHorticulturist class >> minInitialDetectionLevel: anObject [

	minInitialDetectionLevel := anObject
]

{ #category : 'testing' }
HSHorticulturist >> hasAnyInfectedField [
	".."

	
	^ plots anySatisfy: [ :each | each infectionLevel > detectionLevel ] 
]

{ #category : 'control' }
HSHorticulturist >> hide [

	self hasAnyInfectedField ifFalse: [^ self].
	
	self moveTo: self mostInfectedField.
	self patch destroy
]

{ #category : 'initialize' }
HSHorticulturist >> initialize [

	super initialize.
	self setDetectionLevel 
	
]

{ #category : 'accessing' }
HSHorticulturist >> mostInfectedField [
	".."
	
	| candidatePlots |

	candidatePlots := plots select: [ :plot | 
		plot infectionLevel > detectionLevel ].
	
	candidatePlots sort: [ :a :b |
		a infectionLevel < b infectionLevel ].

	^ candidatePlots first.




	"ownedInfectedPlots := plots select: #isInfected <= detectionLevel.
	ownedInfectedPlots
		ifEmpty: [ ""self randomWalk""
		destination := plots maxValue: #infectionLevel ]
		ifNotEmpty: [
		destination := self selectRandomlyFrom: ownedInfectedPlots ].
	self moveTo: destination"

	"heighestInfectionLevelAround := self neighbourhood maxValue:
		                                #infectionLevel."
]

{ #category : 'accessing' }
HSHorticulturist >> ownedPlots [ 

^ plots
]

{ #category : 'accessing' }
HSHorticulturist >> plots: aCollection [

	plots := aCollection
]

{ #category : 'pov' }
HSHorticulturist >> pov [

	<pov>
	^ CMPointOfView
		image: CMCat walkingDown first
		size: 30
	"^ CMPointOfView color: Color lightGreen shape: #square size: 12"
]

{ #category : 'control' }
HSHorticulturist >> reportSymptoms [
	"If a plot is infected, communicates it with destroyers.
	-------> but maybe it is not necessary, as destroyers can just check in all the plots where is the closest infected one and then destroy it + the 8 neighbours. TBC"

	
]

{ #category : 'control' }
HSHorticulturist >> setDetectionLevel [

	detectionLevel := self
		randomBetween: self class minInitialDetectionLevel
		and: 1
]

{ #category : 'stepping' }
HSHorticulturist >> step [

	self hide.
]
