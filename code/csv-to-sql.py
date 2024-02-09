import os
import csv


def generate_insert_statements(directory):
    # Ensure the queries directory exists
    queries_dir = os.path.join(directory, "../sql-queries")
    os.makedirs(queries_dir, exist_ok=True)

    for filename in os.listdir(directory):
        if filename.endswith(".csv"):
            table_name = os.path.splitext(filename)[0]
            filepath = os.path.join(directory, filename)
            with open(filepath, mode='r', encoding='utf-8') as csvfile:
                reader = csv.reader(csvfile)
                headers = next(reader)  # Get headers for column names
                columns = ", ".join(headers)
                placeholders = ", ".join(["%s"] * len(headers))

                # Initialize a list to hold each row's INSERT statement
                insert_statements = []
                for row in reader:
                    values = "', '".join(row)  # Prepare the row data
                    insert_stmt = f"INSERT INTO {table_name} ({columns}) VALUES ('{values}');"
                    insert_statements.append(insert_stmt)

                # Save all insert statements to a .sql file
                sql_filename = os.path.join(
                    queries_dir, f"populate-{table_name}.sql")
                with open(sql_filename, mode='w', encoding='utf-8') as sqlfile:
                    for stmt in insert_statements:
                        sqlfile.write(stmt + "\n")


generate_insert_statements('../data-files')
