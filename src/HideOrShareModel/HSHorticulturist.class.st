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
	#category : 'HideOrShareModel',
	#package : 'HideOrShareModel'
}

{ #category : 'control' }
HSHorticulturist >> destroyField [
	"Destroys only the infected tree, i.e. remove the field covering the infected plot"

	self patch field: nil
]

{ #category : 'accessing' }
HSHorticulturist >> detectionLevel [

	^ detectionLevel
]

{ #category : 'testing' }
HSHorticulturist >> hasAnyInfectedField [
	".."

	
	^ plots includes: [ :each | each isInfected ] 
]

{ #category : 'control' }
HSHorticulturist >> hide [

	self hasAnyInfectedField ifTrue: [
		  self moveTo: self mostInfectedField. self patch destroyField ]
]

{ #category : 'initialize' }
HSHorticulturist >> initialize [

	super initialize.
	self setDetectionLevel 
	
]

{ #category : 'accessing' }
HSHorticulturist >> mostInfectedField [
	".."

	^ (plots asSortedCollection: [ :p1 :p2 |
		                p1 infectionLevel > p2 infectionLevel ]) first.




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
	^ CMPointOfView color: Color lightGreen shape: #square size: 12
]

{ #category : 'control' }
HSHorticulturist >> reportSymptoms [
	"If a plot is infected, communicates it with destroyers.
	-------> but maybe it is not necessary, as destroyers can just check in all the plots where is the closest infected one and then destroy it + the 8 neighbours. TBC"

	
]

{ #category : 'control' }
HSHorticulturist >> setDetectionLevel [

	detectionLevel := self randomBetween: 0.1 and: 1
]

{ #category : 'stepping' }
HSHorticulturist >> step [

	self hide.
]
