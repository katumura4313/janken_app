//
//  JankenResultViewController.swift
//  janken_app
//
//  Created by USER on 2020/04/14.
//  Copyright © 2020 jp.go. All rights reserved.
//

import UIKit

class JankenResultViewController: UIViewController {
    @IBOutlet weak var resultImage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func resultButton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)

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
