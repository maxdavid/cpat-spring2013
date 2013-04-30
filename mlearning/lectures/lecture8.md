ML: Lecture 8
=============
## This week:

* in Witten: Finish Chapter 4, start Chapter 5
* Test on Thursday
* Hw 3 will be due in Week 6 and will be based on Lab 4
* Sign up for the Science Carnival


* Was Lab 4 too tedious?
* What is upper division credit?

You do need to turn in all hw and labs; however, you don't have to complete everything on all of them.  Some weeks you may have too much to do.  Or each week you focus on a different aspect.  However, for ML upper division work you should do a very good job on some of the homework or labs to demonstrate your level of understanding, e.g. doing some optional parts.  Also, your project is important for 
upper division credit.  

Spend a reasonable amount of time on each lab or homework -- not too little and not too much.

## Bayesian Probability

* The basic formula P(A | B) * P(B) = P(A ∩ B)

```
               P(A | B) * P(B)
P(B | A) =  ————————————————————
                    P(A)
```
* The other piece is P(A) = P(A ∩ B) + P(A – B)
* Lastly, assuming independence, if A = A1∩…∩An, then we have

```
P(A | B) = P(A1∩...∩An | B) = 
P(A1 | B) *... * P( An | B)
```
* The Laplace estimator for dealing with very low probabilities.

## Linear Models
* Remember the exercise to find a line that separates one species of iris from another? That is a particular approach to linear modeling:

```
 ∑ wi⋅ai 
    w0 + w1⋅a1 + ... +wk⋅ak
```

A decision is made based on whether this expression is positive or negative. (linear separation)

* We can also formulate the problem as approximating the function, which is 0 or 1
```
xi =  w0 + w1⋅a1i + ... +wk⋅aki 
```

* What is multi-response linear regression?
* logistic regression
* Perceptron model and learning rule.
* Winnow rule.

## Instance-based models

The basic idea is to use the instances themselves as the model for a class or cluster. This leads to ideas like k-nearest neighbors and k-means.

* We need a distance function, e.g. Euclidean distance
* In order to make this efficient, we can turn to data structures for some ideas:
    k-D trees and Ball trees.


* Practice the algorithm for constructing a 2-D tree. Can you state it?
* Some optimizations.
 * Which axis to pick, which point to pick? Do you use median or mean? Why?


* How do you access a Ball Tree? How do you construct one?

## Review

### Decision Trees: divide-and-conquer
* How do you apply the formula to the following set of sets:
```
{yes, yes, yes, no, no}, {yes, yes}, {yes, no, no, no}
```
* Gain ratio: information with classes / information ignoring classes.

### Rule Sets: separate and conquer
* coverage vs accuracy: false negatives vs false positives. If the coverage is 80%, what is the false negative rate? If you are a supermarket manager, what does this mean in practice? Note that accuracy is what is meant by confidence in Weka.

* What is the relationship between information and accuracy and coverage?

* Rules vs Trees: for decision trees, you choose one attribute at a time and make a decision node for that attribute. For decision rules, you choose one class at a time and make a list of rules for that class.

* Choose an attribute-value pair that maximizes the accuracy and then coverage, the probability of the desired classification. PRISM?

* rules vs decision lists: rule sets can be executed in any order, decision lists are ordered

### Association Rules
* threshold on coverage.
* An item is an attribute-value pair.
* An item set is a set of items [with no duplicate attributes].
* An efficient algorithm starts with 1-item sets, then 2-item sets, etc.
* Each pass through the large amount of data has a significant time penalty.
* Ideally, you would only look at each datum once. However, coverage is a global property, so you can’t just process one datum at a time and then never look at it again.

