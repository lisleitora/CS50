# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

Random Partitioning isn't a very good option because it doesn't organize the information, even if it distributes the data equally.
Sending it without any filtering will make it much more difficult to find, and it will also require many more queries to locate or organize anything.

## Partitioning by Hour

Partitioning by Hour is much better than not organizing it at all, but it's still not perfect.
Although it makes querying a lot easier by reducing the number of queries needed to find information, this method of partitioning distributes data unevenly, and some boats might not receive any information at all.

## Partitioning by Hash Value

Partitioning by Hash Value makes it easier to find a single piece of data and ensures the information is evenly distributed, but for larger groups, it is just as impractical as Random Partitioning.
However, it makes organizing much easier, as it functions similarly to storing or consulting data in a table with an 'id' column.
