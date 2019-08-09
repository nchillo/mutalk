# How To

> How can I run a mutation testing analysis on my packages?

```smalltalk
| analysis result browser |
analysis := MutationTestingAnalysis
    testCasesFrom: 'YOUR_TEST_PACKAGE_NAME' asPackage classes
    mutating: 'YOUR_MODEL_PACKAGE_NAME' asPackage methods
    using: (MutationTestingConfiguration default).
result := analysis run.
```

> How can I run a mutation testing analysis using Classes?


```smalltalk
| analysis result browser |
analysis := MutationTestingAnalysis
    testCasesFrom: { YOUR_TEST_CLASSES }
    mutatingClasses: { MODEL_CLASSES }
    using: (MutationTestingConfiguration default).
result := analysis run.
```


> How can I run a mutation testing and logging info?

You can use the method defaultWithLogging in the MutationTestingConfiguration. That will create a log file in the image folder.

```smalltalk
| analysis result browser |
analysis := MutationTestingAnalysis
    testCasesFrom: { YOUR_TEST_CLASSES }
    mutatingClasses: { MODEL_CLASSES }
    using: (MutationTestingConfiguration defaultWithLogging).
result := analysis run.
```

> My image is freezing when running a mutation testing analysis, what can I do?

You can can Run using log configuration. It will generate a file called MutationTesting.log which lets you know which mutant is causing your image to freeze. You can install the mutation by hand, and then debug running your tests. When you know witch mutant is causing the freeze you can add a pragma like this one:

```smalltalk
handles: aSignal
	<ignoreForMutations: #(#RemoveCaretOperator)>
	^ (self class handles: aSignal) and: [ aSignal tag = tag ]
```

This will exclude the mutation generated from RemoveCaretOperator in method #handles.
