ML: Lecture 15
==============

### This week

* in Witten: Chapter 6 (linear methods, instance-based methods, clustering) 6.2, 6.4, 6.5, 6.8
* If there is a strike, we will meet on Red Square
* lecture on Thursday: quiz, lecture on stats and ML, and lab on induction.
* no class on Monday. 

### Probability

* Now you try it for two trials (Binomial, n=2)

```
                              deviations     squared deviations
    Xᵢ  |  P(x)  | XᵢP(Xᵢ) |   Xᵢ - μ      |  (Xᵢ - μ)²
    0      0.04    0          -1.6
    1      0.32     .32       -0.6
    2      0.64    1.28        0.4
                 ——————————
                  μ = 1.6
```

### Perceptron

* AND, OR, XOR
* bias vs threshold: you have to change the sign.
* sigmoid function vs threshold (step function)

* multilayer: back propagation and gradient descent 

### Radial Basis Functions

* radial basis functions are multidimensional Gaussian distributions:
* ```(1/σsqrt(2π)) * e⁻¹/² *⁽⁽ˣ ⁻ μ⁾/ᵟ⁾²```
* you can use them for clustering
* you can use them for networks: take the outputs of the hidden units as RBFs, add them up and run them through a sigmoid function. 

### Instance-based methods

* k nearest neigbors, k means clustering
* What are the problems — slow (answer is kD trees), noisy data (answer is pruning), may include irrelevant attributes (answer may be change distance formula), doesn’t do explicit gneralization.
* Pruning noisy exemplars based on whether they predict correct classification of their neighbors. Use confidence intervals: this is a binomial distribution problem. Asymmetric loss function: it is better to drop an instance that performs marginally than accept one that introduces errors. Default success rate = probability of correctly classifying an instance without looking at its neighbors.

* reducing irrelevant attributes (weighting them less):

```
sqrt(w₁²(x₁ - y₁)² + ... + wₘ²(xₘ - yₘ)²)
```

* Generalization. An instance is generalized by replacing it with a rectangle (hyperrectangle). The computational problem is to generalize the distance function to rectangles. 

### Clustering

* split-merge, both can be important
* single-linkage min distance
* complete-linkage, max distance
* centroid-linkage, represent cluster by centroid
* average-linkage, ave distance
* hierarchical clustering, tree-based, splitting and merging nodes
* category utility – P 284 formula based on probabilities 

### The EM algorithm

* Suppose you have a mixture of 2 populations with different means and standard deviations, i.e. there are 5 parameters you need to estimate.

* Next, given an instance, you need to compute the (Bayesian) probability that it is in each cluster.
* For k-means, you put an instance in the closest cluster measured by centroid. For EM, you compute the probability for it being in each cluster based on centroid and covariance. Then, in the second step, you recompute the centroid and covariance. Note the centroid is the mean of the Gaussian distribution. 

### Normal Distributions

* Suppose a saw mill is cutting boards and boards less than 0.75in in width must be discarded. Suppose they have no control over standard deviation, which is 0.02in, and they calibrate the saw so that on average the thickness is 0.79in. What fraction of the boards will be discarded? If the boards are too thick, they can be planed, which is extra work, but they can still be sold.
* Occasionally, the saw loses its calibration. Suppose they want to set up a statistical test, so that if the average width drops below 0.77in, they will stop the operation and re-calibrate. What are the consequences of type I and type II errors?
* What is the standard error, if they choose a sample of 4 boards and test the average width?
* What is the standard error, if they choose a sample of 25?
* Suppose the cost of a type I error is twice that of a type II error, and they choose N = 4, what critical value should they choose and what are the values for α (type I) and β (type II)? 
