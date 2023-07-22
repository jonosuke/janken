import "Janken"

pub fun main(): String {
    let yourScore = Janken.scores["あなた"]!.toString()
    let cpuScore = Janken.scores["CPU"]!.toString()
    return "You: ".concat(yourScore).concat(" VS. CPU: ").concat(cpuScore)
}