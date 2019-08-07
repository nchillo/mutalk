Class {
	#name : #ReplaceIfTrueIfFalseReceiverWithTrueOperator,
	#superclass : #ReplaceIfTrueIfFalseReceiverOperator,
	#category : #'Mutalk-Model-Operators'
}

{ #category : #applying }
ReplaceIfTrueIfFalseReceiverWithTrueOperator >> newReceiverExpression [ 
	^'true'
]

{ #category : #suggestions }
ReplaceIfTrueIfFalseReceiverWithTrueOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [
	^aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceIfTrueIfFalseReceiverWithTrueOperator: aMutation.
]
