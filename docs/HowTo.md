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
