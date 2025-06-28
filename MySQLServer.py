import mysql.connector
from mysql.connector import Error
import traceback


def create_database():
    try:
        conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Nicaragua90",
        connection_timeout=5,  # wait max 5 seconds
        auth_plugin='mysql_native_password'
        )

        if conn.is_connected():
            cursor =  conn.cursor()
            
            # Create a Database
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")    
    
    except Error as err:
        print(f"Error: {err}")

    except Exception as e:
        print("Unexpected error occurred:")
        traceback.print_exc()  # Shows full error stack trace
        
    finally:

        try:
            # Close cursor and connection safely
            if 'cursor' in locals():
                cursor.close()
            if 'conn' in locals() and conn.is_connected():
                conn.close()
        except:
            pass

if __name__ == "__main__":
    create_database()