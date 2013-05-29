ML: Lab 7
=========

## Induction and proving programs correct.

#### Learning Objectives
1. Explain how to apply induction to proving programs correct in the case of loops.
2. Apply loop invariants to designing correct algorithms

#### Learning Outcomes
1. Students will be able to analyze a loop and create loop invariants
2. Using induction, students will be able to prove that a final condition is satisfied when a loop terminates.
3. Students will be able to code a loop based on a loop invariant.

#### Problem P:
Two brothers are stuck. They are out of gas, they are at the bottom of a 50 foot hill, and the next gas station is on the other side. If they push the car to the top of the hill, they can coast to the gas station. Tom pushes the car 3 feet, takes a puff on his cigar and the car rolls back two feet. How many times does he puff on his cigar before getting to the top of the hill? Note that as soon as the car gets to the top of the hill, it will not roll back. There are two operations that change the state of the car: push() and roll(). Smoking does not change the state of the car, but it does change the state of nPuffs.
Let the state of the car be the distance up the hill, from 0 to 52. Write a loop to compute the answer to the question, using variables nPuffs and carState.

#### Background on induction.
Proof by induction has two steps: basis step and inductive step.
Induction is very useful for proving some important mathematical formulae such as

```
1 + 2 + … + n = n(n+1)/2 or
1 + r + … + rn = (1-rn+1) / (1 – r)
```

However, it can also be very useful for reasoning about programs and proving them correct. First, we review the principle of induction. The way to look at induction is in terms of properties of the natural numbers.
**Induction Property of the Natural Numbers:** If a subset S of the natural numbers contains 1 and satisfies the property: if x is in S then x+1 is in S, then S must be equal to the natural numbers.

First, a note about proving programs correct. there are three different pairs of terms that are used interchangeably:

* ```pre-condition, post-condition```
* ```requires, ensures```
* ```assumed true, confirmed true```

Proving programs correct is all about applying logic, given that certain conditions are true at the beginning of the program or program fragment, then certain conditions will be true at the end.

This can be applied to loops to show that a property is true for a loop no matter how many times it is executed, i.e. it is executed n times where n is a natural number. Such a property can be called a loop invariant. An invariant P for a block of code has the property: if P is true before the block of code is executed, then it is true afterward, as well. Here is an example

```
int sum(int j, int k) { //compute the sum of j and k
  // requires j >= 0
  // ensures result = j + k
  {
  if (j == 0) {
    return k;
    // Assume: (j = 0) ^ (result = k)
    // Confirm ensures: result = k
  } 
  else {
    j–;
    r = sum(j, k);
    return r + 1;
    // assume r = (j – 1) + k
    // confirm r + 1 = j + k
  }
}
```

The then-clause proves the base case, i.e. ```j = 0```. Similarly, the else-clause proves the inductive step.

Same idea with a loop:

```
// #j, #j are the values before the loop executes
int sum( int i, int j)
precondition: j >= 0, j + k = #j + #k, #j + #k <= MaxInt
while (j > 0) {
  k = k + 1;
  j = j – 1;
}
postcondition: j = 0, j + k = #j + #k,

// requires j >= 0
sum = k; N = j;
for (i=0; i0, k < MaxInt k = k+1 1 k = #k + 1 j > MinInt) {
  j = j-1
  2 j = #j – 1 j + k = #j + #k, j >=0
}
```

This is the reasoning table for the example above: (also need to prove termination). The number of rows is the number of lines of code plus the number of states. We can do this with 5 rows, as shown below. The first thing is to fill in the Assumed true condition for state 0 and the confirmed true condition for state 2. Then, fill in the pre- and post-conditions for each code statement. We use #j and #k to indicate the old values for these variables.

```
State     Code       Assume         Confirmed
  0                  j>0,           k < MaxInt
          k = k+1
  1                  k = #k + 1     j > MinInt
          j = j-1
  2                  j = #j - 1     j + k = #j + #k, j >=0
```

What we see is that since ```j >= 0``` implies that ```j > MinInt```, the latter condition will always be satisfied. We can also see that ```k >= MinInt```. We have no way to assert ```k < MaxInt```; however, we know that ```#j + #k ≤ MaxInt``` and ```j ≥ 0```. Thus, we need ```j+k ≤ MaxInt``` at every iteration.

### Exercise:
* Create a reasoning table for the problem:

```
while (s < 50)

PushCar()
requires: s < 50
ensures: s = #s + 3

Puff()
precondition: s < 50
postcondition: nPuffs = #nPuffs + 1

RollBack()
precondition: s < 50
postcondition: s = #s – 2

if (s < 50) then nPuffs++
```

### Homework:
* Note that the following loop does not work:

```
while (s<50)
Push()
Puff()
Roll()
```

### Conclusion:
* Applying induction to finish the proof, including termination.
