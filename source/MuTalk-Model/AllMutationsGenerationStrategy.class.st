Class {
	#name : #AllMutationsGenerationStrategy,
	#superclass : #MutationsGenerationStrategy,
	#category : #'MuTalk-Model-Strategies'
}

{ #category : #generating }
AllMutationsGenerationStrategy >> classesAndMetaclassesFrom: modelClasses [

	^ modelClasses
		inject: OrderedCollection new
		into: [ :classes :aClass | 
			classes
				add: aClass;
				add: aClass class.
			classes
			]
]

{ #category : #generating }
AllMutationsGenerationStrategy >> methodsToMutateFrom: aCoverageResult [

	^ ( self classesAndMetaclassesFrom: aCoverageResult modelClasses )
		inject: OrderedCollection new
		into: [ :methods :aClass | 
			methods addAll: aClass localMethods.
			methods
			]
]
