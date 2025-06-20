Database Connectivity:
Write a program to implement Menu driven MySQL/Oracle database connectivity with any front end language for Python/Java/PHP to implement Database navigation operations (add, delete, edit etc.)


✅ Step-by-Step Guide to Run in Ubuntu Terminal

🔧 1. Install MySQL Server (if not already installed)

sudo apt update
sudo apt install mysql-server

Set your MySQL root password during installation.


---

📦 2. Install MySQL Connector for Python

pip install mysql-connector-python

If you're using Python 3 and pip refers to Python 2, use:

pip3 install mysql-connector-python


---

💾 3. Create Database and Table in MySQL

Launch the MySQL shell:

sudo mysql -u root -p

Enter your password, then run:

CREATE DATABASE school;

USE school;

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    grade VARCHAR(5)
);
EXIT;


---

✍️ 4. Create the Python Script

Create a Python file named student_db.py:

nano student_db.py

Paste the entire code below into it:



from pymongo import MongoClient

client = MongoClient("mongodb://localhost:27017/")
db = client["college"]
collection = db["Student"]

def insert_student():
	rollno = int(input("Enter Roll Number: "))
	name = input("Enter Name: ")
	address = input("Enter Address: ")
	contact = input("Enter Contact Number: ")
	dept = input("Enter Department: ")
	collection.insert_one({
    	"rollno": rollno,
    	"name": name,
    	"address": address,
    	"contact_no": contact,
    	"department": dept
	})
	print("Student inserted successfully!")

def update_address():
	result = collection.update_one(
    	{"name": "Pooja", "address": "Shivaji Nagar"},
    	{"$set": {"address": "Saraswati Nagar"}}
	)
	if result.modified_count > 0:
    	print("Address updated successfully!")
	else:
    	print("No matching student found or already updated.")

def display_students():
	students = collection.find()
	for student in students:
    	print(student)

def delete_student():
	result = collection.delete_one({"rollno": 32})
	if result.deleted_count > 0:
    	print("Student deleted successfully.")
	else:
    	print("No student found with roll number 32.")

while True:
	print("\n=== Student Database Menu ===")
	print("1. Insert Student")
	print("2. Update Address of Pooja")
	print("3. Display Students")
	print("4. Delete Student with Roll No 32")
	print("5. Exit")

	choice = input("Enter your choice (1-5): ")

	if choice == '1':
    	insert_student()
	elif choice == '2':
    	update_address()
	elif choice == '3':
    	display_students()
	elif choice == '4':
    	delete_student()
	elif choice == '5':
    	break
	else:
    	print("Invalid choice. Please enter 1-5.")




$ python student_mongo.py

=== Student Database Menu ===
1. Insert Student
2. Update Address of Pooja
3. Display Students
4. Delete Student with Roll No 32
5. Exit
Enter your choice (1-5): 1
Enter Roll Number: 31
Enter Name: Pooja
Enter Address: Shivaji Nagar
Enter Contact Number: 9876543210
Enter Department: Computer
Student inserted successfully!

=== Student Database Menu ===
1. Insert Student
2. Update Address of Pooja
3. Display Students
4. Delete Student with Roll No 32
5. Exit
Enter your choice (1-5): 2
Address updated successfully!

=== Student Database Menu ===
1. Insert Student
2. Update Address of Pooja
3. Display Students
4. Delete Student with Roll No 32
5. Exit
Enter your choice (1-5): 3
{'_id': ObjectId('...'), 'rollno': 31, 'name': 'Pooja', 'address': 'Saraswati Nagar', 'contact_no': '9876543210', 'department': 'Computer'}

=== Student Database Menu ===
1. Insert Student
2. Update Address of Pooja
3. Display Students
4. Delete Student with Roll No 32
5. Exit
Enter your choice (1-5): 4
No student found with roll number 32.

=== Student Database Menu ===
Enter your choice (1-5): 5




---

▶️ 5. Run the Program in Terminal

Run the script using:

python3 student_db.py


---

✅ Done!

You’ll now see a menu in the terminal:

====== Student Database Menu ======
1. Add Student
2. View Students
3. Edit Student
4. Delete Student
5. Exit



