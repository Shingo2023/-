//モジュール
import UIKit
import Darwin

//バーチャルヴェンディングマシーン
class VirtualVendingMachine{
    enum DrinkType{
        case water
        case tea
        case juice
    }
    //定数inputedYenは０円 整数しか受け入れない
    var inputedYen = 0
   
    //それぞれの料金を定義
    var waterprice: Int = 110
    var teaprice: Int = 120
    var juiceprice: Int = 130
    
    //ストック数の定義
    var waterStock: Int = 20
    var teaStock: Int = 8
    var juiceStock: Int = 12
    
    //追加する仕様① 投入金額より商品の金額が少ない場合、購入可能な商品を表示する(printで表示)⭕️ 投入金額が足りない場合はその旨を表示する⭕️
    //追加する仕様②お釣りがある場合表示する
    
    //関数/func/メソッド バイドリンクで真理値を定義
    func buyDrink(type: DrinkType, inputedYen: Int) -> Bool {
        self.inputedYen = inputedYen//関数の外で定義しているプロパティなのでselfを記述
        //isBuyable購入可能な
        var isBuyable = false
        switch type {
        case .water://水の値段より投入金額が多い　かつ　０　よりストックが多い時選ばれるケース
            isBuyable = waterprice <= inputedYen && 0  < waterStock
            if waterprice > inputedYen {
                 print("残高不足")
            }
            let chage = inputedYen - waterprice
            if chage > 0 {print("\(chage)円お釣りがあります")}
            
        case .tea:
            isBuyable = teaprice <= inputedYen && 0 < teaStock
            if teaprice > inputedYen {
                 print("残高不足")
            }
            //入れたお金ー商品＝お釣り
            let chage = inputedYen - teaprice
            if chage > 0 {print("\(chage)円お釣りがあります")}
            
        case .juice:
            isBuyable = juiceprice <= inputedYen && 0 < juiceStock
            if juiceprice > inputedYen {
                 print("残高不足")
            }
            //入れたお金ー商品＝お釣り
            let chage = inputedYen - juiceprice
            if chage > 0 {print("\(chage)円お釣りがあります")}
        }
        //リデュース減らす
        reduceStock(type: type)
        return isBuyable
    }
    //減るストック
    func reduceStock(type: DrinkType) {
        //switch文　条件分岐　１つずつ減るよの定義
        switch type {
        case .water:
                //減算と代入 1
            waterStock -= 1
        case .tea:
            teaStock -= 1
        case .juice:
            juiceStock -= 1
        }
    }
}

let virtualVendingMachine = VirtualVendingMachine()
//サクセストゥーバイ　いれたお金
let isSuccessToBuy = virtualVendingMachine.buyDrink(type: .water, inputedYen: 200)
print(isSuccessToBuy)

