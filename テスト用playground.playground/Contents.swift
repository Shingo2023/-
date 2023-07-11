//具体的な使用例
//自動販売機のロジック作成
//機能要件の整理
//　・日本円を入力できる
//　・対象の飲み物は「コーヒー」「水」「モンスター」とする
//　・入力された日本円と飲み物の価格を比較し、前者が後者の値を上回っている且つ対象の飲み物の在庫がある場合に購入可能フラグを返す
//　・飲み物が購入できた際に対象の飲み物の在庫を1減らす
//　・飲み物を購入した際に対象の飲み物の値段を入力された日本円から差し引く
class VirtualVendingMachine {//クラスを定義
    //入力された日本円
    var inputedYen = 0  //後で変更できるように変数にしておく
    
    var coffeePrice = 120//価格設定
    var waterPrice = 100
    var monsterPrince = 210
    
    //在庫
    var coffeeStock = 10
    var waterStock = 15
    var monsterStock = 5
    
    enum DrinkType {
        case coffee //飲み物を列挙
        case water
        case monster
    }
    func buyDrink(type: DrinkType) -> Bool { //関数buyDrinkのtypeが引数名。DrinkTypeが型名兼定義してある列挙型を使用さらに後にはBool型を定義
        var isBuyable = false //全てのパターンをfslseにしておけば演算式が機能する。trueだと全て買えてしまう。Bool型の型推論。isBuyable: bool
        //switch文
        switch type {
        case .coffee:
            isBuyable = coffeePrice < inputedYen && 0 < coffeeStock //＝の右辺が成立するとtureを返すBool型の仕様
            if isBuyable {
                inputedYen -= coffeePrice
            }
            
        case .water:
            isBuyable = waterPrice < inputedYen && 0 < waterStock
            if isBuyable {
                inputedYen -= waterPrice
            }
        case .monster:
            isBuyable = monsterPrince < inputedYen && 0 < monsterStock
            if isBuyable {
                inputedYen -= monsterPrince
            }
        }
        if isBuyable {             //if文。上記がtrueだった時に動く文
            reduceStock(type: type)//54行目の関数が動く。
                                   //reduceStock(引数名: 引数)　右辺typeは27行目の引数typeと同じ
        }
        return isBuyable  //23行目変数 isBuyable が関数 buyDrink に戻る
    }
    //購入したらストックが１減る処理　別の関数文
    func reduceStock(type: DrinkType) {//typeの右側は型名。まだ定義なのでDrinkTypeという型名。
        switch type {
        case .coffee:
            coffeeStock -= 1
        case .water:
            waterStock -= 1
        case .monster:
            monsterStock -= 1
        }
    }
}

let vendingMachine = VirtualVendingMachine()//クラスVirtualVendingMachineをインスタンス化
vendingMachine.inputedYen = 150 //150円を入れた時の挙動が見れる？左辺に代入

print("購入前のコーヒーの在庫は\(vendingMachine.coffeeStock)個です。")
//VirtualVendingMachineインスタンス化したvendingMachineとbuyDrinkでprintで出力
let isBuyable = vendingMachine.buyDrink(type: .coffee)//何を購入するかここに記入すると購入処理が確認できる仕組み
print(isBuyable)
print("残高は\(vendingMachine.inputedYen)円です。")
print("購入後のコーヒーの在庫は\(vendingMachine.coffeeStock)個です。")
