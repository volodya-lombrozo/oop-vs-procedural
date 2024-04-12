# Object-Oriented vs. Procedural: A Profiling Insight into Java Method Usage Patterns

In contemporary software development, the extent to which Java applications
utilize object-oriented programming paradigms remains a subject of interest.
Given that some studies highlight the significant overhead of OOP, it is crucial
to examine how modern applications address this issue and determine if they tend
to shift towards procedural approach for enhanced performance. This study
evaluates the runtime behavior of 28 open source Java frameworks, with the help
of [YourKit](https://www.yourkit.com) profiler. We observed a dominant
percentage of instance methods and constructors compared to static methods. That
signifies a developer’s preference for the object-oriented approach much more
frequently than the procedural approach, despite its associated drawbacks.

## Citation

If you use this software in your research, please cite it using the following
BibTeX entry:

```bibtex
@article{zakharov-bugayenko-oop-vs-procedural-2024,
    title = {Object-Oriented vs. Procedural: A Profiling Insight into Java Method Usage Patterns},
    author = {Vladimir Zakharov and Yegor Bugayenko},
    journal = {todo: Journal Name},
    year = {2024},
    publisher = {todo: Publisher},
    doi = {todo: DOI if available},
}
```

## Structure of the Repository

This mono-repository contains the following modules:

- [cost-of-oop](cost-of-oop/README.md) - the main module with the profiling
  results of 28 Java frameworks. This module contains all scripts used for
  profiling each program. This includes the program startup procedures, the
  initialization of the profiler, result exports, and testing scripts such as
  those for Apache JMeter projects.
- [oop-statistics-filter](oop-statistics-filter/README.md) - the module that
  holds the code that aggregates the profiling results received in the
  [cost-of-oop](cost-of-oop/README.md) module. This module creates final CSV
  files that might be used for further analysis.
