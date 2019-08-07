Class {
	#name : #CoverageAnalysis,
	#superclass : #Object,
	#instVars : [
		'classes',
		'testCases'
	],
	#category : #'MuTalk-Model-Coverage'
}

{ #category : #'instance creation' }
CoverageAnalysis class >> for: aCollectionOfClasses running: aCollectionOfTestCases [
	^self new initializeFor: aCollectionOfClasses running: aCollectionOfTestCases
]

{ #category : #private }
CoverageAnalysis >> addTestsFrom: aWrapper to: methodToTestDictionary [

	aWrapper tests notEmpty
		ifTrue: [ ( methodToTestDictionary
				at: aWrapper reference compiledMethod
				ifAbsentPut: [ IdentitySet new ] ) addAll: aWrapper tests
			]
]

{ #category : #accessing }
CoverageAnalysis >> classes [

	^ classes
]

{ #category : #accessing }
CoverageAnalysis >> classesAndMetaClasses [

	^ classes
		inject: OrderedCollection new
		into: [ :allClasses :aClass | 
			allClasses
				add: aClass;
				add: aClass class.
			allClasses
			]
]

{ #category : #private }
CoverageAnalysis >> flushMethodLookupCaches [

	Behavior flushCache
]

{ #category : #'initialize-release' }
CoverageAnalysis >> initializeFor: aCollectionOfClasses running: aCollectionOfTestCases [

	classes := aCollectionOfClasses asOrderedCollection.
	testCases := aCollectionOfTestCases
]

{ #category : #private }
CoverageAnalysis >> installAll: wrappers [

	wrappers do: [ :each | each install ]
]

{ #category : #private }
CoverageAnalysis >> methodReferences [

	^ self classesAndMetaClasses
		inject: OrderedCollection new
		into: [ :methodReferences :aClass | 
			methodReferences
				addAll:
					( aClass selectors
						collect: [ :aSelector | RGMethodDefinition class: aClass selector: aSelector ] ).
			methodReferences
			]
]

{ #category : #private }
CoverageAnalysis >> methodToTestDictionaryFrom: wrappers [

	^ wrappers
		inject: IdentityDictionary new
		into: [ :methodToTestDictionary :aWrapper | 
			self addTestsFrom: aWrapper to: methodToTestDictionary.
			methodToTestDictionary
			]
]

{ #category : #private }
CoverageAnalysis >> methodWrappersFor: methodReferences using: aCoverageContext [

	^ methodReferences
		collect: [ :each | MethodWrapperForCoverage on: each for: aCoverageContext ]
]

{ #category : #evaluating }
CoverageAnalysis >> run [

	| wrappers coverageContext elapsedTime |

	coverageContext := CoverageContext new.
	wrappers := self
		methodWrappersFor: self methodReferences
		using: coverageContext.
	elapsedTime := self
		runTestsInstalling: wrappers
		using: coverageContext.
	^ CoverageAnalysisResult
		for: self
		from: ( self methodToTestDictionaryFrom: wrappers )
		elapsedTime: elapsedTime
]

{ #category : #private }
CoverageAnalysis >> runTestsInstalling: wrappers using: coverageContext [

	^ [ self installAll: wrappers.
	self flushMethodLookupCaches.
	Time millisecondsToRun: [ self runTestsUsing: coverageContext ]
	]
		ensure: [ self uninstallAll: wrappers ]
]

{ #category : #private }
CoverageAnalysis >> runTestsUsing: coverageContext [

	| suite |

	suite := TestSuiteWrappedForCoverage
		for: coverageContext
		named: 'Test Suite for Coverage'.
	suite addTests: testCases.
	suite run
]

{ #category : #accessing }
CoverageAnalysis >> testCases [

	^ testCases
]

{ #category : #private }
CoverageAnalysis >> uninstallAll: wrappers [

	^ wrappers do: [ :each | each uninstall ]
]
