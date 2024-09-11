Class {
	#name : 'HSPlot',
	#superclass : 'CMSpatialEntityCell',
	#instVars : [
		'field',
		'owner'
	],
	#category : 'HideOrShareModel',
	#package : 'HideOrShareModel'
}

{ #category : 'initialize' }
HSPlot >> beCoveredBy: aSpecies [

field := aSpecies new 

	
]

{ #category : 'accessing' }
HSPlot >> field [

	^ field
]

{ #category : 'accessing' }
HSPlot >> field: anObject [

	field := anObject
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

{ #category : 'accessing' }
HSPlot >> isNotCoveredByAnyField [

	^ field isNil 
]

{ #category : 'accessing' }
HSPlot >> pov [

	<pov>
	^ CMPointOfView color: field color
]
