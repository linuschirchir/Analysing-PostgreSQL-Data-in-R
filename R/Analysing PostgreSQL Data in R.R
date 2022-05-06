# Connecting to a PostgreSQL database

{
  # Make required packages available
  require("RPostgreSQL")
  require(tidyverse)
  require(pool)
  }

{
  # Specify the driver needed to connect to PostgreSQL database.
  drv = dbDriver("PostgreSQL")
  print("Connecting to Database…")
  }


{
  # Connect to the PostgreSQL database.
  con <- dbConnect(drv, dbname = "dvdrental", 
                   host = "localhost", port = 5432,
                   user = "postgres", password = rstudioapi::askForPassword())
  print("Database Connected!")
  }


{
  # Check all tables in the PostgreSQL database
  cat('The following tables are available:\n')
print(dbListTables(con))
  cat('\n')
  }


# Use the dbGetQuery function to execute any SQL queries
# Execute a queries to extract data from the newly constructed tables into dataframes
{
  # Create a customer dataframe
  customer_df <- dbGetQuery(con, "SELECT * FROM customer")
  tibble(customer_df)
  }


{
  # Create a staff dataframe
  staff_df <- dbGetQuery(con, "SELECT * FROM staff")
  tibble(staff_df)
  }


{
  # Create a payment dataframe
  payment_df <- dbGetQuery(con, "SELECT * FROM payment")
  tibble(payment_df)
  }


{
  # Perform a PostgreSQL INNER JOIN to join three tables: staff, payment, and customer.
  customer_payments <- dbGetQuery(con, "
            SELECT
                c.customer_id,
                c.first_name customer_first_name,
                c.last_name customer_last_name,
                s.first_name staff_first_name,
                s.last_name staff_last_name,
                amount,
                payment_date
            FROM
                customer c
            INNER JOIN
                payment p 
            ON
                p.customer_id = c.customer_id
            INNER JOIN 
                staff s 
            ON 
                p.staff_id = s.staff_id
            ORDER BY 
                payment_date")
  tibble(customer_payments)
  }


{
  # Find a customer with a name beginning with the name "Jen".
  customers_jen <- dbGetQuery(con, "
            SELECT
	              first_name,
                last_name
            FROM
	              customer
            WHERE
	              first_name 
            LIKE 'Jen%'")
  tibble(customers_jen)
}



{
  # Find customers who have at least one payment whose amount is greater than 11
  pay_over_11 <- dbGetQuery(con, "
            SELECT 
                first_name,
                last_name
            FROM 
                customer c
            WHERE EXISTS
                (SELECT 1
            FROM 
                payment p
            WHERE 
            p.customer_id = c.customer_id
            AND 
                amount > 11 )
            ORDER BY 
                first_name,
                last_name;")
  tibble(pay_over_11)
}



{
  # close the connection
  dbDisconnect(con)
  print("The Database has been disconnected…")
  }