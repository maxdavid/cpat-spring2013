ML: Lecture 9
## This week

* in Witten: Finish Chapter 4, start Chapter 5
* Test tomorrow.
* Hw 3 will be due in Week 6 and will be based on Lab 4
* **Sign up for the Science Carnival**

## Training and Testing

* It is important to test an algorithm on different data from the training data.
* cross-validation: divide the data into n disjoint sets, train the data on one subset and test it on the others. It is generally better to train on more data. For 10 folds, train on 9/10 of the data and test it on 1/10. Repeat this 10 times, and then repeat that 10 times with different folds.
* General rules: stratification generally improves the results, 10 folds is often good.
* Bootstrap is resampling with replacement: given n instances, choose a random subsample with n instances. Get about 63% of the set, use the other 37% for testing.
Leave one out is similar.
* Sometimes there are three data sets: training, validation, testing

## Comparing Data Mining Schemes

* How would you test if two different algorithms produce significantly different results?
* What is a paired t-test and what is the difference between that and a standard t-test?
```
       davg
  t =  --------
       √σ2 / n
```

## Some Linear Algebra

* A matrix has two applications in this context: linear functions and linear equations
```
   2x + y = 1
   3x + 2y = 5

   f(x, y) = (2x + y, 3x + 2y)
```  

* What does it mean to solve the equation above?
```
    f(x, y) = (1, 5)
    (x, y) = f-1(1, 5)
```  

* We have practiced multiplying matrices — what is the rule?
* What is the inverse of a matrix?
