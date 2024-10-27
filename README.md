### Importing Data into MySQL Docker Container

1. Clone this repository, which includes `tomato.sql`, `mysql-migrate.sh`, and `mysql-migrate.ps1`.

2. **For Unix-based systems**:

   - Open a terminal in the project directory.
   - Run the following commands:
     ```bash
     chmod +x mysql-migrate.sh
     ./mysql-migrate.sh
     ```

3. **For Windows**:
   - Open PowerShell as Administrator.
   - Run the following command in the project directory:
     ```powershell
     .\mysql-migrate.ps1
     ```

After running the appropriate script, the data from `tomato.sql` should be imported into the MySQL container.

### Importing Data into MongoDB Docker Container

1. Clone this repository, which includes `mongo_dump`, `mongo-migrate.sh`, and `mongo-migrate.ps1`.

2. **For Unix-based systems**:

   - Open a terminal in the project directory.
   - Run the following commands:
     ```bash
     chmod +x mongo-migrate.sh
     ./mongo-migrate.sh
     ```

3. **For Windows**:
   - Open PowerShell as Administrator.
   - Run the following command in the project directory:
     ```powershell
     .\mongo-migrate.ps1
     ```

After running the appropriate script, the data from `mongo_dump` should be imported into the MongoDB container.
