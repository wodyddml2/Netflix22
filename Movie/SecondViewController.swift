//
//  SubViewController.swift
//  Movie
//
//  Created by J on 2022/07/05.
//

import UIKit

class SecondViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieLabel: UILabel!

    @IBOutlet weak var movieBackground: UIView!
    
    @IBOutlet weak var textf: UITextField!
    
    @IBOutlet weak var texth: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        textf.delegate = self
        backgroundImage.image = UIImage(named: "background")
        // 타입 추론으로 생략  -> UIView.ContentMode
        backgroundImage.contentMode = .scaleToFill
        
        movieImage.image = UIImage(named: "movie1")
        movieImage.layer.borderWidth = 3
        movieImage.layer.borderColor = UIColor.lightGray.cgColor
        movieImage.layer.masksToBounds = true
        movieImage.layer.cornerRadius = movieImage.frame.height/2
        movieLabel.text = "명량"
        movieLabel.textAlignment = NSTextAlignment.center
        movieLabel.font = UIFont.boldSystemFont(ofSize: 12)
    }
  
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textf.resignFirstResponder()
            return true
        }
    
}
