Class {
	#name : #DTMutalkResult,
	#superclass : #DTPluginResult,
	#instVars : [
		'testsResult'
	],
	#category : #'DrTests-Mutalk'
}

{ #category : #accessing }
DTMutalkResult >> buildTreeForUI [
  <dTMutalkResultTreeNamed: 'Mutation Results'>
  ^DTTreeNode new subResults: {(DTTreeNode new
           name: self testResults printString;
           subResults: {};
           yourself) . 
        (DTTreeNode new
           name: 'Alive Mutants';
           subResults: (self testResults aliveMutants collect: [:result |  DTTestLeaf content: result ]);
           yourself) . 
        (DTTreeNode new
           name: 'Killed Mutants';
           subResults: (self testResults killedMutants collect: [:result |  DTTestLeaf content: result ]);
           yourself) . 
        (DTTreeNode new
           name: 'Terminated Mutants';
           subResults: (self testResults terminatedMutants collect: [:result |  DTTestLeaf content: result ]);
           yourself)}
]

{ #category : #accessing }
DTMutalkResult >> summarizeInfo [
  "Text showed in miniDrTests with info of the result "
  ^String streamContents: [:s |  s print: self testResults printString ]
]

{ #category : #accessing }
DTMutalkResult >> testResults [
	^ testsResult
]

{ #category : #accessing }
DTMutalkResult >> testResults: anObject [
	testsResult := anObject
]
