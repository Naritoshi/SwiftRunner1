//
//  ViewController.swift
//  SwiftRunner1
//
//  Created by matsuo on 2017/07/23.
//  Copyright © 2017年 matsuo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var countLabel: UILabel!

    @IBOutlet var runnerImageView: UIImageView!

    var imageArray = [UIImage]()
    
    // 経過時間
    var timer1 = Timer()
    // 画像を配列から出すスピード
    var timer2 = Timer()
    
    // 経過時間カウンター
    var countUp = 0
    
    //
    var updateViewCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let IMG_0 = UIImage(named: "dash0.png")
        let IMG_1 = UIImage(named: "dash1.png")
        let IMG_2 = UIImage(named: "dash2.png")
        let IMG_3 = UIImage(named: "dash3.png")
        let IMG_4 = UIImage(named: "dash4.png")
        let IMG_5 = UIImage(named: "dash5.png")
        
        imageArray = [IMG_0!,IMG_1!,IMG_2!,IMG_3!, IMG_4!, IMG_5!]
    }

    
    
    @IBAction func start(_ sender: Any) {
        //経過時間を初期化する
        countUp = 0
        
        //タイマーを開始する
        timer1 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(keikajikan), userInfo: nil, repeats: true)
        
        timer2 = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateImage), userInfo: nil, repeats: true)
    }
    
    //タイマー用関数
    func keikajikan(){
        countUp += 1
        countLabel.text = String(countUp)
    }
    
    func updateImage(){
        //配列の中から画像を取得しUIImageViewに設定する
        runnerImageView.image = imageArray[updateViewCount]
        if (updateViewCount == imageArray.count - 1)
        {
            updateViewCount = 0
        }else{
            updateViewCount += 1
        }
    }
    
    @IBAction func stop(_ sender: Any) {
        timer1.invalidate()
        timer2.invalidate()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

