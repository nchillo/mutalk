Class {
	#name : #ReplaceOrWithAndMutantOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : #'Mutalk-Model-Operators'
}

{ #category : #accessing }
ReplaceOrWithAndMutantOperator >> newSelector [
	^#and:
]

{ #category : #accessing }
ReplaceOrWithAndMutantOperator >> oldSelector [
	^#or:
]

{ #category : #suggestions }
ReplaceOrWithAndMutantOperator >> suggestionFor: aMutation using: aMutantKillingSuggestionGenerator [ 
	^ aMutantKillingSuggestionGenerator suggestionForMutationProducedByAReplaceOrWithAndMutantOperator: aMutation
]
