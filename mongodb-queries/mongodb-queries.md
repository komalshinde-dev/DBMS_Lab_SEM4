MongoDB Queries 
Implement the following MongoDb Query

1. Create a collection named books

In MongoDB, collections are created implicitly when you insert documents, so no explicit command is needed. But for clarity:

db.createCollection("books");


---

2. Insert 5 records with fields: TITLE, DESCRIPTION, BY, URL, TAGS, and LIKES

db.books.insertMany([
  {
    TITLE: "mongodb",
    DESCRIPTION: "Introduction to MongoDB",
    BY: "Ajay",
    URL: "http://mongodb.com/intro",
    TAGS: ["database", "NoSQL", "MongoDB"],
    LIKES: 15
  },
  {
    TITLE: "NoSQL overview",
    DESCRIPTION: "Overview of NoSQL databases",
    BY: "Sita",
    URL: "http://nosql.com/overview",
    TAGS: ["NoSQL", "database"],
    LIKES: 8
  },
  {
    TITLE: "Advanced MongoDB",
    DESCRIPTION: "Deep dive into MongoDB features",
    BY: "Ajay",
    URL: "http://mongodb.com/advanced",
    TAGS: ["MongoDB", "database", "NoSQL"],
    LIKES: 120
  },
  {
    TITLE: "SQL vs NoSQL",
    DESCRIPTION: "Comparing SQL and NoSQL databases",
    BY: "Ravi",
    URL: "http://db.com/sql-vs-nosql",
    TAGS: ["SQL", "NoSQL", "database"],
    LIKES: 30
  },
  {
    TITLE: "Data Modeling",
    DESCRIPTION: "Data modeling techniques",
    BY: "Ajay",
    URL: "http://datamodel.com",
    TAGS: ["data", "modeling", "database"],
    LIKES: 5
  }
]);


---

3. Insert 1 more document with additional fields: userName and comments

db.books.insertOne({
  TITLE: "MongoDB Comments",
  DESCRIPTION: "Document with comments",
  BY: "Neha",
  URL: "http://mongodb.com/comments",
  TAGS: ["MongoDB", "comments"],
  LIKES: 20,
  userName: "neha123",
  comments: ["Great article!", "Very helpful!"]
});


---

4. Display all documents whose title is 'mongodb'

Note: The field is case-sensitive, so make sure the title matches exactly.

db.books.find({ TITLE: "mongodb" });


---

5. Display all documents written by 'Ajay' or whose title is 'mongodb'

db.books.find({
  $or: [
    { BY: "Ajay" },
    { TITLE: "mongodb" }
  ]
});


---

6. Display all documents whose title is 'mongodb' and written by 'Ajay'

db.books.find({
  TITLE: "mongodb",
  BY: "Ajay"
});


---

7. Display all documents whose likes are greater than 10

db.books.find({
  LIKES: { $gt: 10 }
});


---

8. Display all documents whose likes are greater than 100 and whose title is either 'mongodb' or written by 'Ajay'

db.books.find({
  LIKES: { $gt: 100 },
  $or: [
    { TITLE: "mongodb" },
    { BY: "Ajay" }
  ]
});


---

9. Update the title of 'mongodb' document to 'mongodb overview'

db.books.updateOne(
  { TITLE: "mongodb" },
  { $set: { TITLE: "mongodb overview" } }
);


---

10. Delete the document titled 'NoSQL overview'

db.books.deleteOne({ TITLE: "NoSQL overview" });


---

11. Display exactly two documents written by 'Ajay'

db.books.find({ BY: "Ajay" }).limit(2);


---

12. Display the second document published by 'Ajay'

To get the second document, you can skip the first and limit 1:

db.books.find({ BY: "Ajay" }).skip(1).limit(1);


---

13. Display all the books in sorted fashion

Sort by TITLE ascending (alphabetical order):

db.books.find().sort({ TITLE: 1 });


---

14. Insert a document using the save method

Note: The save method is deprecated in newer MongoDB drivers but still works in older versions.

Example document:

db.books.save({
  TITLE: "MongoDB save method",
  DESCRIPTION: "Using save method example",
  BY: "Ajay",
  URL: "http://mongodb.com/save",
  TAGS: ["MongoDB", "save"],
  LIKES: 25
});


—

