Class {
	#name : #MethodMutationTest,
	#superclass : #TestCase,
	#category : #'MuTalk-Tests'
}

{ #category : #'testing accessing' }
MethodMutationTest >> testAccessing [

	| compiledMethod operator modifiedSource methodMutation |

	compiledMethod := AuxiliarClassForMutationTestingAnalysis >> #methodWithOnePlusSender.
	operator := ReplacePlusWithMinusMutantOperator new.
	modifiedSource := operator modifiedSourceFor: compiledMethod number: 1.
	methodMutation := MethodMutation
		for: compiledMethod
		using: operator
		result: modifiedSource
		ofClass: AuxiliarClassForMutationTestingAnalysis.
	self assert: methodMutation originalSource equals: compiledMethod sourceCode asString.
	self assert: methodMutation originalClass equals: AuxiliarClassForMutationTestingAnalysis.
	self assert: methodMutation modifiedSource equals: modifiedSource
]

{ #category : #'testing accessing' }
MethodMutationTest >> testAccessingToNodes [

	| compiledMethod operator modifiedSource methodMutation |

	compiledMethod := AuxiliarClassForMutationTestingAnalysis >> #methodWithOnePlusSender.
	operator := ReplacePlusWithMinusMutantOperator new.
	modifiedSource := operator modifiedSourceFor: compiledMethod number: 1.
	methodMutation := MethodMutation
		for: compiledMethod
		using: operator
		result: modifiedSource
		ofClass: AuxiliarClassForMutationTestingAnalysis.

	self assert: methodMutation nodeToMutate formattedCode equals: '1 + 2'.
	self assert: methodMutation mutatedNode formattedCode equals: '1 - 2'
]
