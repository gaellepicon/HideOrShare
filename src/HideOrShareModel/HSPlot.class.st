Class {
	#name : 'HSPlot',
	#superclass : 'CMSpatialEntityCell',
	#instVars : [
		'field',
		'owner',
		'isDestroyed',
		'reportedByOwner',
		'probabilityToSpread',
		'infectionType',
		'infectionLevel',
		'sensitivityToBacteria',
		'contagionRate'
	],
	#classInstVars : [
		'initialInfectionLevel'
	],
	#category : 'HideOrShareModel',
	#package : 'HideOrShareModel'
}

{ #category : 'accessing' }
HSPlot class >> initialInfectionLevel [

	^ initialInfectionLevel
]

{ #category : 'accessing' }
HSPlot class >> initialInfectionLevel: anObject [

	initialInfectionLevel := anObject
]

{ #category : 'initialization' }
HSPlot class >> initializeParameters [
	
	super initializeParameters.
	initialInfectionLevel := 0.3
]

{ #category : 'initialize' }
HSPlot >> beCoveredBy: aSpecies [

	field := aSpecies new.
]

{ #category : 'accessing' }
HSPlot >> contagionRate [

	^ 0.5
]

{ #category : 'deleting' }
HSPlot >> destroy [

	<action>
	isDestroyed := true.
	infectionLevel := 0
]

{ #category : 'deleting' }
HSPlot >> destroyWithNeighbours [

	<action>
	self destroy.
	self neighbourhood do: [ :each | each destroy ]
]

{ #category : 'accessing' }
HSPlot >> field [

	^ field
]

{ #category : 'accessing' }
HSPlot >> field: anObject [

	field := anObject
]

{ #category : 'control' }
HSPlot >> getInfected [

	| highestInfectionLevelAround |
	self isHealthy ifFalse: [ ^ self ].
	self isDestroyed ifTrue: [ ^ self ].

	highestInfectionLevelAround := self neighbourhood maxValue:
		                                #infectionLevel.

	self random < highestInfectionLevelAround ifTrue: [
		infectionLevel := highestInfectionLevelAround * self contagionRate ]
]

{ #category : 'testing' }
HSPlot >> hasAlmondTree [

	^ field isAlmondTree
]

{ #category : 'testing' }
HSPlot >> hasField [ 

	^ isDestroyed not 
]

{ #category : 'testing' }
HSPlot >> hasOliveTree [

	^ field isOliveTree
]

{ #category : 'testing' }
HSPlot >> hasVineyard [

	^ field isVineyard
]

{ #category : 'control' }
HSPlot >> increaseInfectionLevel [
	"At each step, updates its infection level according to the following calculation:
infection_level + sensitivity_to_A*(1-infection_level)*infection_level"

	infectionLevel := infectionLevel
	                  +
	                  (field sensitivityToBacteria * (1 - infectionLevel)
	                   * infectionLevel)
]

{ #category : 'control' }
HSPlot >> infectionLevel [

	^ infectionLevel
]

{ #category : 'initialization' }
HSPlot >> initialize [

	super initialize.
	infectionLevel := 0.
	isDestroyed := false
]

{ #category : 'control' }
HSPlot >> isDestroyed [

^ isDestroyed 
]

{ #category : 'testing' }
HSPlot >> isHealthy [

	^ self isInfected not
]

{ #category : 'testing' }
HSPlot >> isInfected [ 

^ infectionLevel > 0 
]

{ #category : 'accessing' }
HSPlot >> isNotCoveredByAnyField [

	^ field isNil 
]

{ #category : 'accessing' }
HSPlot >> owner [

	^ owner
]

{ #category : 'accessing' }
HSPlot >> owner: anObject [

	owner := anObject
]

{ #category : 'pov' }
HSPlot >> pov [

	<pov>
	| color |
	self hasField ifFalse: [ ^ CMPointOfView color: Color black ].
	color :=  field color.

	self isInfected ifTrue: [ color := color + Color red ].

	^ CMPointOfView color: color
]

{ #category : 'pov' }
HSPlot >> povInfected [

	<pov>
	^ self isInfected
		  ifTrue: [
			  CMPointOfView color: (self
					   colorAttribute: #infectionLevel
					   min: 0
					   color: Color white
					   max: 1
					   color: CMColor red) ]
		  ifFalse: [ CMPointOfView color: Color white ]
	
	"^ self isInfected
		  ifTrue: [
			  CMPointOfView color: (self
					   colorAttribute: #infectionLevel
					   min: 0
					   color: field color
					   max: 1
					   color: CMColor red) ]
		  ifFalse: [ CMPointOfView color: field color ]"
]

{ #category : 'pov' }
HSPlot >> povOwner [

	<pov>
	^ CMPointOfView color: owner povId color darker darker 
]

{ #category : 'control' }
HSPlot >> setInfection [ 

	<action>
	infectionLevel := self class initialInfectionLevel
	
]

{ #category : 'control' }
HSPlot >> status [

	^ field status
]

{ #category : 'stepping' }
HSPlot >> step [

	self increaseInfectionLevel.
	self getInfected.
]
