Class {
	#name : #ReplaceOrWithXorMutantOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : #'Mutalk-Model-Operators'
}

{ #category : #accessing }
ReplaceOrWithXorMutantOperator >> newSelector [
	^#bXor:
]

{ #category : #accessing }
ReplaceOrWithXorMutantOperator >> oldSelector [
	^#or:
]

{ #category : #suggestions }
ReplaceOrWithXorMutantOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [ 
	^ aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceOrWithXorMutantOperator: aMutation
]
