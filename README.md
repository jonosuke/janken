### 使い方
#### エミューレータ起動
```
flow emulator -v
```
### デプロイ
```
flow project deploy
```

#### じゃんけんをする
「手の種類」は下記のうちの一つを指定する。

- グー
- チョキ
- パー

```
flow transactions send cadence/transactions/jankenpoi.cdc 手の種類
```

例)
```
flow transactions send cadence/transactions/jankenpoi.cdc グー
```

エミュレータのログに、下記のようなログが出力される

例)
```
3:44PM INF LOG: "You Win !"
```

#### 勝敗履歴の取得
```
flow scripts execute cadence/scripts/score.cdc
```

例)
```
Result: "You: 5 VS. CPU: 7"
```
