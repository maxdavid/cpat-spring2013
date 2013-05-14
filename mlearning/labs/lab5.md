ML: Lab 5
=========
### Lab5: Comparing Classification Algorithms

* Reading: Witten 5.2, 5.5

#### Questions:

1. A paired t-test can be used for comparing two algorithms on the same data folds. The number of folds is often chosen to be 10. For pedagogical reasons, let’s choose the number of trials to be 12 so that it is distinct from the number of folds.
 a. What did you choose for your p-value?
 b. What is the appropriate number of degrees of freedom for the t-distribution?
 c. What is the corresponding critical value for the t-test?
 d. What is the null hypothesis? What is the alternative hypothesis? Is it two-sided or not? Why?
 e. Write the formula for test statistic from the fraction of mismatches for each algorithm and each trial
 f. Use the bank data in Handouts/data mining/bank_data.csv. Convert it to arff format.
 g. Compute the t-statistic using JMP, Excel, or Python. Explain which procedure you used. Report your value and compare it to the critical value. Also report the average difference and standard deviation of 2. the differences.
Using Weka Experimenter, perform the paired t-test on the two algorithms with 12 repetitions.
 * Compare your results with those from the manual experiment. Explain your results.
3. Submit your report in Workspace/_dataMiningLabReports/Lab5
