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
	#category : 'HideOrShareModel',
	#package : 'HideOrShareModel'
}

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

	isDestroyed := true
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

	| heighestInfectionLevelAround |
	self isHealthy ifFalse: [ ^ self ].

	heighestInfectionLevelAround := self neighbourhood maxValue:
		                                #infectionLevel.

	self random < heighestInfectionLevelAround ifTrue: [
		infectionLevel := heighestInfectionLevelAround * self contagionRate ]
]

{ #category : 'testing' }
HSPlot >> hasAlmondTree [

	^ field isAlmondTree
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

{ #category : 'testing' }
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
	^ CMPointOfView color: field color
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
]

{ #category : 'pov' }
HSPlot >> povOwner [

	<pov>
	^ CMPointOfView color: owner povId color darker darker 
]

{ #category : 'control' }
HSPlot >> setInfection [ 

infectionLevel := 0.5
	
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
