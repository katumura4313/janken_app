//
//  ViewController.swift
//  janken_app
//
//  Created by USER on 2020/03/10.
//  Copyright © 2020 jp.go. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //メンバ変数はクラス内で定義される変数です。
    
    @IBOutlet weak var JankenImage: UIImageView!
    @IBOutlet weak var jankenResult: UILabel!
    
    var jankenGu = 0
    var jankenChoki = 1
    var jankenPa = 2
    var enemyHand = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //ボタンの関連付け
        //写真の関連付け
        //ボタンを押すと画像がランダムで変更される
        //ランダムな数字を生成する
        //各パターンの条件文をif文で書く
        //画像が変わる
        
        //textを関連付ける
        //ボタンが押された時に相手が何をだしたかを保存する
        //条件文を書く
        //テキストが変化する
        //ローカル変数は関数内で定義した変数です。
        enemyHand = Int.random(in: 0..<3)
        
        //"0"はグー
        //"1"はチョキ
        //"2"はパー

    }
    
    func jankenRandom () {
        enemyHand = Int.random(in: 0..<3)
        
        //"0"はグー
        //"1"はチョキ
        //"2"はパー
        if enemyHand == jankenGu {
            JankenImage.image = UIImage(named:"janken_gu")
        }
        else if enemyHand == jankenChoki {
            JankenImage.image = UIImage(named:"janken_choki")
        }
        else if enemyHand == jankenPa {
            JankenImage.image = UIImage(named:"janken_pa")
        }
    }
    
    @IBAction func jankenPa(_ sender: Any) {
        
       jankenRandom()
        
        if enemyHand == jankenPa {
            jankenResult.text = "あいこ"
        }
        else if enemyHand == jankenGu {
            jankenResult.text = "勝ち！"
        }
        else if enemyHand == jankenChoki{
            jankenResult.text = "負け！"
        }
        
    }
    
    @IBAction func jankenChoki(_ sender: Any) {
        
        jankenRandom()
        
        if enemyHand == jankenChoki {
            jankenResult.text = "あいこ"
        }
        else if enemyHand == jankenPa {
            jankenResult.text = "勝ち！"
        }
        else if enemyHand == jankenGu {
            jankenResult.text = "負け！"
            
        }
        
    }
    
    @IBAction func jankenGu(_ sender: Any) {
        
       jankenRandom()
        
        if enemyHand == jankenGu {
            jankenResult.text = "あいこ"
        }
        else if enemyHand == jankenChoki {
            jankenResult.text = "勝ち！"
        }
        else if enemyHand == jankenPa {
            jankenResult.text = "負け！"
        }
        
    }
    
}
