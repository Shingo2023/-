//仕様を決める
//ワット数別で温める⭕️
//温め中に残りのタイマーを表示させる
//温め可能時間を14分までとする
//温め完了を知らせる

import UIKit

//並べるだけ クラスまとめて動かすことができる
class Virtualmicrowave {

    enum electronicOutput {//電子出力
        case low
        
        case medium
        
        case high
        
        var displayName: String{
            switch self {
            case .low:
                return "500W"
            case .medium:
                return "700W"
            case .high:
                return "900W"
                
                //テキスト
                //タイマー
                var TimeSet = (min:0,sec:0)//変数時間＝分,秒　二つの数字の設定をしている
                
                //タイマー減らす
                class CountdownTimer {
                    TimeSet -= 1
                }
               //すべての場合にプリントする
             print(残りの温め時間は\()です。)
                
        
        }
    }
}
