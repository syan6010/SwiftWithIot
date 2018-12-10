//
//  beginViewController.swift
//  rasp
//
//  Created by benny on 10/10/30 H.
//  Copyright © 30 Heisei benny. All rights reserved.
//

import UIKit

class beginViewController: UIViewController {
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var valuechange: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func valueChange(_ sender: UIPageControl) {
        switch valuechange.currentPage {
        case 1:
            titleLable.text = "更快速的效能"
        case 2:
            titleLable.text = "立即開始使用autopet"
        default:
            titleLable.text = "更簡單的使用方式！"
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
