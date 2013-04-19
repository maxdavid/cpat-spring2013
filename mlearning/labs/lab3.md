ML: Lab 3
=========
### Lab 3: Decision Trees

#### The goal of this lab is to understand knowledge representation
using decision trees and compare that to rule sets

_Turn in your lab report to the program fileshare in Workspace. Name your file with last name(s)_

#### Reading: Chapter 3 and P. 446-447

##### Description:
Last week we explored a linear model for classifying irises.
This week, we will look at decision trees and compare them to
rule lists. There are several decision tree algorithms in Weka. You will try at
least one of them and compare the results with the rule classifier algorithms. Your goal will be to understand how to configure and use these algorithms. First, try the two
rule classifier algorithms: ZeroR and OneR. Then try the decision tree algorithm C4.5 (J4.8).
If you have time you can also try the algorithm Decision Table plus Naive Bayes (DTNB), which is a hybrid algorithm. Compare the results from these algorithms. Visualize the decision trees for tree algorithms. You will probably need to read a little about how these algorithms work. Use the iris data set with the four attributes: sepal width, sepal length, petal width, petal length.

##### Tasks:
1. Run ZeroR to get a baseline of performance for classifications that you will run in this lab.See http://www.saedsayad.com/zeror.htm
 * What does ZeroR do? Why does it perform so badly? What is a confusion matrix?

2. Now run OneR
 * What does OneR do (see page 86)? How does it improve on ZeroR? 
 * Before you move on, do you think a more complex algorithm would help our classification?

3. Next run J4.8 (C4.5) and visualize it (right click on it in the results list).
 * How complicated is the tree that is produced? How effective is it?
 * Next run J4.8 and change the confidence to .05
  * What happens to the tree (look at the visualization)? Which tree would you choose? Why?
  * How do the results compare with ZeroR and OneR? C4.5 is based on ID3, which you can read about on pp 197-198, and Wikipedia and other places.

##### Lab report:
Write three paragraphs using your answers to the questions above, write one paragraph describing ZeroR, one on OneR, and one on J4.8.

