Class {
	#name : #ReplaceAndWithNandMutantOperator,
	#superclass : #SelectorReplacementMutantOperator,
	#category : #'Mutalk-Model-Operators'
}

{ #category : #accessing }
ReplaceAndWithNandMutantOperator >> newSelector [
	^#nand:
]

{ #category : #accessing }
ReplaceAndWithNandMutantOperator >> oldSelector [
	^#and:
]
