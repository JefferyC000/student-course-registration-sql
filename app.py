import sqlite3


def connect_db():
    conn = sqlite3.connect("students.db")
    cursor = conn.cursor()

    cursor.execute("""
    CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        major TEXT NOT NULL,
        grade TEXT
    )
    """)

    conn.commit()
    return conn, cursor


def add_student(cursor, conn):
    name = input("Enter student name: ").strip()
    major = input("Enter student major: ").strip()
    grade = input("Enter student grade: ").strip()

    if name == "" or major == "":
        print("Name and major cannot be empty.")
        return

    cursor.execute(
        "INSERT INTO students (name, major, grade) VALUES (?, ?, ?)",
        (name, major, grade)
    )
    conn.commit()
    print("Student added successfully.\n")


def view_students(cursor):
    cursor.execute("SELECT * FROM students")
    rows = cursor.fetchall()

    if len(rows) == 0:
        print("No students found.\n")
        return

    print("\nStudent Records:")
    print("-" * 50)
    for row in rows:
        print(f"ID: {row[0]} | Name: {row[1]} | Major: {row[2]} | Grade: {row[3]}")
    print()


def update_grade(cursor, conn):
    student_id = input("Enter student ID to update: ").strip()
    new_grade = input("Enter new grade: ").strip()

    cursor.execute("SELECT * FROM students WHERE id = ?", (student_id,))
    student = cursor.fetchone()

    if student is None:
        print("Student not found.\n")
        return

    cursor.execute(
        "UPDATE students SET grade = ? WHERE id = ?",
        (new_grade, student_id)
    )
    conn.commit()
    print("Grade updated successfully.\n")


def delete_student(cursor, conn):
    student_id = input("Enter student ID to delete: ").strip()

    cursor.execute("SELECT * FROM students WHERE id = ?", (student_id,))
    student = cursor.fetchone()

    if student is None:
        print("Student not found.\n")
        return

    cursor.execute("DELETE FROM students WHERE id = ?", (student_id,))
    conn.commit()
    print("Student deleted successfully.\n")


def main():
    conn, cursor = connect_db()

    while True:
        print("Student Grade Tracker")
        print("1. Add student")
        print("2. View students")
        print("3. Update grade")
        print("4. Delete student")
        print("5. Exit")

        choice = input("Choose an option: ").strip()

        if choice == "1":
            add_student(cursor, conn)
        elif choice == "2":
            view_students(cursor)
        elif choice == "3":
            update_grade(cursor, conn)
        elif choice == "4":
            delete_student(cursor, conn)
        elif choice == "5":
            print("Goodbye.")
            break
        else:
            print("Invalid choice. Try again.\n")

    conn.close()


if __name__ == "__main__":
    main()