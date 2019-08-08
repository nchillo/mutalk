Class {
	#name : #AuxiliarTestClassForTestingStrategies,
	#superclass : #TestCase,
	#category : #'Mutalk-Model-TestResources'
}

{ #category : #'as yet unclassified' }
AuxiliarTestClassForTestingStrategies >> testMethodThatCoverMethod1 [

	self assert: AuxiliarClassForTestingStrategies new method1 equals: 1. 
	
	
]

{ #category : #'as yet unclassified' }
AuxiliarTestClassForTestingStrategies >> testMethodThatCoverMethod2 [

	self assert: AuxiliarClassForTestingStrategies new method2 equals: 2. 
	
	
]
