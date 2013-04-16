ML: Lecture 4
=============

## Readings for the quiz

* in Witten: Chapters 1 and 2 and section 11.3
* The types of concepts: classification, clustering, associations,
* types of data: nominal, numeric, ordinal
* examples: sister-of, contact lenses, weather, irises, soybean classification, etc
* ethics: why do we need to think about it?

## Additional resources

* *Computer Vision* by Shapiro and Stockman
* *Image processing* by Steve Tanimoto (probably too elementary)

## Attributes and Data

* What kinds of data are there in Weka?
* Why data needs to be cleaned/preprocessed: missing values, inconsistent values
* Summarizing data: mean, standard deviation, min, max, quartiles
* goal: finding a minimum set of attributes that adequately describes the concept.
* What is the syntax for ARFF format?

```
  @relation weather

  @attribute outlook {sunny, overcast, rainy}

  @attribute temperature numeric

  @data
```

* How does ARFF denote string data?
* How does ARFF handle multi-instance data?
* What does the following mean?
```
@attribute bag relational
    @attribute outlook  {sunny, overcast, rainy}
    @attribute temperature numeric
@end bag
@attribute play? {yes, no}
```

* attribute subset selection: finding a minimum set of attributes that adequately describes the concept.

Filtering data

* A filter can be almost any function that transforms the input
* There are different types of filters: supervised and unsupervised, attribute filters, instance filters.

Examples:
```
   AddCluster: adds a new nominal attribute which is an ID of each cluster
   AddNoise: flips some of the values in the input for a nominal attribute 
   NominalToBinary (supervised in the case of numeric values)
   Randomize(unsupervised, instance)
   Resample(unsupervised, instance)
   SpeadSubSample (supervised, instance)
```

