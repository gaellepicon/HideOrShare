Class {
	#name : 'HSDestroyer',
	#superclass : 'HSPlantServiceAgent',
	#traits : 'TCMLocated',
	#classTraits : 'TCMLocated classTrait',
	#instVars : [
		'location',
		'plots'
	],
	#category : 'HideOrShareModel',
	#package : 'HideOrShareModel'
}

{ #category : 'testing' }
HSDestroyer >> findsAnyInfectedField [
	".."

	^ plots anySatisfy: [ :each | each isInfected ]
]

{ #category : 'control' }
HSDestroyer >> monitorAndDestroy [

	self findsAnyInfectedField ifFalse: [ ^ self ].

	self moveTo: self mostInfectedFieldMonitored.
	self patch destroyWithNeighbours
]

{ #category : 'accessing' }
HSDestroyer >> mostInfectedFieldMonitored [
	".."

	| candidatePlots |
	candidatePlots := plots.
	candidatePlots sort: [ :a :b | a infectionLevel < b infectionLevel ].

	^ candidatePlots first
]

{ #category : 'accessing' }
HSDestroyer >> plots [

	^ plots
]

{ #category : 'accessing' }
HSDestroyer >> plots: anObject [

	plots := anObject
]

{ #category : 'pov' }
HSDestroyer >> pov [

	<pov>
	^ CMPointOfView color: Color orange shape: #circle size: 15
]

{ #category : 'stepping' }
HSDestroyer >> step [

	self monitorAndDestroy 
]
