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
		'detectedContaminated'
	],
	#category : 'HideOrShareModel',
	#package : 'HideOrShareModel'
}

{ #category : 'control' }
HSHorticulturist >> destroySomeTrees [

"Destroys only the infected tree, i.e. remove the field covering the infected plot"
]

{ #category : 'control' }
HSHorticulturist >> detectSymptoms [

"Checks the status of all the plots of the property"
]

{ #category : 'initialize' }
HSHorticulturist >> initialize [ 

	super initialize 
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
	^ CMPointOfView color: Color white
]

{ #category : 'control' }
HSHorticulturist >> reportSymptoms [

"If a plot is infected, communicates it with destroyers"
]
