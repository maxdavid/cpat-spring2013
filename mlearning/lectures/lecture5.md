Lecture 5
=========
## Readings

* in Witten: Chapter 3
* Extra: linear algebra

## Additional resources

* Data Mining: Concepts and Techniques by Jiawei Han, Micheline Kamber. Jian Pei
* Weka Manual. P.34, you can output a jpeg, png or eps file.
 
## Knowledge Representation

* How does a computer program represent knowledge?
 * There are two types of representations: declarative and procedural. A set of rules is an example of declarative.
* Can a program create a new concept or can it only represent concepts that you have programmed or presented as data?
* What is a linear model? Need numeric data. Look at P. 63
* there is a straight line that separates Iris setosa and versicolor. One such line is represented by a linear equation:

```
2 - 0.5*Petal_Length - 0.8*Petal_Width = 0
```

There are many possible lines.
On one side of the line ```2 – 0.5 * Petal_Length – 0.8 * Petal_Width > 0```,
on the other side ```< 0```
What happens if you only use one attribute or the wrong two attributes?

* What is a decision tree? There are internal nodes and leaf nodes.
* Decision trees: given 2 attributes, outlook {sunny, overcast, rainy} and windy {yes, no}, how many decision trees can you make?

* Binary search tree -> k-D trees. This extends to decision trees
```
suppose you want to be able to search based on either of two keys
K¹ and K².  The branching at even levels could
be done with K¹ and odd levels with K²
```
* Ball trees (Chapter 4)

## More Advanced Concepts

* Defining the distance between two instances. 
 * This is important for clustering and for classification algorithms.
 * There are many possibilities. They are based on a few basic abstract properties:
  1. distances are ≥ 0
  2. distance is 0 if and only if the two instances are identical
  3. symmetry
  4. triangle inequality: the distance from a to b + distance from b to c ≤ distance from a to c.
* there are many measures that satisfy these properties, e.g. Euclidean distance, but this only works for numeric attributes.
* Distance works for boolean attributes: the proportion of attributes that are the same.
* Another approach is similarity using correlation. The correlation coefficient is given by:

```
 ∑  (X - Xbar) * (Y - Ybar) 
————————————————————————————
       sd(X) * sd(Y)
```

In general, there may be too many attributes. We may need to reduce the
number. Principal components is a way to do this.

## Filtering data

* A filter can be almost any function that transforms the input
* There are different types of filters: supervised and unsupervised, attribute filters, instance filters.

## Examples:
```
StratifiedRemoveFolds (supervised, instance) -- why is this supervised?
SpreadSubSample (supervised, instance)
```

