//
//  ViewController.swift
//  LoadingCats
//
//  Created by Nastenka on 15.01.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func downloadButton(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CatViewController") as! CatViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
