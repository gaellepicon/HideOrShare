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
	"Check in its 8 neighbors if at least one is infected."

	
]

{ #category : 'control' }
HSField >> chooseInfectedNeighbor [
	"If several infected neighbors, choose the one infected by the most sensitive bacteria. If several plots are infected by this bacteria, then choose the plots with the highest severity"

	
]

{ #category : 'pov' }
HSField >> color [ 

self subclassResponsibility 
]

{ #category : 'control' }
HSField >> getInfected [ 

"Updates its epidemic status from Healthy to Infected and gets half the infection level the infected neighbor has, with a probability which is equal to the infection level of the selected infected neighbor.
Example: plot p1 has a plot p2 neighbor with 60% of infection severity. Then, p1 has 60% of chances to get infected and if it becomes infected, it will have 30% of infection severity."
	
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
