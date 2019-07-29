Class {
	#name : #MutationTestingErrorResult,
	#superclass : #MutationResult,
	#instVars : [
		'message'
	],
	#category : #'MuTalk-Model-Results'
}

{ #category : #'instance creation' }
MutationTestingErrorResult class >> describedAs: aMessage [

	^ self new initializeDescribedAs: aMessage
]

{ #category : #accessing }
MutationTestingErrorResult >> elapsedTime [

	^ Duration new
]

{ #category : #initialization }
MutationTestingErrorResult >> initializeDescribedAs: aMessage [

	message := aMessage
]

{ #category : #accessing }
MutationTestingErrorResult >> particularResults [

	^ OrderedCollection new
]

{ #category : #printing }
MutationTestingErrorResult >> printOn: aStream [

	aStream
		nextPutAll: 'Failed: ';
		nextPutAll: message
]