Class {
	#name : #SelectingFromCoverageMutationsGenerationStrategy,
	#superclass : #MutationsGenerationStrategy,
	#category : #'Mutalk-Model-Strategies'
}

{ #category : #generating }
SelectingFromCoverageMutationsGenerationStrategy >> methodsToMutateFrom: aCoverageResult [

	^ aCoverageResult coveredMethods
]
