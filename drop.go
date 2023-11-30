package main

import (
	"log"

	_ "github.com/instadrop-grad/instadrop/internal/init"
	query "github.com/instadrop-grad/instadrop/internal/query"
)

// Just to test the DB connection
func main() {
	db, err := query.Init_db()
	if err != nil {
		log.Fatal(err)
	}

	print(db.Stats().MaxOpenConnections)
}
