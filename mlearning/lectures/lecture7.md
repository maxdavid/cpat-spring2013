ML: Lecture 7
=============

## This week

* in Witten: Chapter 4 through section 4.5, especially 4.3 and 4.4
* Hw 2 due on Fri in fileshare.
* Read about OneR
* Test in week 5 

## Information theory
* There is a well-defined mathematical concept of information, and it is given by the formula:

```
 info([p1, ... , pn]) = - ∑ pi log(pi)
```
Why is this formula true? Assume base 2 logarithms.

* Consider a ‘channel’ that transmits one bit per second, where the bit is not random but it is 0 50% of the time [and 1 50% of the time] Evaluate the formula. This represents the concept of one bit of information.
 * info([0.5, 0.5]) = ?

* Why is this important? Suppose you have a decision tree which divides up the instances, what is the most efficient way to do it if each node has 2 children i.e. every attribute is binary?
 * *What criteria would you use, in general?* We are assuming for this discussion that attributes are nominal.

*  For two bits, evaluate the formula above.
 * Take an example of an 8-sided die, can you evaluate the formula?

* What is a multinomial? What is its relationship to *bag of words* or multiset? 

## Decision Trees: divide-and-conquer

* How to choose the root of the tree. It is recursive, so if you can answer this question, you can construct the tree.

* Exercise: the weather data on P.10. What decision would you make first, and why?
 * There are four attributes that could be at the root. [see 1-11]

* The information at the beginning is info([9,5])
* What is info([2,3], [4,0], [3,2]), if P([2,3]) = 5/14, P([4,0]) = 4/14,
P([3,2]) = 5/14. 
 * Look at P. 100. [see 1-98]

* We can look at the gain in information, which seems backwards:
 * The resulting state has less information after the decision, which means that applying the decision test gave us information. Note that all of these calculations represent average information in an intuitive sense.

*  Then, construct the next level in the tree.
* What is the multistage decision property?
* What is an ID code?
* Having a leaf node for each instance is not a good solution, so we want to prune the decision tree (actually, inhibit the branching to begin with).

* Gain ratio: information with classes / information ignoring classes.

## Rule Sets: separate and conquer

* coverage vs accuracy: false negatives vs false positives. If the coverage is 80%, what is the false negative rate? If you are a supermarket manager, what does this mean in practice? Note that accuracy is what is meant by confidence in Weka.

* Rules vs Trees: for decision trees, you choose one attribute at a time and make a decision node for that attribute. For decision rules, you choose one class at a time and make a list of rules for that class.

* Choose an attribute-value pair that maximizes the accuracy and then coverage, the probability of the desired classification. PRISM?

* rules vs decision lists: rule sets can be executed in any order, decision lists are ordered 

## Association Rules

* threshold on coverage.
* An item is an attribute-value pair. 
* An item set is a set of items [with no duplicate attributes]. 
* An efficient algorithm starts with 1-item sets, then 2-item sets, etc. 
* Each pass through the large amount of data has a significant time penalty.
 * Ideally, you would only look at each datum once. However, coverage is a global property, so you can’t just process one datum at a time and then never look at it again. 

## Algorithms
* What is the algorithm for OneR? ZeroR? 

## Conditional probabilities and Bayes’ Formula (P.92)
* see Drunkard’s Walk around P 112

Understanding Table 4.2. and the formulae on P. 90, 92, 93 

