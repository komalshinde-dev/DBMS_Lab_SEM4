MongoDB Queries: Design and Develop MongoDB Queries using CRUD operations.(Use CRUD operations, SAVE method, logical operators etc.)

Implement the following MongoDb Query

1. Create a collection named books.


2. Insert 5 records with field TITLE,DESCRIPTION,BY,URL,TAGS AND LIKES


3. Insert 1 more document in the collection with additional field of user name and comments.


4. Display all the documents whose title is 'mongodb'.


5. Display all the documents written by 'john' or whose title is 'mongodb'.


6. Display all the documents whose title is 'mongodb' and written by 'john'.


7. Update the title of 'mongodb' document to 'mongodb overview'


8. Delete the document titled 'nosql overview'.


9. Display exactly two documents written by 'john'.


Code -
1. Create a collection named books

In MongoDB, collections are created implicitly when you insert the first document, so no explicit command is needed to create a collection.


---

2. Insert 5 records with fields: TITLE, DESCRIPTION, BY, URL, TAGS, LIKES

db.books.insertMany([
  {
    TITLE: "mongodb",
    DESCRIPTION: "Introduction to MongoDB",
    BY: "john",
    URL: "http://example.com/mongodb-intro",
    TAGS: ["database", "nosql", "mongodb"],
    LIKES: 100
  },
  {
    TITLE: "nosql overview",
    DESCRIPTION: "Overview of NoSQL Databases",
    BY: "alice",
    URL: "http://example.com/nosql-overview",
    TAGS: ["database", "nosql"],
    LIKES: 80
  },
  {
    TITLE: "node.js tutorial",
    DESCRIPTION: "Learn Node.js with MongoDB",
    BY: "john",
    URL: "http://example.com/nodejs-mongodb",
    TAGS: ["nodejs", "mongodb", "javascript"],
    LIKES: 150
  },
  {
    TITLE: "express.js guide",
    DESCRIPTION: "Guide to Express.js framework",
    BY: "bob",
    URL: "http://example.com/express-guide",
    TAGS: ["express", "nodejs", "web"],
    LIKES: 120
  },
  {
    TITLE: "react tutorial",
    DESCRIPTION: "React for beginners",
    BY: "carol",
    URL: "http://example.com/react-tutorial",
    TAGS: ["react", "javascript", "frontend"],
    LIKES: 200
  }
]);


---

3. Insert 1 more document with additional fields username and comments

db.books.insertOne({
  TITLE: "mongodb advanced",
  DESCRIPTION: "Advanced MongoDB concepts",
  BY: "dave",
  URL: "http://example.com/mongodb-advanced",
  TAGS: ["database", "nosql", "mongodb", "advanced"],
  LIKES: 50,
  username: "dave123",
  comments: [
    { user: "alice", comment: "Great advanced concepts!" },
    { user: "john", comment: "Very helpful, thanks!" }
  ]
});


---

4. Display all documents whose title is 'mongodb'

db.books.find({ TITLE: "mongodb" }).pretty();


---

5. Display all documents written by 'john' OR whose title is 'mongodb'

db.books.find({
  $or: [
    { BY: "john" },
    { TITLE: "mongodb" }
  ]
}).pretty();


---

6. Display all documents whose title is 'mongodb' AND written by 'john'

db.books.find({
  TITLE: "mongodb",
  BY: "john"
}).pretty();


---

7. Update the title of the document with title 'mongodb' to 'mongodb overview'

db.books.updateOne(
  { TITLE: "mongodb" },
  { $set: { TITLE: "mongodb overview" } }
);


---

8. Delete the document titled 'nosql overview'

db.books.deleteOne({ TITLE: "nosql overview" });


---

9. Display exactly two documents written by 'john'

db.books.find({ BY: "john" }).limit(2).pretty();


