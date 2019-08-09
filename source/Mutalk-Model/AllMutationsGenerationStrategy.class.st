Class {
	#name : #AllMutationsGenerationStrategy,
	#superclass : #MutationsGenerationStrategy,
	#category : #'Mutalk-Model-Strategies'
}

{ #category : #generating }
AllMutationsGenerationStrategy >> methodsToMutateFrom: aCoverageResult [

	^ aCoverageResult modelMethods
]
