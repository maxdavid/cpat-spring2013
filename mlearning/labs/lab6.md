ML: Lab 6
=========

## Kmeans Clustering Lab

First a note about the data. We’ll be using the iris data from Weka’s data files which I’ve already converted to a csv. The data is all numeric, with the exception being the class label which is found in the last column. You should look at the data, but you don’t have to worry about parsing it into Java. ```ParseCSV``` does that for you.

The purpose of this lab is to understand a Kmeans clustering algorithm which will operate on numeric data. You will gain a better understanding and be able to describe it in detail by implementing some of the methods in Java. You can find the code in the fileshare with some of the methods removed. The methods you need to write are:

```
private double distance(VectorInstance, VectorInstance)
private void assignToClusters()
private void updateCentroid()
private boolean centroidsHave Moved()
private static void createNormalizedList(ArrayList<NamedVectorInstance>)
```

A Kmeans clustering algorithm divides a set of instances into a number of clusters (this number is called k). A cluster has two components. These are a centroid (the average value of the instances in the cluster) as well as a list of the instances assigned to the cluster. In this case we’ll create the initial clusters nondeterministically by selecting them at random from our global set of instances.

Once the algorithm has a set of k clusters, it then assigns each instance from the global set of instances to the closest of the k clusters.

The remainder of the algorithm involves updating the centroids and again reassigning the instances to to the closest cluster centroid. The algorithm continues until the centroids no longer move (actually when their movement stays below a certain threshold) or a user specified number of maximum iterations has been reached.

Take a look at the ```NamedVectorInstance``` class as well as the Cluster class and make sure you understand their purposes. Note that NamedVectorInstance also has a label “name” which we can use to inspect the clusters to see how constructive the cluster assignment was.

**Q0.** Which classes have ```public static void main```?

**Q1.** What is the purpose of the ```NamedVectorInstance``` class? What is the purpose of the ```Cluster``` class? What are the other classes one would need to write a k means clusterer?

The ```prepareClusters()``` method will create the initial clusters with random ```NamedVectorInstances``` selected from your data set. This lab will concentrate on updating the clusters.

### Coding Step 1: Distance

The first thing we’ll need to update the clusters is a ```distance``` method. We want to assign each instance to the cluster with the nearest centroid. In order to find the closest centroid, we need to find the distance between each cluster and each centroid. Please note that you’re finding the difference between n-dimensional vectors.

We’ll use Euclidean Distance which is discussed on page 131 of your textbook. In order to perform the mathmatical operations necessary use Java’s Math class (http://docs.oracle.com/javase/6/docs/api/java/lang/Math.html). You can also make use of the ```subtract()``` method in ```NamedVectorInstance```.

Write the body of ```private double distance(NamedVectorInstance inst, NamedVectorInstance centroid)``` method in the ```KmeansClusterer``` class to find the distance between two ```NamedVectorInstances```. Use the ```TestDistance``` class to test if your distance method works.

### Coding Step 2: Assignment to clusters

Now that we have a distance function, we’ll have to assign each instance to a cluster. Write the body of the ```assignToClusters()``` method in the ```KmeansClusterer``` class.

### Coding Step 3: Update the centroid

Now that each Cluster is populated, we’ll need to update each centroid to reflect the new centroid (average) of the the instances assigned to the cluster. **Write the body of the ```updateCentroid()``` in the ```Cluster``` class.**

### Coding Step 4: Stopping

Now that we’ve updated our centroids, we’ll need to figure out how and when to terminate the algorithm. The algorithm will terminate under two conditions: 
1. a maximum number of iterations has been reached (we don’t want it to go on updating indefinitely) 
2. the centroids “stop moving”

For 1, just add an iterations variable and increment it each time through the loop. For 2. you’ll need to implement the body of ```centroidsHaveMoved()```. Here you’ll check each of the centroids old centroids vs their current centroids, to determine if any has moved more than the threshold (I’ve defined threshold as .01 but you may want to play around with this value)

### Coding Step 5: Normalization

Finally we’ll correct for the fact that values for the different attributes of our instances have different ranges. If one has a range from 1-20 and another has a range from 0-100 it’s easy to see how one of these will have a larger impact on the distance calculation.

Write the ```createNormalizedList(ArrayList<NamedVectorInstance> listParam)``` method in the ```myKmeans``` class. Make use of the ```findMinMax(ArrayList<NamedVectorInstance> list2)``` method.

**Q2.** How would you choose the initial seed points to give the best clusters?

Run the algorithm using Look at the Iris data and intuitively choose three seed points. To do this, you will need to modify the ```cluster()``` method to use the method ```prepareClustersHuman()```, which will let you pick the seeds by selecting them from a the list of all the instances. Compare the clusters you get with the ones selected at random by the method ```prepareClustersRandom()```.

**Q3.** Describe an algorithm that would automate the process of choosing seed points, but would do better than choosing the three at random. If you have time, you could code your algorithm.

**Q4.** What difficulties did you encounter in this lab? What questions do you still have about Kmeans clustering?

Write up your answers to the questions and combine them with your code as a tar file. Submit the file with your names on it to the fileshare.

