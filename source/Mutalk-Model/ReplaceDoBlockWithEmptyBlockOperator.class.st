Class {
	#name : #ReplaceDoBlockWithEmptyBlockOperator,
	#superclass : #MutantOperator,
	#category : #'Mutalk-Model-Operators'
}

{ #category : #printing }
ReplaceDoBlockWithEmptyBlockOperator >> description [
	^'Replace do block with [:each |]'.
]

{ #category : #applying }
ReplaceDoBlockWithEmptyBlockOperator >> expressionToReplace [ 
	^'``@collection do: ``@aBlock'
]

{ #category : #applying }
ReplaceDoBlockWithEmptyBlockOperator >> newExpression [
	^'``@collection do: [:each | ]'
]

{ #category : #suggestions }
ReplaceDoBlockWithEmptyBlockOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByADoBlockWithEmptyBlockOperator: aMutation.
]
