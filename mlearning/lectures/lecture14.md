ML: Lecture 14
This week

in Witten: Chapter 6 (linear methods, instance-based methods, clustering) 6.2, 6.4, 6.5, 6.8
If there is a strike, we will meet on Red Square
Thursday, quiz, lecture on stats and ML, followed by induction lab.
probability

Now you try it for two trials (Binomial, n=2)
                                 deviations       squared deviations
      Xi  |  P(x)  | XiP(Xi) |   Xi - μ      |  (Xi - μ)2
      0     0.04
      1     0.32
      2
                  --------
                   μ = 
  
Classification Rules

You can generate rules from decision trees, but you may get too many.
Prune the decision tree first, or successively generate deeper partial trees, generate rules at each step.
You should use independent subsets for pruning the tree.
It is not easy to measure how good an individual rule is, because it interacts with other rules.
Linear methods

You have seen with the Iris data that in some cases it is possible to separate the instances of different classes by a line or hyperplane. If that is not possible, it still may be possible using a curve or curved surface. This can be done by transforming the data using a non-linear mapping. Often, this adds to the dimensionality of the data with synthetic attributes
examples
           x         x

                o
 
           x         x
               (a)

           x         o

           o         x
               (b)
  
For example (a), we can add a feature a3 = a12 + a22, then we can separate the sets
by a horizontal plane.

Here is an example of a transformed hyperplane:
  x = w1a13 + w2a12a2 + w3a1a22 + w4a23 
  
support vector machines: if two sets are linearly separable by a hyperplane, then we should be able to choose a hyperplane that
maximizes the minimum distance to each of the sets. This is also called the maximum margin hyperplane.
The points (vectors) that are closest to this hyperplane are called support vectors. See P 225.
Computing the SVM from the training data is slow.
Instead of transforming the attribute space, on could often just transform the condition (distance function).
This is called the ‘kernel trick’. One can operate on each point with a kernel function, e.g. a polynomial, or
one can construct a product function that computes the same thing. In the previous example,
K(x,y) = (x, y, x2 + y2)
Sigmoid function: 1/(1 + e-x)
Multilayer perceptron, feedforward neural network.
backpropagation, learning rate. For each misclassified instance, adjust the weights [for the hyperplane] to make it a little closer. In Chapter 4 (P 128) it was based on the learning rate α and the following formula, i.e. add or subtract
wi += α ⋅ ai2 or wi -= α ⋅ ai2
   
However, the actual formula used is more complicated because of the sigmoid function

gradient descent and stochastic gradient descent,
