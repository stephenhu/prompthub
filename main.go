package main

import (
	//"fmt"
	"database/sql"
	"log"
	"net/http"
	"os"

	"github.com/gorilla/mux"
	_ "modernc.org/sqlite"
	
)


var data *sql.DB


func connectDatabase() {

	_, err := os.Stat(DATABASE_FILE)

	if err != nil {

		log.Println(err)

	} else {

		db, err := sql.Open("sqlite", DATABASE_FILE)

		if err != nil {
			log.Println(err)
		} else {
			data = db
		}

	}

} // connectDatabase


func initRouter() *mux.Router {

	router := mux.NewRouter()

	router.HandleFunc("/api/v1/prompts/{id:[a-f0-9]+}", promptsHandler)
	router.HandleFunc("/api/v1/version", versionHandler)

	return router

} // initRouter


func main() {

	log.Printf("Starting prompthub %s\n", APP_VERSION)

	connectDatabase()

	log.Fatal(http.ListenAndServe(":8001", initRouter()))

} // main
