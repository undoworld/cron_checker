# cron_checker

cron で定期実行した処理の結果（件数などの値）を検査して `log.txt` に記録し、その日の記録をまとめて表示する Perl スクリプト。2015年に作ったもの。

## ファイル

- `cron_check.pl`: 値を条件で検査し、`OK` か `NG` を出力する。実行日時・名前・値・条件を `log.txt` に追記する
- `send_cron_result.pl`: `log.txt` から今日の日付の行だけを出力する（メールなどで結果を送る用）

## 使い方

```sh
# 値 9 が「9より大きい」かを検査する（この例は NG）
perl cron_check.pl --name=DailyCount --value=9 --validate='>9'

# 文字列の一致を検査する
perl cron_check.pl --name=DailyCount --value=ando --validate='eq "ando"'

# 今日の記録を表示する
perl send_cron_result.pl
```

| オプション | 意味 | 省略したとき |
| --- | --- | --- |
| `--name` | 記録に残す名前 | `undo` |
| `--value` | 検査する値 | `0` |
| `--validate` | 値の後ろにつなげて評価する Perl の条件式（例: `>9`、`eq "ando"`） | `0` |

## 注意

- `log.txt` は実行したときのカレントディレクトリに作られる。cron から呼ぶときは `cd` してから実行する
- `--validate` は `eval` でそのまま実行されるので、信頼できない入力を渡さない
- `log.txt` の行末の `OK` は、検査の結果ではなく「値が 0 より大きいか」で書かれる。また値が 0 以下や文字列のときは改行が書かれず、次の記録が同じ行につながる
