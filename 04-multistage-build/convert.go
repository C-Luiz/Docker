package main

import (
	"fmt"
	"os"
	"os/exec"
)

func main() {
	if len(os.Args) < 3 {
		fmt.Println("Uso: ./converter <input> <formato>")
		return
	}
	input := os.Args[1]
	format := os.Args[2]
	output := fmt.Sprintf("output.%s", format)

	cmd := exec.Command("ffmpeg", "-i", input, output)
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	err := cmd.Run()
	if err != nil {
		fmt.Printf("Erro ao converter vídeo: %v\n", err)
	}
}

