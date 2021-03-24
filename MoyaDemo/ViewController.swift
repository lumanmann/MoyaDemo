//
//  ViewController.swift
//  MoyaDemo
//
//  Created by Goons on 2021-03-22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        APIService.shared.request(CatRouter.Facts()) { (result) in
//            print("done")
//            print(result)
//        }
        
        APIService.shared.request(CatRouter.Facts(), isMock: true) { (result) in
            print("done")
            print(result)
        }
        
        
    }


}

