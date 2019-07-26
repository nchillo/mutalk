Class {
	#name : #MutationTestingGeneralResultReporter,
	#superclass : #Object,
	#instVars : [
		'mutationGeneralResult'
	],
	#category : #'MuTalk-Model-Reporting'
}

{ #category : #'instance creation' }
MutationTestingGeneralResultReporter class >> for: aMutationGeneralResut [

	^ self new
		initializeFor: aMutationGeneralResut;
		yourself
]

{ #category : #'initialize-release' }
MutationTestingGeneralResultReporter >> initializeFor: aMutationGeneralResut [

	mutationGeneralResult := aMutationGeneralResut.
]

{ #category : #evaluating }
MutationTestingGeneralResultReporter >> value [

	| stream |

	stream := String
		streamContents: [ :str | 
			str
				nextPutAll: mutationGeneralResult printString;
				cr.
			str
				nextPutAll: '----------------------------------';
				cr.
			str
				nextPutAll: mutationGeneralResult elapsedTime asMilliSeconds printString;
				tab.
			str cr.
			mutationGeneralResult printDetailedInfoOn: str
			].
	^ stream contents
]
