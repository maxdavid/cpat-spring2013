ML: Lecture 11
==============

### This week

* in Witten: Chapter 5
* Hw 3 is due on Friday
* [Sign up for the Science Carnival](http://www.evergreen.edu/events/sciencecarnival/) the deadline says May 3, but you can still sign up this week.
* Next week we will be discussing clustering (6.8) and regression
* In week 9, we will have a lab on induction and loop invariants 

### t-test

* read the pages in Witten on t-test and paired t-test. We will do that in lab on Thursday. We will compare two learning algorithms. 

### Cost analysis

* There are two concepts you should know about: ROC and recall-precision curve. For next week, read about them in Chapter 5 and we will discuss them in class. They both have to do with the tradeoff between FP and FN.
* For cost-benefit analysis, you need a table of costs for TP, TN, FP, FN.
```
true positive rate = 
false positive rate =
rate of success = TP + TN / TP + TN + FP + FN
```

* You have already seen the confusion matrix in Weka
* Kappa (Κ) corrects for the rate of success due to random chance. 

### Some Linear Algebra

* A matrix has two applications in this context: linear functions and linear equations

```
2x + y = 1
3x + 2y = 5

f(x, y) = (2x + y, 3x + 2y)
```

* What does it mean to solve the equation above?
* Only square matrices have inverses. The most common case is an overconstrained system:
* more equations than unknowns. Each equation comes from a data instance.

* The pseudo-inverse satisfies a least squares property — it minimizes the sum of squares of the errors.

* We have practiced multiplying matrices — what is the rule? Square the following matrix:

```
|0 1|
|1 0|
```

* What is the determinant of a matrix? What is it good for?
* find the determinants of the following matrices:

```
|0 1|    | 1 1|    |1 1|
|1 0|    |-1 1|    |1 1|
```
* What is the inverse of a matrix?

```
| 1 1|-1   =
|-1 1|
```
