Class {
	#name : 'BaselineOfHideOrShareModel',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfHideOrShareModel',
	#package : 'BaselineOfHideOrShareModel'
}

{ #category : 'baselines' }
BaselineOfHideOrShareModel >> baseline: spec [

	<baseline>
	spec for: #common do: [
		
		"Packages"
		spec package: 'HideOrShareModel' ]
]
