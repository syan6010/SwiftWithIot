//
//  StartViewController.swift
//  rasp
//
//  Created by benny on 10/1/30 H.
//  Copyright © 30 Heisei benny. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class StartViewController: UIViewController {
    var ref: DatabaseReference!
    
    @IBOutlet weak var Lab1: UILabel!
    @IBOutlet weak var redBtn: UIButton!
    @IBOutlet weak var greenBtn: UIButton!
    @IBOutlet weak var blueBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getOnNet()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnAction(_ sender: UIButton) {
        sender.isSelected = sender.isSelected ? false : true
        
        switch sender.tag {
        case 100:
            ref.child("led/led17/on").setValue(sender.isSelected ? true : false)
        case 200:
            ref.child("led/led22/on").setValue(sender.isSelected ? true : false)
        case 300:
            ref.child("led/led27/on").setValue(sender.isSelected ? true : false)
        default:
            break
        }
    }
    
    func getOnNet() {
        
        ref = Database.database().reference()
        // 從 Firebase 取得資料庫資料。
        
        // 進入該資料並指定位置 "led"。
        // 官方 observe 方法去監測指定位置底下的數據變化 。
        ref.child("led").observe(.value, with: {
            (snapshot) in
            // 並設定 snapshot 為閉包回傳的資料。
            
            let value = snapshot.value as? [String:AnyObject]
            // 從 snapshot 的 value 取得的就是我們在資料庫的資料，
            // 並指定它的型別就是 [String:AnyObject]。
            
            let led17State = value?["led17"]?["on"] as! Bool
            let led22State = value?["led22"]?["on"] as! Bool
            let led27State = value?["led27"]?["on"] as! Bool
            // 宣告三個常數，讓它們解析從資料庫取得下來的資料，
            // 分別解析 led 資料底下的 led17, led22, led27，
            // 再從中取得 on 的狀態，
            // 並轉換指定型別為布林。
            
            self.redBtn.isSelected = led17State
            self.greenBtn.isSelected = led22State
            self.blueBtn.isSelected = led27State
            
            
        
            // 最後就是設定每一顆 iOS 上的按鈕的狀態等於從網路上取得的狀態。
        })
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
