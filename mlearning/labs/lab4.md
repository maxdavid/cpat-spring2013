ML: Lab 4
=========

### Decision Trees vs Rule Sets

**This will be a workshop rather than the usual lab.**
**The goal of this lab is to understand induction of decision trees and rule sets.**
Turn in your lab report to the program fileshare
in Workspace. Name your file with last name(s)

Reading: Sections 4.3 and 4.4


## Answer the following questions:

### Decision Trees

1. We saw in class that choosing the root of a decision tree involves computing the
information of a set. The first part of this workshop is using the formula.
You may use a calculator or write a program in the language of your choice.
I wrote a program info.py and put it in the Handouts/data mining folder.

Referring to the weather data set in Table 1.2 on P.10,
 a. What is the information in the original data set with respect to play/no play, i.e.
the set containing 9 yes’s and 5 no’s? Show your work. Give the general formula, the formula with numbers substituted, and the numeric value.

 b. What is the average information after dividing that set into three subsets: ```{yes, yes, no, no, no}, {yes, yes, yes, yes}, {yes, yes, yes, no, no}```? Show your work. Give the general formula, the formula with numbers substituted, and the numeric value.

 c. Compute the information gain and gain ratio.

 d. Compute the gain and gain ratio for humidity.

2. Apply the same approach to the contact lens problem, but now there are three
categories. There are four attributes that could be the root of the decision
tree. Compute the gain ratio for each of them and rank the results.

### Rules: separate and conquer

3. Referring to the contact lens data set in Table 1.1 on P.6, follow the PRISM method for generating perfect rules, derive a set of rules for predicting when the recommended lenses will be soft.

 a. For maximizing the probability of the desired classification, i.e. accuracy. Compute the accuracies as shown on P.110 for all items (attribute-value pairs), but do it for soft lenses.

 b. Perform the algorithm until you have a perfect rule with the most coverage.

 c. What is the coverage of this rule?

 d. (optional) Find another perfect rule to cover the remaining cases.

### Bayesian Probability

4. Given someone in a low-risk population who has a positive test result for HIV, we will compute the likelihood that the person really has HIV. Suppose that the false positive rate for the test is 1 in 1,000, the false negative rate is essentially 0, and the prior probability of having HIV is 1 in 10,000.
Let Pos = positive test result, H = has HIV.

 a. What is P(H)?

 b. What is P(Pos | H)?

 c. What is the likelihood P(H | Pos)?

 d. Suppose there is an expensive test that could be performed which has a much lower false positive rate. Explain how a low-cost screening test could be used effectively to reduce cost in an ethical way.


