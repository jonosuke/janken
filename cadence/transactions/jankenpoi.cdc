import "Janken"

transaction(action: String) {
    prepare(signer: AuthAccount) {}

    execute {
        let result = Janken.jankenpoi(yourAction: action)
        log(result)
    }
}