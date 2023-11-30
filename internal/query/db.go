package query

import (
	"database/sql"
	"log"

	_ "github.com/lib/pq"
)

func init_db() (*sql.DB, error) {
	connStr := "postgres://instadrop:instadrop@localhost:5432/drop"
	db, err := sql.Open("postgres", connStr)
	if err != nil {
		log.Fatal(err)
	}
	return db, err
}

func ExQuery(Query string) *sql.Rows {
	db, err := init_db()
	if err != nil {
		log.Fatal(err)
	}

	rows, err := db.Query(Query)
	if err != nil {
		log.Fatal(err)
	}

	return rows
}
