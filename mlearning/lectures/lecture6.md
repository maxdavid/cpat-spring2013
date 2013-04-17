Lecture 6
=========

## Readings

* in Witten: Chapter 3 

## Additional resources

* *Data Mining: Concepts and Techniques* by Jiawei Han, Micheline Kamber, Jian Pei

* Weka Manual. P.34, you can output a jpeg, png or eps file. 

## Filtering data

* A filter can be almost any function that transforms the input
* There are different types of filters: supervised and unsupervised, attribute filters, instance filters
* Examples:
```
  StratifiedRemoveFolds (supervised, instance) -- why is this supervised?
  SpreadSubSample (supervised, instance)
```

## Trees

* What is a regression tree?
* What is the replicated subtree problem? Give an example using a decision tree. 

## Rules

* Rules are generated and tested automatically, so they shouldn’t be too complex.
* e.g. general boolean expressions are hard to deal with.

* On the homework, I had thought that rules couldn’t have else clauses; however,
* in Ch. 3, they use else-if as a way of representing exceptions.

* You can convert from a decision tree to a rule set (homework).
* A rule set must be consistent if more than one rule applies to an instance.
* In a decision list, rules are tested sequentially, i.e. the rules are ordered.
 * In that case, at most one rule can apply. You still need to handle the case where no rules apply

* What is disjunctive normal form (DNF)?
* Review the definitions of coverage and accuracy for association rules. These two numbers are used to prune the number of rules

* Relational rules are often too complex: see blocks example. 

Distance metrics

* Defining the distance between two instances. This is important for clustering and for classification algorithms. There are many possibilities. They share a few basic abstract properties. Not all distance measures are useful for a given task.

  1. distances are ≥ 0
  2. distance is 0 if and only if the two instances are identical
  3. symmetry
  4. triangle inequality: the distance from a to b + distance from b to c ≥ distance from a to c. 
* Show that Hamming distance is a distance.
* there are many measures that satisfy these properties, e.g. Euclidean distance, but this only works for numeric attributes.

* k-nearest neighbors classification uses distance, but you need to choose k.
* Another approach is similarity using correlation. The correlation coefficient is given by

```
<insert equation here>
```

In general, there may be too many attributes. We may need to reduce the number. Principal components is a way to do this. 

