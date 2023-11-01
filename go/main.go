package main

import (
	"fmt"
	"math/rand"
	"time"
)

func main() {
	rand.Seed(time.Now().UnixNano())

	for i := 0; i < 10; i++ {
		go func(id int) {
			for {
				uniqueID := generateRandomID(8)
				fmt.Printf("Instance %d, Unique ID: %s\n", id, uniqueID)
				time.Sleep(1 * time.Second)
			}
		}(i)
	}

	select {}
}

func generateRandomID(length int) string {
	const charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
	result := make([]byte, length)
	for i := range result {
		result[i] = charset[rand.Intn(len(charset))]
	}
	return string(result)
}
