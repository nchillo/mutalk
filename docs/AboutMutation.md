
# MuTalk (µ-talk)

Mutation Testing in Smalltalk

This project was originally developed at the University of Buenos Aires (Argentina) by Nicolás Chillo, Gabriel Brunstein and others. It was created in times of Pharo 1.1 and the last versions on which MuTalk can run is Pharo 1.3. This is resurection of this project.

## Usefull Links

Original repository: http://www.squeaksource.com/MutationTesting

ESUG presentation: https://www.slideshare.net/esug/mutation-testing

Original Tesis [Tesis](informe.pdf)

> Following text is copy from https://code.google.com/archive/p/mutalk/

## Mutation testing

During the 70s, mutation testing emerged as a technique to assess the fault-finding effectiveness of a test suite. It works mutating objects' behavior and looking for tests to “kill” those mutants. The surviving mutants are the starting point to writing better tests. Thus, this technique is an interesting alternative to code coverage regarding test quality.

However, so far it is a “brute force” technique that takes too long to provide useful results. This characteristic has forbidden its widespread and practical use regardless the existence of new techniques, such as schema-based mutation and selective mutation. Additionally, there are no mutation testing tools (to our knowledge) that work on meta-circular and dynamic environments, such as Smalltalk, so compile and link time are the current technique's bottleneck.

This Smalltalk-based tool was developed at the University of Buenos Aires (Argentina) in the context of the final thesis work. The tool uses Smalltalk's dynamic and meta-programming facilities to notably reduce the time to get valuable output and help to understand and implement new tests due to its integration with the rest of the environment.

## Mutations Strategies

* Mutate All, Run All: it means mutating all your code and then running all tests.
* Mutate All, run Covering: it means mutating all your code but, for each mutated method, running tests that cover it. The result should be, in general, the same than running Mutate All, Run All, but taking less time.
* Mutate Covered, Run All: it means mutating only code covered by tests and then running all tests.
* Mutate Covered, Run Covering: it means mutating covered code and, for each mutated method, running tests that cover it. The result must be, in general, the same than running Mutate Covered, run All, but taking less time.

## FAQ

See [How To](HowTo.md) for some examples.

> Does Mutation Testing replace coverage analysis?

No, it doesn't. It complements coverage. You could have perfect coverage but not so good Mutation Score. That means your tests can be better!

