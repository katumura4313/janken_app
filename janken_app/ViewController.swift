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
    
    @IBOutlet weak var jankenGuImage: UIButton!
    @IBOutlet weak var jankenChokiImage: UIButton!
    @IBOutlet weak var jankenPaImage: UIButton!
    @IBOutlet weak var roundNumber: UILabel!
    @IBOutlet weak var winCount: UILabel!
    @IBOutlet weak var loseCount: UILabel!
    
    
    var jankenGu = 0
    var jankenChoki = 1
    var jankenPa = 2
    var enemyHand = 0
    let maruImage = UIImageView(image:UIImage.init(named: "mark_maru"))
    let batuImage = UIImageView(image:UIImage.init(named: "mark_batsu"))
    var jankenRound = 1
    var winNumber = 0
    var loseNumber = 0
    var resultImage:UIImage = UIImage(named: "pose_win_boy")!
    
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
    
    func displayMaruImage(position: CGPoint) {
        maruImage.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        maruImage.center = position
        hideMark()
        maruImage.isHidden = false
        view.addSubview(maruImage)
    }
    
    func displayBatsuImage(position: CGPoint){
        batuImage.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        batuImage.center = position
        hideMark()
        batuImage.isHidden = false
        view.addSubview(batuImage)
    }
    //あいこ時にマークを非表示にする
    
    //maruの画像を非表示にする
    //batuの画像を非表示にする
    func hideMark(){
        maruImage.isHidden = true
        batuImage.isHidden = true
    }
    
    func addRoundCount(){
        jankenRound += 1
        roundNumber.text = "ラウンド" + String(jankenRound)
        
        //ラウンド終了
        if jankenRound > 5 {
            if  winNumber > loseNumber {
                resultImage = UIImage(named: "pose_win_boy")!
            }
            else if loseNumber > winNumber {
                resultImage = UIImage(named: "pose_lose_boy")!
            }
            
            //勝ちと負けのカウントをリセットする
            winNumber = 0
            winCount.text = "勝ち" + String(winNumber)
            loseNumber = 0
            loseCount.text = "負け:" + String(loseNumber)
            jankenRound = 0
            
            roundNumber.text = "終了"
            showJankenResult()
        }
    }
    
    func addWincount(){
        winNumber += 1
        winCount.text = "勝ち:" + String(winNumber)
    }
    
    func addloseCount(){
        loseNumber += 1
        loseCount.text = "負け:" + String(loseNumber)
    }
    
    func showJankenResult(){
        let storyboard: UIStoryboard = self.storyboard!
        let resultVC = storyboard.instantiateViewController(withIdentifier: "JankenResultViewController") as! JankenResultViewController
         //強制的にviewを読み込ませる
        resultVC.loadViewIfNeeded()
        resultVC.resultImage.setImage(resultImage, for: .normal)
        
        // modalPresentationStyleを指定する
        resultVC.modalPresentationStyle = .fullScreen
        resultVC.modalTransitionStyle = .flipHorizontal
        self.present(resultVC, animated: true, completion: nil)
        
    }
    
    @IBAction func jankenPa(_ sender: Any) {
        
        jankenRandom()
        
        if enemyHand == jankenPa {
            jankenResult.text = "あいこ"
            hideMark()
            
        }
        else if enemyHand == jankenGu {
            jankenResult.text = "勝ち！"
            addWincount()
            addRoundCount()
           
            displayMaruImage(position: jankenPaImage.center)
        }
        else if enemyHand == jankenChoki{
            jankenResult.text = "負け！"
            addWincount()
            addRoundCount()
            displayBatsuImage(position: jankenPaImage.center)
            
        }
        
    }
    
    @IBAction func jankenChoki(_ sender: Any) {
        
        jankenRandom()
        
        if enemyHand == jankenChoki {
            jankenResult.text = "あいこ"
            hideMark()
            
        }
        else if enemyHand == jankenPa {
            jankenResult.text = "勝ち！"
            addWincount()
            addRoundCount()
            displayMaruImage(position: jankenChokiImage.center)
           
        }
        else if enemyHand == jankenGu {
            jankenResult.text = "負け！"
             addloseCount()
            addRoundCount()
            displayBatsuImage(position: jankenChokiImage.center)
           
            
        }
        
    }
    
    @IBAction func jankenGu(_ sender: Any) {
        
        jankenRandom()
        
        if enemyHand == jankenGu {
            jankenResult.text = "あいこ"
            hideMark()
            
        }
        else if enemyHand == jankenChoki {
            jankenResult.text = "勝ち！"
            addWincount()
            addRoundCount()
            
            displayMaruImage(position: jankenGuImage.center)
            
        }
        else if enemyHand == jankenPa {
            jankenResult.text = "負け！"
             addloseCount()
            addRoundCount()
            displayBatsuImage(position: jankenGuImage.center)
           
        }
        
    }
    
}
