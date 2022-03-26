# Welcome to Pier Problem!

This program is written in **MATLAB 2018** Software. It is a test problem for Communere Ltd.
In order to run the program, **"Run.m"** file should be started. It will ask for the input data & the output will be a matrix array called **"final"**.


# Functions

There are actually **two** major functions called **"dist"** and **"dijkstra"**. The other functions are used inside "dijkstra" function.

## dist

The "dist" function is used in order to calculate the distance between each pair of nodes. Using this function we will have four matrixes with pair nodes distances which are: 
1. houses to bridges
2. houses to piers
3. bridges to shops
4. piers to shops

Since all bridges have the same size on the river and the bicycles speeds are equal to boats, we can use nodes instead of bridges and piers (and add their length to all of our distances in the final matrix). 

## dijkstra

There are many algorithms for solving problems which have an objective of the shortest path. In our test, one of the best used ones is the dijkstra algorithm.
