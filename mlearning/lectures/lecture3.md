ML: Lecture 3
=============
 **[Read the Blog](http://blogs.evergreen.edu/cpat/stats/)** It has the reading assignments

## Readings for this week and last week

* in Witten: Chapter 2 and section 11.3 for lab
* From last week, the examples were important: weather, contact lenses, irises, labor contracts, soybean classification. What was important for each of them.
* Also, the types of concepts: classification, clustering, associations
* ethics: why do we need to think about it?

Additional resources

* I have moved them to the [docs](http://blogs.evergreen.edu/cpat/additional-resources/)

## Concepts, Instances, Attributes

* a conceptis what the system is learning, e.g. classification, clustering, …
* an instanceis an irreducible collection of data that is input to the learning system, i.e. an example of a concept
* an attribute is a property/component of an instance

## Relations

* What is the difference between a function and a relation? Can a table be both?
 * What is the closed world assumption? What is a predicate?
* The book describes the sister-of relation. What input would you give the learning algorithm to train it?
* Look at Figure 2.1, does the table have enough information to define the relation?
 * What about combined with table 2.4 on P. 45?
* Database relations are optimized for space and time, but not necessarily for learning algorithms.
* Suppose you had two tables (relations in the database sense), how would you combine them?
* What is denormalization? What is a multi-instance problem?
* What do you do when the relation is not finite, e.g. ancestor-of. This needs to be defined recursively.

## Attributes and Data

* What kinds of data are there in Weka?
* What is the difference between string and {yes, no}
* What is another name for categorical?
* Look at P 55 for an example of an ARFF file.
* Why data needs to be cleaned/preprocessed: missing values, inconsistent values
* Summarizing data: mean, standard deviation, min, max, quartiles
* attribute subset selection: finding a minimum set of attributes that adequately describes the concept.

## Functions

* rules, P. 6, there are 24 rows, how many possible functions are there from a set of 24 instances to a set of 3 outcomes?
* In general, the data is noisy
* decision list vs decision tree. P. 13
* generalization

