ML: Homework 2
==============
due Fri April 26

1. Describe the confidence coefficient in decision tree induction and how it affects the depth of the tree. Give a specific example with numbers to illustrate your description.

2. Describe ID3, developed by Ross Quinlan.

3. Visualize the iris data set using Weka. Suppose one applies the k-nearest neighbor algorithm to separate Iris versicolor from Iris virginica using petal width and petal length.

    If a new sample is measured at x = 4.7, y = 1.7, with k set to 5, how would it be classified? What are the approximate coordinates of the 5 nearest neighbors?

4. Given the following rule set with ‘exceptions’, convert it to an equivalent rule set of independent rules with only ‘then’ clauses.
```
If petal length ≥ 2.45 and petal length < 4.45 then Iris versicolor except
If petal width < 1 then Iris setosa.
If petal width ≥ 4.45 then Iris viginica except
If petal width < 1.7 then Iris versicolor
```

5. Given 150 unique instances in the iris data set, use Weka to construct 10 folds.

 a.  How many instances are in each fold?

 b. * How many ways are there to construct 10 folds? Assume that different permutations of the labels of the folds are equivalent.

 c. * Given the large number of ways to do this, why did you get the same folds each time you tried the experiment? What parameter could you change to get a different set of folds? Would the confusion matrix change if you permute the labels of the folds?

 d. * Verify that running the experiment with a different set of folds will give a different confusion matrix. 


