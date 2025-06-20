MongoDB Aggregation and Indexing
Create the collection Books having the following fields TITLE,
DESCRIPTION, BY, URL, TAGS AND LIKES.
Implement the following Aggregation and Indexing Queries


Step 1: Create the Collection and Insert Sample Books

Open your Mongo shell or MongoDB client and run:

use yourDatabaseName;  // Replace with your DB name

db.Books.insertMany([
  {
    TITLE: "MongoDB Basics",
    DESCRIPTION: "Introduction to MongoDB",
    BY: "Ajay",
    URL: "http://example.com/mongodb-basics",
    TAGS: ["database", "mongodb", "nosql"],
    LIKES: 150
  },
  {
    TITLE: "Advanced MongoDB",
    DESCRIPTION: "Deep dive into aggregation framework",
    BY: "Ajay",
    URL: "http://example.com/advanced-mongodb",
    TAGS: ["database", "aggregation", "nosql"],
    LIKES: 250
  },
  {
    TITLE: "Node.js Guide",
    DESCRIPTION: "Comprehensive Node.js tutorials",
    BY: "Ajay",
    URL: "http://example.com/nodejs-guide",
    TAGS: ["nodejs", "javascript", "backend"],
    LIKES: 100
  },
  {
    TITLE: "Python for Data Science",
    DESCRIPTION: "Using Python in data science",
    BY: "Rahul",
    URL: "http://example.com/python-data-science",
    TAGS: ["python", "data science", "machine learning"],
    LIKES: 300
  },
  {
    TITLE: "MongoDB Indexing",
    DESCRIPTION: "Efficient indexing techniques",
    BY: "Ajay",
    URL: "http://example.com/mongodb-indexing",
    TAGS: ["database", "indexing", "performance"],
    LIKES: 75
  }
]);

Run this and let me know once the data is inserted successfully.


---

Step 2: Find the Number of Books Published by “Ajay”

Run this aggregation query:

db.Books.aggregate([
  { $match: { BY: "Ajay" } },
  { $count: "numberOfBooksByAjay" }
]);

This will output something like:

[{ "numberOfBooksByAjay": 4 }]

because Ajay has 4 books in the sample data.


---

Step 3: Find Books with Minimum and Maximum Likes Published by “Ajay”

Run this aggregation:

db.Books.aggregate([
  { $match: { BY: "Ajay" } },
  {
    $group: {
      _id: null,
      minLikes: { $min: "$LIKES" },
      maxLikes: { $max: "$LIKES" }
    }
  },
  {
    $lookup: {
      from: "Books",
      let: { minLikes: "$minLikes", maxLikes: "$maxLikes" },
      pipeline: [
        { $match: { BY: "Ajay" } },
        {
          $match: {
            $expr: {
              $or: [
                { $eq: ["$LIKES", "$$minLikes"] },
                { $eq: ["$LIKES", "$$maxLikes"] }
              ]
            }
          }
        }
      ],
      as: "minMaxLikeBooks"
    }
  },
  { $unwind: "$minMaxLikeBooks" },
  {
    $replaceRoot: { newRoot: "$minMaxLikeBooks" }
  }
]);

You should get two documents — one with the minimum likes (75) and one with the maximum likes (250), both by Ajay.


---

Step 4: Find the Average Number of Likes of Books Published by Ajay

Run:

db.Books.aggregate([
  { $match: { BY: "Ajay" } },
  {
    $group: {
      _id: null,
      averageLikes: { $avg: "$LIKES" }
    }
  }
]);

The output will be something like:

[{ "_id": null, "averageLikes": 143.75 }]


---

Step 5: Find the First and Last Book Published by “Ajay”

Run this:

db.Books.aggregate([
  { $match: { BY: "Ajay" } },
  { $sort: { _id: 1 } },  // sort by _id ascending (oldest first)
  {
    $group: {
      _id: null,
      firstBook: { $first: "$$ROOT" },
      lastBook: { $last: "$$ROOT" }
    }
  }
]);

This will return a document with firstBook and lastBook sub-documents (books) by Ajay.


---

Step 6: Create an Index on the Author Name (BY field)

Run:

db.Books.createIndex({ BY: 1 });

This creates an ascending index on the BY field.


---

Step 7: Query Books Published by Ajay and Check Index Usage

Run the query with explain:

db.Books.find({ BY: "Ajay" }).explain("executionStats");

Look in the output for:

"indexName" (should be something like BY_1).

"totalKeysExamined" and "totalDocsExamined" — if an index is used, totalKeysExamined will be close to the number of results, and totalDocsExamined will be low.


