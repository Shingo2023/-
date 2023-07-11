import Foundation//ファンデーション
import PlaygroundSupport//プレイグランドサポート

//プレイグランドページ　現在　無期限実行
PlaygroundPage.current.needsIndefiniteExecution = true

class Alarm {
    var timer: Timer?//変数タイマーint型 ?はオプショナルバインディング機能と仮定
    var setcount: Int = 10//ここに打ったものが温め時間になる
    var limit = 1199//19分59秒を秒に直した値
    //元の文var limit: Int = 5
    
    func start() {
        timer  = Timer.scheduledTimer(//スケジュールタイマー　関数とクラスを紐付けた
        timeInterval: 1,//タイマーの実行間隔を指定(単位はn秒)
        target: self,//ここはselfでOK
        selector: #selector(countdown),//セレクター
        userInfo: nil,//ユーザー情報 ここはnilでOK
        repeats: true//リピーズ　繰り返し処理を実行したいので「true」を指定
            )
        }
    //Timerクラスに設定するメソッドは「@objc」キーワードを忘れずに付与する
        @objc func countdown() {
            setcount -= 1//0カウントから1づつカウントダウンしていく
            //リミットを分に直して止める処理
            let minutes = setcount / 60//分を表す
            let seconds = setcount % 60//秒を表す
            print("カウントは\(minutes)分\(seconds)秒です")
            
            if setcount == 0 {
                print("ジリリリリ！（カウントをストップします）")
                //タイマーを止める
                timer?.invalidate()//タイマーを止める
            }
        }
    }
    
    let alarm = Alarm()
    alarm.start()
