import mysql.connector
from prettytable import PrettyTable

# Function to connect to the database and execute a query


def generate_report(database, query):
    try:
        # Establish a connection to the database
        conn = mysql.connector.connect(
            host='localhost',
            user='root',
            password='',
            database=database
        )
        # Create a cursor object using the cursor() method
        cursor = conn.cursor()

        # Execute the SQL query and organize the response
        cursor.execute(query)
        results = cursor.fetchall()
        headers = [i[0] for i in cursor.description]

        # Create a PrettyTable object with the column headers
        table = PrettyTable(headers)

        # Add rows to the table
        for row in results:
            table.add_row(row)

        # Print and save the table
        print(table)
        with open('report.txt', 'w') as file:
            file.write(str(table))

        cursor.close()
        conn.close()

    except mysql.connector.Error as e:
        print(f"Error: {e}")


# Database name
database_name = 'retail'
# Query 1
query_string = 'SELECT * FROM suppliers;'
print("*** SUPPLIERS ***")

# Call the function to generate the report
generate_report(database_name, query_string)
