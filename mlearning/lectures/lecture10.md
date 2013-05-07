ML: Lecture 10
==============
## This week

* in Witten: Chapter 5
* Hw 3 is due on Friday
* [**Sign up for the Science Carnival**](http://www.evergreen.edu/events/sciencecarnival/) the deadline says May 3, but you can still sign up this week.

## t-test

* For a t-test, compute sample average and sample standard deviation. But first, you should understand a normal distribution. [table](http://www.math.unb.ca/~knight/utility/NormTble.htm)

* Do you know how to find the probability/test an hypothesis for a normal distribution? The formulae are

```
z = (x - μ) / σ
Z = (Xtotal - n⋅μ) / σ⋅sqrt(n)
```
    what does the Central Limit Theorem really say?

* compute sample average. Population standard deviation must be known — either it is a binomial distribution or you have a large sample from a control group, etc
* How to find the critical value for a given p-value.

## Training and Testing

* It is important to test an algorithm on different data from the training data.
* Leave one out: how many test runs?
* Sometimes there are three data sets: training, validation, testing (comparison with other algorithms)
* What is a paired t-test and what is the difference between that and a standard t-test?

```
            davg
  t =  ——————————————
        sqrt(σ2 / n)
```
 
## Cost analysis

* predicting probabilities: e.g. in a decision tree, you could predict the probabilities rather than a single classification. There are two ways to measure the cost of the loss function:
```
∑(pⱼ - aⱼ)²
-∑aⱼ log₂(pⱼ)
```
    They have slightly different behavior: especially when observed pj is 0

* But the cost or loss function may involve other issues. The function may not be symmetric: true positive (TP), FP, TN, FN may all have different losses/costs associated with them.
```
    true positive rate = 
    false positive rate =
    rate of success = TP + TN / TP + TN + FP + FN
```
  
* You have already seen the confusion matrix in Weka
* Kappa (κ) corrects for the rate of success due to random chance.
* You can take into account the loss function both in training and in testing

## Some Linear Algebra

* A matrix has two applications in this context: linear functions and linear equations
```
   2x + y = 1
   3x + 2y = 5

   f(x, y) = (2x + y, 3x + 2y)
```

* What does it mean to solve the equation above?
* Only square matrices have inverses. The most common case of a non-square matrix is an overconstrained system: more equations than unknowns. Each equation comes from a data instance, so you generally will have more data than attributes.
* The pseudo-inverse satisfies a least squares property — it minimizes the sum of squares of the errors.
* We have practiced multiplying matrices — what is the rule?
```
  |0 1| . |0 1|   =
  |1 0|   |1 0|  
```

* What is the determinant of a matrix?
* What is the inverse of a matrix?
```
  | 1 1|⁻¹
  |-1 1|
```
