Class {
	#name : #SelectingFromCoverageMutationsGenerationStrategy,
	#superclass : #MutationsGenerationStrategy,
	#category : #'MuTalk-Model-Strategies'
}

{ #category : #generating }
SelectingFromCoverageMutationsGenerationStrategy >> methodsToMutateFrom: aCoverageResult [

	^ aCoverageResult coveredMethods
]
