Class {
	#name : 'HSDestroyer',
	#superclass : 'HSPlantServiceAgent',
	#traits : 'TCMLocated',
	#classTraits : 'TCMLocated classTrait',
	#instVars : [
		'location'
	],
	#category : 'HideOrShareModel',
	#package : 'HideOrShareModel'
}

{ #category : 'control' }
HSDestroyer >> destroy [ 
"When a plot is reported as infected by a horticulturist, one destroyer comes to this plot and destroys it + the 8 neighbors (i.e. removes the field from the plot"
]
