# Apache Spark and Amazon EMR Workshop

These are the scripts from the Apache Spark on Amazon EMR workshop led by JT Halbert, Chief Data Scientist at Tetra Concepts, and Jason Morris at Amazon.

The dataset used for the workshop is the ENRON email dataset from https://www.cs.cmu.edu/~./enron/

## Course Outline

Topics covered include:

- Installing Spark locally
- Deploying a Spark instance with Amazon's Elastic MapReduce
- Basic theory of Resilient Distributed Dataset
- Data exploration with Spark at the Spark Shell
- Using Spark's core APIs in Scala
- Using Spark's PairRDD functions
- Deploying a job on a Spark cluster
- How to access logs and diagnose a running job

## Usage

The rough steps to run through the workshop are:

1. Install `awscli` and `ssh` if you don't already have it
3. Run `demo.sh` that sets up the EC2 3 node cluster
4. Enter your aws keys and connect to the machine
5. Run `setup.sh` to get all the data from S3 buckets
6. That script also sets up Spark and your bash startup environment
7. Run `start-spark.sh` that sets up Spark using yarn
8. You're in the Scala REPL and play around with `followalong.scala`

## Acknowledgements

JT's github: https://github.com/notjasonmorris
