Class {
	#name : #MutationTestingGeneralResult,
	#superclass : #MutationResult,
	#instVars : [
		'particularResults',
		'elapsedTime'
	],
	#category : #'Mutalk-Model-Results'
}

{ #category : #'instance creation' }
MutationTestingGeneralResult class >> empty [

	^ self for: OrderedCollection new
]

{ #category : #'instance creation' }
MutationTestingGeneralResult class >> for: mutantsEvaluationsResults [

	^ self for: mutantsEvaluationsResults timed: Duration new
]

{ #category : #'instance creation' }
MutationTestingGeneralResult class >> for: mutantsEvaluationsResults timed: anElapsedTime [

	^ self new
		initializeFor: mutantsEvaluationsResults timed: anElapsedTime;
		yourself
]

{ #category : #testing }
MutationTestingGeneralResult >> elapsedTime [

	^ elapsedTime
]

{ #category : #private }
MutationTestingGeneralResult >> initializeFor: mutantsEvaluationsResults timed: anElapsedTime [

	particularResults := mutantsEvaluationsResults.
	elapsedTime := anElapsedTime
]

{ #category : #printing }
MutationTestingGeneralResult >> message [

	^ ''
]

{ #category : #accessing }
MutationTestingGeneralResult >> particularResults [

	^ particularResults
]

{ #category : #printing }
MutationTestingGeneralResult >> printDetailedInfoOn: aStream [

	( self particularResults
		groupedBy: [ :result | result mutant operator ] )
		keysAndValuesDo: [ :key :value | 
			aStream nextPutAll: key description.
			aStream nextPutAll: ' - '.
			aStream
				nextPutAll: value size printString;
				cr
			]
]

{ #category : #printing }
MutationTestingGeneralResult >> printOn: aStream [

	aStream
		nextPutAll: self numberOfEvaluatedMutants printString;
		nextPutAll: ' mutants, ';
		nextPutAll: self numberOfKilledMutants printString;
		nextPutAll: ' killed, ';
		nextPutAll: self numberOfAliveMutants printString;
		nextPutAll: ' alive, ';
		nextPutAll: self numberOfTerminatedMutants printString;
		nextPutAll: ' terminated. Mutation Score: ';
		nextPutAll: self mutationScore printString;
		nextPutAll: '%.'
]
