import mysql.connector


def create_database():
    try:
        conn = mysql.connector.connect(
            host="localhost",
            user="root",
            password="Nicaragua90"
        )

        if conn.is_connected():
            cursor = conn.cursor()
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("✅ Database 'alx_book_store' created successfully!")

    except mysql.connector.Error as err:
        print(f"MySQL Error: {err}")

    finally:
        cursor.close()
        conn.close()
        print("🔚 Connection closed.")


if __name__ == "__main__":
    create_database()
