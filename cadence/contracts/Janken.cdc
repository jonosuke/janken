pub contract Janken {
    // 勝敗の結果を記録する
    pub var scores: {String: Int}

    // じゃんけんの手の種類
    pub let actions: [String]

    init() {
        self.scores = {
            "あなた": 0,
            "CPU": 0
        }
        self.actions = ["グー", "チョキ", "パー"]
    }

    // じゃんけんをして、結果を返す
    pub fun jankenpoi(yourAction: String): String {
        /*
           CPUの行動をランダムに決める。
           unsafeRandom()は、0〜18446744073709551615の間の整数を返す。
           「% 3」は3で割ったときの余りを返すので、0〜2の間の整数を返してくれる。
           初めて見るとぎょっとするかもしれないけど、良くある書き方なので気にしなくてもいい。
         */
        let cpuAction = self.actions[unsafeRandom() % 3]

        // 勝敗を判定する
        let matchResult = self.judge(yourAction: yourAction, cpuAction: cpuAction)

        // 勝った場合は、あなたの勝ち数を1増やす
        if matchResult == "win" {
            self.scores["あなた"] = self.scores["あなた"]! + 1
            return "You Win !"
        // 負けた場合は、CPUの勝ち数を1増やす
        } else if matchResult == "lose" {
            self.scores["CPU"] = self.scores["CPU"]! + 1
            return "You Lose !"
        // 引き分けの場合は何もしない
        } else {
            return "Draw !"
        }
    }

    // じゃんけんの勝敗を判定する
    priv fun judge(yourAction: String, cpuAction: String): String {
        switch yourAction {
        case "グー":
            switch cpuAction {
            case "グー":
                return "draw"
            case "チョキ":
                return "win"
            case "パー":
                return "lose"
            default:
                return panic("知らない行動です: ".concat(cpuAction))
            }
        case "チョキ":
            switch cpuAction {
            case "グー":
                return "lose"
            case "チョキ":
                return "draw"
            case "パー":
                return "win"
            default:
                return panic("知らない行動です: ".concat(cpuAction))
            }
        case "パー":
            switch cpuAction {
            case "グー":
                return "win"
            case "チョキ":
                return "lose"
            case "パー":
                return "draw"
            default:
                return panic("知らない行動です: ".concat(cpuAction))
            }
        default:
            return panic("知らない行動です: ".concat(yourAction))
        }
    }
}