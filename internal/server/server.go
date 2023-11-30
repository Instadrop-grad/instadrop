package server

import (
	"context"
	"log"
	"net/http"
	"os"
	"os/signal"
	"time"

	"github.com/gorilla/mux"
)

func Serv() {
	var wait time.Duration
	r := mux.NewRouter()

	srv := &http.Server{
		Addr:    "0.0.0.0:2002",
		Handler: r,
	}

	go func() {
		if err := srv.ListenAndServe(); err != nil {
			log.Fatal(err)
		}
	}()

	print("Insta Drop is working on port 2002")
	c := make(chan os.Signal, 1)

	signal.Notify(c, os.Interrupt)

	// Block until we receive our signal.
	<-c

	ctx, cancel := context.WithTimeout(context.Background(), wait)
	defer cancel()

	srv.Shutdown(ctx)

	log.Println("InstaDrop is down")
	os.Exit(0)
}
