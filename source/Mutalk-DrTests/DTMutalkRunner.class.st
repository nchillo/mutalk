Class {
	#name : #DTMutalkRunner,
	#superclass : #DrTestsPlugin,
	#category : #'Mutalk-DrTests'
}

{ #category : #'api - accessing' }
DTMutalkRunner class >> pluginName [

	^'Mutation Testing'
]

{ #category : #'api - accessing' }
DTMutalkRunner class >> pluginResultClass [
  ^DTMutalkResult
]

{ #category : #'api - accessing' }
DTMutalkRunner class >> weight [

	^ 8
]

{ #category : #api }
DTMutalkRunner >> allowMiniDrTests [
	^ true
]

{ #category : #api }
DTMutalkRunner >> itemsToBeAnalysedFor: packagesSelected [
  ^RPackage organizer packages select: [:p |  p definedClasses anySatisfy: [:c |  c isTestCase not ] ]
]

{ #category : #accessing }
DTMutalkRunner >> oldPragmaForResultTrees [ 

  ^#()
]

{ #category : #accessing }
DTMutalkRunner >> pragmaForResultTrees [
  ^#dTMutalkResultTreeNamed:
]

{ #category : #api }
DTMutalkRunner >> resultButtonHelp [
  ^'Browse mutation testing results.' translated
]

{ #category : #api }
DTMutalkRunner >> runForConfiguration: aDTpluginConfiguration [

  | testClasses modelMethods analysis result |
  result := self pluginResultClass new.
  testClasses := aDTpluginConfiguration packagesSelected flatCollect: [:p |  p classes ].
  modelMethods := aDTpluginConfiguration items flatCollect: [:p |  p methods ].
  analysis := MutationTestingAnalysis testCasesFrom: testClasses mutating: modelMethods using: MutationTestingConfiguration fullAnalysis.
  result testResults: analysis run.
  ^result
]

{ #category : #accessing }
DTMutalkRunner >> secondListLabel [

	^ 'Package under analysis'
]

{ #category : #api }
DTMutalkRunner >> startButtonHelp [
  ^'Run Mutation testing in selected tests.' translated
]

{ #category : #api }
DTMutalkRunner >> startButtonLabel [
	^ 'Run Mutation Testing Analysis'
]
