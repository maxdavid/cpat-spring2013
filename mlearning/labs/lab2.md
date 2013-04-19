ML Lab 2
========
### Filtering and Exploring Data

#### The goal of this lab is to understand filtering and classification using Weka.

_Turn in your lab report to the program fileshare:  In Workspace, you will see a folder for Machine Learning, Lab 2.  Your report should be in a file named with the LASTNAMES of those doing the lab!_

#### Reading: P. 63 in Witten

##### Description:
The goal is to find lines in a scatter plot that separate each class
from the others. As illustrated on P. 63, it is possible to find a line
that approximately separates the two classes in the scatter plot: iris setosa from iris versicolor.

You will explore the classification of irises using the four attributes:
sepal width, sepal length, petal width, petal length. Since you will do this
visually, the first step is to look at pairs of attributes to see which pair
has the most information for distinguishing iris virginica from iris versicolor.
One way to do this is with scatter plots. If you click on visualize, you will see
a collection of panels with scatter plots. After you choose the attributes, you can
filter the data into two folds: one for training and one for testing. Try to draw the best line
that separates the two classes iris virginica and iris versicolor. You will create
this line manually from the training data and then apply it to the test
data. Report the number of misclassified instances.

##### Tasks: [In groups of two or three]
Load the iris.arff file into Weka.
Click on the visualize tab. Explore the scatter plots
After loading the data, use the filter StratifiedRemoveFolds filter and make 2 folds.
Click apply, then save the file as set 1,
Click undo and change the parameter (in the object editor) named invertSelection from false to true.
Then click apply and save that as set 2.
Using your chosen pair of attributes, view the scatter plot for set 1, and write down the equation of the straight line that best separates the two species.
Bring up set 2 and apply the same equation to separate the two species and record the number of misclassified instances.
Extra: try some of the built-in classifiers

##### Assessment:
**Turn in with all of the names of your team members:**
A 3-paragraph report on 1) Describe how the steps of the procedure in this lab might relate to the
general steps of classification, e.g. filtering on attributes, filtering on instances.
2) Explain how you used Weka to analyze it, and
3) Which attributes did you use to separate the two
species and what is the theoretical limit [given the two folds you produced]
to how well you could do with a linear separator?,
In addition, answer the following 2 questions:
4) What difficulties did you have?
5) What questions do you have related to the lab?
What questions do you have about this week’s reading?

