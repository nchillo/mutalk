Class {
	#name : #ReplaceRejectBlockWithAlwaysFalseBlockOperator,
	#superclass : #MutantOperator,
	#category : #'Mutalk-Model-Operators'
}

{ #category : #printing }
ReplaceRejectBlockWithAlwaysFalseBlockOperator >> description [
	^'Replace Reject block with [:each | false]'.
]

{ #category : #applying }
ReplaceRejectBlockWithAlwaysFalseBlockOperator >> expressionToReplace [ 
	^'``@collection reject: ``@aBlock'
]

{ #category : #applying }
ReplaceRejectBlockWithAlwaysFalseBlockOperator >> newExpression [
	^'``@collection reject: [:each | false]'
]
