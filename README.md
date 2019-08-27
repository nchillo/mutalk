<p align="center"><img src="assets/logos/111x55.png">
 <h1 align="center">Mutalk - Mutation Testing for Smalltalk</h1>
  <p align="center">
    Mutation Testing Framework for Pharo Smalltalk.
    <br>
    <a href="docs/"><strong>Explore the docs »</strong></a>
    <br>
    <br>
    <a href="https://github.com/nchillo/mutalk/issues/new?labels=Type%3A+Defect">Report a defect</a>
    |
    <a href="https://github.com/nchillo/mutalk/issues/new?labels=Type%3A+Feature">Request feature</a>
  </p>
</p>

[![GitHub release](https://img.shields.io/github/release/nchillo/mutalk.svg)](https://github.com/nchillo/mutalk/releases/latest)
[![Build Status](https://travis-ci.com/nchillo/mutalk.svg?branch=release-candidate)](https://travis-ci.com/nchillo/mutalk)
[![Coverage Status](https://coveralls.io/repos/github/nchillo/mutalk/badge.svg?branch=release-candidate)](https://coveralls.io/github/nchillo/mutalk?branch=release-candidate)

During the 70s, mutation testing emerged as a technique to assess the fault-finding effectiveness of a test suite. It works mutating objects' behavior and looking for tests to “kill” those mutants. The surviving mutants are the starting point to writing better tests. Thus, this technique is an interesting alternative to code coverage regarding test quality.

However, so far it is a “brute force” technique that takes too long to provide useful results. This characteristic has forbidden its widespread and practical use regardless the existence of new techniques, such as schema-based mutation and selective mutation. Additionally, there are no mutation testing tools (to our knowledge) that work on meta-circular and dynamic environments, such as Smalltalk, so compile and link time are the current technique's bottleneck.

This Smalltalk-based tool was developed at the University of Buenos Aires (Argentina) in the context of the final thesis work. The tool uses Smalltalk's dynamic and meta-programming facilities to notably reduce the time to get valuable output and help to understand and implement new tests due to its integration with the rest of the environment.

## License

- The code is licensed under [MIT](LICENSE).
- The documentation is licensed under [CC BY-SA 4.0](http://creativecommons.org/licenses/by-sa/4.0/).

## Quick Start

- Download the latest [Pharo 32](https://get.pharo.org/) or [64 bits VM](https://get.pharo.org/64/).
- Download a ready to use image from the [release page](https://github.com/nchillo/mutalk/releases/latest)
- Explore the [documentation](docs/)

## Installation

To load the project in a Pharo image or declare it as a dependency of your project follow this [instructions](docs/Installation.md).

## Contributing

Check the [Contribution Guidelines](CONTRIBUTING.md)
