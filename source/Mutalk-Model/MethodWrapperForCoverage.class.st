Class {
	#name : #MethodWrapperForCoverage,
	#superclass : #TestCoverage,
	#instVars : [
		'tests',
		'coverageContext'
	],
	#category : #'Mutalk-Model-Generation'
}

{ #category : #'instance creation' }
MethodWrapperForCoverage class >> on: aMethodReference for: aCoverageContext [

	^ self new initializeOn: aMethodReference for: aCoverageContext
]

{ #category : #initialization }
MethodWrapperForCoverage >> initializeOn: aMethodReference for: aCoverageContext [

	self initializeOn: aMethodReference.
	coverageContext := aCoverageContext.
	tests := Set new
]

{ #category : #private }
MethodWrapperForCoverage >> mark [
	|currentTest|
	super mark.
	currentTest := coverageContext currentTest.
	currentTest ifNotNil: [tests add: currentTest]. 
	

]

{ #category : #accessing }
MethodWrapperForCoverage >> run: aSelector with: anArray in: aReceiver [

	self mark.
	^ aReceiver withArgs: anArray executeMethod: method
]

{ #category : #accessing }
MethodWrapperForCoverage >> tests [

	^ tests
]
