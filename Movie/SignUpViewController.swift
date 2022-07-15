//
//  SignUpViewController.swift
//  Movie
//
//  Created by J on 2022/07/06.
//

import UIKit

class SignUpViewController: UIViewController {
   
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var nickNameText: UITextField!
    @IBOutlet weak var locationText: UITextField!
    @IBOutlet weak var recommendationText: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var switchBtn: UISwitch!
    
    @IBOutlet weak var titleLabel: UILabel!
   
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        view.backgroundColor = UIColor.black
        
        titleUI()
        
        textFeilds(name: emailText, holder: "이메일 주소 또는 전화번호", key: .default)
        textFeilds(name: passwordText, holder: "비밀번호", key: .default)
        passwordText.isSecureTextEntry = true
        textFeilds(name: nickNameText, holder: "닉네임", key: .default)
        textFeilds(name: locationText, holder: "위치", key: .default)
        textFeilds(name: recommendationText, holder: "추천 코드 입력", key: .numberPad)
        
        signBtn()
        
        switchBtn.onTintColor = UIColor(named: "NetColor")
        backButtonStyle()
       
    }
    
    func backButtonStyle() {
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(UIColor(named: "NetColor"), for: .normal)
        backButton.layer.masksToBounds = true
        backButton.layer.cornerRadius = 5
    }
    
  
    func titleUI() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.text = "JAEFLIX"
        titleLabel.textColor = UIColor(named: "NetColor")
        titleLabel.textAlignment = NSTextAlignment.center
    }
    
    func textFeilds(name: UITextField, holder: String, key: UIKeyboardType) {
        name.backgroundColor = UIColor(named: "TextFeildColor")
        // foregroundColor -> 뷰에 표시되는 전경 색을 바꾼다.
        name.attributedPlaceholder = NSAttributedString(string: holder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        name.textAlignment = .center
        name.clearButtonMode = .whileEditing
        name.keyboardType = key
       
    }

    func signBtn() {
        signUpButton.backgroundColor = UIColor.white
        signUpButton.setTitle("회원가입", for: .normal)
        signUpButton.setTitleColor(.black, for: .normal)
        signUpButton.titleLabel?.font = .boldSystemFont(ofSize: 7)
        signUpButton.layer.cornerRadius = 5
    }
    
    func alertStyle(_ a:String) -> UIAlertController {
        let alert = UIAlertController.init(title: a, message: nil, preferredStyle: .alert)
        
        let ok = UIAlertAction.init(title: "확인", style: .default, handler: nil)
        let cancle = UIAlertAction.init(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancle)
        return alert
    }
    
  
    
    @IBAction func signUpBtn(_ sender: UIButton) {
        view.endEditing(true)
   
        if emailText.text?.isEmpty ?? true || passwordText.text?.isEmpty ?? true {
            
            if emailText.text?.isEmpty ?? true{
                emailText.placeholder = "이메일 주소를 입력해주세요."
                
                
            } else {
                emailText.placeholder = "이메일 주소 또는 전화번호"
            }
            
            if passwordText.text?.isEmpty ?? true{
                passwordText.placeholder = "비밀번호를 입력해주세요."
                
            } else {
                passwordText.placeholder = "비밀번호"
            }
        }
        
        
        if passwordText.text?.count ?? 0 < 6{
            passwordText.text = ""
            present(alertStyle("최소 6자리 입력 부탁드립니다."), animated: true)
        }
        
     
        if ((Int(recommendationText.text ?? "")) == nil) {
                recommendationText.text = ""
            }

    }
    
    @IBAction func gestureTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
        
    }

    @IBAction func darkMode(_ sender: UISwitch) {
        if sender.isOn {
            overrideUserInterfaceStyle = .dark
            view.backgroundColor = UIColor.black
        } else {
            overrideUserInterfaceStyle = .light
            view.backgroundColor = UIColor.white
        }
    }
    
    
    
    
}
