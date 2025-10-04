package main

import (
	"log"
	"net/http"

	"github.com/gorilla/mux"
)


func promptsHandler(w http.ResponseWriter, r *http.Request) {

	switch r.Method {
	case http.MethodPut:
	case http.MethodGet:

		vars := mux.Vars(r)

		id := vars["id"]

		log.Println(id)

	case http.MethodDelete:
	case http.MethodPost:
	default:
		w.WriteHeader(http.StatusMethodNotAllowed)
	}
	
} // versionHandler