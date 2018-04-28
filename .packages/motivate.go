package main

import (
	"fmt"
	"os"
	"strings"
)

var dbFile string = "$HOME/.config/quotes.db"

func main() {
	fmt.Printf("DERP: %d %s\n", len(os.Args), os.Args[0])
}

// #EOF
