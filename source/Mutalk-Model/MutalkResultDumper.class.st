Class {
	#name : #MutalkResultDumper,
	#superclass : #Object,
	#instVars : [
		'mutationTestingResult'
	],
	#category : #'Mutalk-Model-Results'
}

{ #category : #'instance creation' }
MutalkResultDumper class >> for: aMutationTestingAnalysisResult [

	^ self new
		initializeFor: aMutationTestingAnalysisResult;
		yourself
]

{ #category : #initialization }
MutalkResultDumper >> initializeFor: aMutationTestingAnalysisResult [

	mutationTestingResult := aMutationTestingAnalysisResult
]

{ #category : #initialization }
MutalkResultDumper >> value [

	^ NeoJSONWriter toString: mutationTestingResult
]
