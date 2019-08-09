Class {
	#name : #RemoveNotOperator,
	#superclass : #MutantOperator,
	#category : #'Mutalk-Model-Operators'
}

{ #category : #printing }
RemoveNotOperator >> description [
	^'Remove #not'.
]

{ #category : #applying }
RemoveNotOperator >> expressionToReplace [

	^ '``@aBoolean not'
]

{ #category : #applying }
RemoveNotOperator >> newExpression [

	^ '``@aBoolean'
]
