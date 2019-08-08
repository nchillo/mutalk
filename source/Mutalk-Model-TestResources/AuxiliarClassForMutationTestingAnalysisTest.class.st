Class {
	#name : #AuxiliarClassForMutationTestingAnalysisTest,
	#superclass : #TestCase,
	#category : #'Mutalk-Model-TestResources'
}

{ #category : #testing }
AuxiliarClassForMutationTestingAnalysisTest >> testAnotherMethodWithOneIfFalseSender [
	self assert: AuxiliarClassForMutationTestingAnalysis new anotherMethodWithOneIfFalseSender equals: 1
]

{ #category : #testing }
AuxiliarClassForMutationTestingAnalysisTest >> testClassMethodThatSendsSelect [
	self assert: AuxiliarClassForMutationTestingAnalysis classMethodThatSendsSelect notEmpty
]

{ #category : #testing }
AuxiliarClassForMutationTestingAnalysisTest >> testMethodWithOneIfFalseSender [
	self assert: AuxiliarClassForMutationTestingAnalysis new methodWithOneIfFalseSender equals: 2
]

{ #category : #testing }
AuxiliarClassForMutationTestingAnalysisTest >> testMethodWithOneIfTrueSender [
	self assert: AuxiliarClassForMutationTestingAnalysis new methodWithOneIfTrueSender equals: 1
]

{ #category : #testing }
AuxiliarClassForMutationTestingAnalysisTest >> testMethodWithOnePlusSender [
	self assert: AuxiliarClassForMutationTestingAnalysis new methodWithOnePlusSender equals: 3
]

{ #category : #testing }
AuxiliarClassForMutationTestingAnalysisTest >> testMethodWithTwoMinusSenders [
	self assert: AuxiliarClassForMutationTestingAnalysis new methodWithTwoMinusSenders equals: -4
]
