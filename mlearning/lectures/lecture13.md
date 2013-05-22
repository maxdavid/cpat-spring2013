ML: Lecture 13
==============
This week

in Witten: Chapter 6 (more tree depth, clustering) 6.1, 6.4, 6.8
Minimum Description Length

How do you decide if a clustering is good?
You could use test data where the classification is known.
You could choose a representation that uses the minimum number of bits.
The Fourier transform can be thought of as an MDL encoding: you represent a potentially
large sampling of the wave form by a small number of coefficents for sines and cosines.
JPEG and MPEG use the discrete cosine transform in this way for compression. But that
is a special case. In general, you would use information to measure the MDL.
K means clustering

suppose k = 2

    (1, 0), (2, 0), (2.9, 0), (4, 0), (5, 0)
  
probability

Now you try it for two trials (Binomial, n=2)
                                 deviations     squared deviations
      Xi  |  P(x)  | XiP(Xi) |   Xi - μ      |  (Xi - μ)2
      0     0.04
      1     0.32
      2
                  --------
                   μ = 
  
Decision Tree Algorithms (review)

What is the information gain (review): info([4,2],[5,3])
1. 4 log(4) + 2 Log(2) + 5 log(5) + 3 log(3)
2. 6/14 ⋅ info([4,2] + 8/14 ⋅ info([5,3])
3. 4/6 log(4/6) + 2/6 log(2/6) + 5/8 log(5/8) + 3/8 log(3/8)
4. 4/14 log(4/6) + 2/14 log(2/6) + 5/14 log(5/8) + 3/14 log(3/8)
5. 9/14 log(9/14) + 5/14 log(5/14) - 6/14 ⋅ info([4,2] - 8/14 ⋅ info([5,3]))
Decision Trees

How to deal with numeric attributes in a decision tree, assuming that each split is binary.
Missing values are handled by propagating multiple instances to each branch
pruning: subtree replacement, replace a subtree with a leaf node. That would
always decrease accuracy on the training set, but not necessarily on independently
chosen data. This procedure is done recursively up the tree. The decision to replace
or not is based on estimation of error rates = E/N. which is the same as accuracy.
For example {yes, yes, yes, no} if the correct answer is yes, and that is how the node
is classified, then the error rate would be q = 0.25.
Replacements are based on information gain, but use a pessimistic confidence interval for the training data. Let’s go over the calculation
Suppose we choose a confidence limit of 0.20, what is the critical z value from the normal distribution?
How do we convert this z value to a confidence limit (pessimistic confidence estimate)?
We need the mean and standard deviation.
How do we compare this to the option of replacing the subtree? See figure 6.2
subtree raising
from trees to rules: each leaf node generates a rule.
Linear methods

support vector machines
Principle of Least Squares
