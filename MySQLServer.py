import mysql.connector
import traceback


def create_database():
    try:
        print("🔍 Connecting to MySQL...")
        conn = mysql.connector.connect(
            host="localhost",
            user="root",
            password="Nicaragua90",
            auth_plugin='mysql_native_password'
        )

        if conn.is_connected():
            cursor = conn.cursor()
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("✅ Database 'alx_book_store' created successfully!")

    except mysql.connector.Error as err:
        print(f"🔴 MySQL Error: {err}")

    except Exception as e:
        print("🔴 Unexpected error occurred:")
        traceback.print_exc()

    finally:
        try:
            if 'cursor' in locals():
                cursor.close()
            if 'conn' in locals() and conn.is_connected():
                conn.close()
                print("🔚 Connection closed.")
        except:
            pass


if __name__ == "__main__":
    print("🟡 Starting database creation script...")
    create_database()
