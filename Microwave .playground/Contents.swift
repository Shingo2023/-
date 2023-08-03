//仕様を決める
//温め中に残りのタイマーを表示させる⭕️
//温め可能時間を19分59秒までとする⭕️
//温め完了を知らせる⭕️

import UIKit

import Foundation//ファンデーション
import PlaygroundSupport//プレイグランドサポート
//プレイグランドページ　現在　無期限実行
PlaygroundPage.current.needsIndefiniteExecution = true

//並べるだけ クラスまとめて動かすことができる
class VirtualMicrowave {//
    
    //アラームクラスに設定してた文たち
    var timer: Timer?//変数タイマーint型 ?はオプショナルバインディング機能と仮定
    var setCount: Int = 50//ここに打ったものが温め時間になる
    var limit = 1199 //19分59秒を秒に直した値

    init(setCount: Int) {
    self.setCount = setCount
    }

    func start() {
        if self.setCount > limit {
            print("温め出来ません！")
            return
        }
        timer  = Timer.scheduledTimer(//スケジュールタイマー　関数とクラスを紐付けた
            timeInterval: 1,//タイマーの実行間隔を指定(単位はn秒)
            target: self,//ここはselfでOK
            selector: #selector(countDown),//セレクター
            userInfo: nil,//ユーザー情報 ここはnilでOK
            repeats: true//リピーズ　繰り返し処理を実行したいので「true」を指定
        )
    }
    //Timerクラスに設定するメソッドは「@objc」キーワードを忘れずに付与する
    @objc func countDown() {
        setCount -= 1//0カウントから1づつカウントダウンしていく
        //リミットを分に直して止める処理
        let minutes = setCount / 60//分を表す
        let seconds = setCount % 60//秒を表す
        print("カウントは\(minutes)分\(seconds)秒です")
            
        if setCount == 0 {
            print("ジリリリリ！（カウントをストップします）")
            //タイマーを止める
            timer?.invalidate()//タイマーを止める
        }
    }
}
let virtualmicrowave = VirtualMicrowave(setCount: 1199)//クラスをインスタンス化
virtualmicrowave.start()
