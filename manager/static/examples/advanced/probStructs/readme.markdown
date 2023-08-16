title: probablistic structs
pcaps: 
Bloom Filters are probabalist by that i mean there is the possibilty of a false positive; however, we can set the false positive rate in zeek. all a bloom filter will be able to tell you is if something is in the bloom filter as entries are hashed and then bytes at the corresponding place gets set to 1. the nice thing about bloomfilters is that they are very space efficent so they are great for memebership tests of large datasets.

opqaue of cardinality uses hyper log log to create a very space effiecent estimation of cardinality of a table or set. just like with bloom filters this algorithm is not entirely accurate as it uses probabalistic counting. that is a fine tradeoff to make for both space and cpu effieceny because we still get a fairly accurate count of a set.

note on scale both of these structs are great for when we are dealing with more then 100k


