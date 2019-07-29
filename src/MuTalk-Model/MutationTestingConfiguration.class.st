Class {
	#name : #MutationTestingConfiguration,
	#superclass : #Object,
	#instVars : [
		'generationStrategy',
		'runningStrategy',
		'operators',
		'logger'
	],
	#category : #'MuTalk-Model-Generation'
}

{ #category : #'Instance Creation' }
MutationTestingConfiguration class >> default [

	^ self
		forAll: MutantOperator contents
		with: AllMutationsGenerationStrategy new
		and: AllTestsMethodsRunningMutantEvaluationStrategy new
		using: NullMutationTestingAnalysisLogger new
]

{ #category : #'Instance Creation' }
MutationTestingConfiguration class >> forAll: operators with: aMutantGenerationStrategy and: anEvaluationStrategy using: aLogger [

	^ self new
		initializeGenerating: aMutantGenerationStrategy
		evaluating: anEvaluationStrategy
		logging: aLogger
		using: operators
]

{ #category : #Accessing }
MutationTestingConfiguration >> evaluationStrategy [

	^ runningStrategy
]

{ #category : #Accessing }
MutationTestingConfiguration >> generationStrategy [

	^ generationStrategy
]

{ #category : #initialization }
MutationTestingConfiguration >> initializeGenerating: aGenerationStrategy evaluating: anEvaluationStrategy logging: aNullMutationTestingAnalysisLogger using: anOperatorsCollection [

	generationStrategy := aGenerationStrategy.
	runningStrategy := anEvaluationStrategy.
	logger := aNullMutationTestingAnalysisLogger.
	operators := anOperatorsCollection
]

{ #category : #acccessing }
MutationTestingConfiguration >> logger [
	^ logger
]

{ #category : #accessing }
MutationTestingConfiguration >> operators [
	^ operators
]