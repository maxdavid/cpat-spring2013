ML: Lecture 12
==============

### This week

* in Witten: Chapter 6 (more tree depth, clustering)
* [**Sign up for the Science Carnival**](http://www.evergreen.edu/events/sciencecarnival/) the deadline says May 3, but you can still sign up this week.
* jobs at Res-net for next year

### Matrices

* What is the inverse of

```
  | 1 1|-1
  |-1 1|

  |0.5  -0.5|
  |0.5   0.5|
```

### t-test

* read the pages in Witten on t-test. Suppose you have the following data:

```
                   deviations         squared deviations
      Xi        |  Xi - μ       |     (Xi - μ)2
      0.5
      0.125
     -0.3
      0.25
  ———————————
  μ = 0.525/4
```

### Bernoulli trials

```
                                 deviations       squared deviations
      Xi  |  P(x)  | XiP(Xi) |   Xi - μ      |  (Xi - μ)2
      0     0.2         0
      1     0.8        0.8
                 ———————————
                   μ = 0.8
```

* Now you try it for two trials (Binomial, n=2)

```
                                 deviations       squared deviations
      Xi  |  P(x)  | XiP(Xi) |   Xi - μ      |  (Xi - μ)2
      0     0.04
      1     0.32
      2
                  --------
                   μ = 
```

### K means clustering

```
    (1, 0), (2, 0), (2.9, 0), (4, 0), (5, 0)
```

### Principle of Least Squares

for example, in regression, you have

```
    y⁽¹⁾ = ∑ⱼ (wⱼ⋅xⱼ⁽¹⁾)
    y⁽²⁾ = ∑ⱼ (wⱼ⋅xⱼ⁽²⁾)  etc
    minimize ∑ (y⁽¹⁾ - ∑ⱼ (wⱼ⋅xⱼ⁽¹⁾))²
```

### Decision Tree Algorithms

* What is the information gain (review): ```info([4,2],[5,3])```

```
    1. 4 log(4) + 2 Log(2) + 5 log(5) + 3 log(3)
    2. 6/14 ⋅ info([4,2] + 8/14 ⋅ info([5,3])
    3. 4/6 log(4/6) + 2/6 log(2/6) + 5/8 log(5/8) + 3/8 log(3/8)
    4. 4/14 log(4/6) + 2/14 log(2/6) + 5/14 log(5/8) + 3/14 log(3/8)
    5. 9/14 log(9/14) + 5/14 log(5/14) - (6/14 ⋅ info([4,2] + 8/14 ⋅ info([5,3])))
```

* MDL: minimum description length, section 5.9
* How to deal with numeric attributes in a decision tree, assuming that each split is binary.
* Missing values are handled by propagating multiple instances to each branch
* Pruning is very important: subtree replacement, subtree raising. The decisions on subtree
 * replacement are based on information gain, but use a pessimistic confidence interval for the training data. Let’s go over the calculation (P 198), you need to understand the normal distribution and error rates.

```
  how do you use c = 25%?
  z  = (x - μ) / σ
  z  = (f - q) / sqrt(q⋅(1-q)/N)  
  where f = proportion E/N observed, and q = true value for E/N
  a pessimistic value is going to be f + something positive
```
