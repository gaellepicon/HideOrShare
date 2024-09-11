Class {
	#name : 'HSModel',
	#superclass : 'CMAbstractModel',
	#instVars : [
		'horticulturists',
		'plots',
		'destroyers',
		'trainers'
	],
	#classInstVars : [
		'field'
	],
	#category : 'HideOrShareModel',
	#package : 'HideOrShareModel'
}

{ #category : 'initialization' }
HSModel >> basicCreation [ 

	<init>
	self basicLandscape.
	self createN: 9 randomlyLocatedEntities: HSHorticulturist 
	
]

{ #category : 'initialization' }
HSModel >> basicLandscape [

	<init>
	self
		createGridNumberOfRows: 30
		numberOfColumns: 30
		neighbourhood: 8
		closed: true.

	"plots do: [ :plot |
		plot beCoveredBy: (self selectRandomlyFrom: HSField subclasses) ]."
	
	self coverRandomPlotsWith: HSOliveTree proportion: 1/3.
	self coverRandomPlotsWith: HSAlmondTree proportion: 1/3.
	self coverRandomPlotsWith: HSVineyard proportion: 1/3.

	

	"oliveTreePlots := self
		                  selectRandomlyFrom:
		                  (plots select: [ :each | each isCoveredByAnyField ])
		                  size: (plots size / 3) rounded.
	oliveTreePlots do: [ :each | each beCoveredBy: HSOliveTree ].


	vineyardPlots := self
		                 selectRandomlyFrom:
		                 (plots select: [ :each | each isCoveredByAnyField ])
		                 size: (plots size / 3) rounded.
	vineyardPlots do: [ :each | each beCoveredBy: HSVineyard ].


	almondTreePlots := self
		                   selectRandomlyFrom:
		                   (plots select: [ :each |
			                    each isCoveredByAnyField ])
		                   size: (plots size / 3) rounded.
	almondTreePlots do: [ :each | each beCoveredBy: HSAlmondTree ]"
]

{ #category : 'control' }
HSModel >> basicStep [

	<control>

]

{ #category : 'as yet unclassified' }
HSModel >> coverRandomPlotsWith: aFieldClass proportion: aNumber [

	| selectedPlots |
	selectedPlots := self
		selectRandomlyFrom: (plots select: #isNotCoveredByAnyField)
		size: (plots size * aNumber) rounded.
		
	selectedPlots do: [ :each | each beCoveredBy: aFieldClass ]
]

{ #category : 'accessing' }
HSModel >> destroyers [

	<getterFor: #HSDestroyer>
	^ destroyers
]

{ #category : 'accessing' }
HSModel >> horticulturists [

	<getterFor: #HSHorticulturist>
	^ horticulturists 
]

{ #category : 'initialization' }
HSModel >> initialize [

	super initialize.
	plots := OrderedCollection new.
	horticulturists := OrderedCollection new.
	trainers := OrderedCollection new.
	destroyers := OrderedCollection new
]

{ #category : 'as yet unclassified' }
HSModel >> numberOfOliveTrees [

	<probeNamed: 'Number of olive trees' color: '959504'>
	^ plots count: #hasOliveTree
]

{ #category : 'accessing' }
HSModel >> plantServiceAgents [

	^ trainers, destroyers
]

{ #category : 'accessing' }
HSModel >> plots [

	<getterFor: #HSPlot>
	^ plots
]

{ #category : 'accessing' }
HSModel >> trainers [

	<getterFor: #HSTrainer> 
	^ trainers
]