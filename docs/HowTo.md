# How To

> How can I run a mutation testing analysis on my packages?

```smalltalk
| analysis result browser |
analysis := MutationTestingAnalysis
    testCasesFrom: 'YOUR_TEST_PACKAGE_NAME' asPackage classes
    mutating: 'YOUR_MODEL_PACKAGE_NAME' asPackage classes
    using: (MutationTestingConfiguration default).
result := analysis run.
```

