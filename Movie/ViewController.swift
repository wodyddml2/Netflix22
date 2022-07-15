//
//  ViewController.swift
//  Movie
//
//  Created by J on 2022/07/04.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var preview1: UIImageView!
    @IBOutlet weak var preview2: UIImageView!
    @IBOutlet weak var preview3: UIImageView!
    
    @IBOutlet weak var randomMovieImage: UIImageView!
    
    // 뷰컨트롤러 생명주기
    // 사용자에게 화면이 보이기 직전에 명령을 수헹
    
    // . : Dot Syntax
    // option + command 방향키
    override func viewDidLoad() {
        super.viewDidLoad()
        // UIView에서 그려지는 것이 아니라 layer에서 그려진다. 그렇기 때문에 그려지는 부분에 관련된 프로퍼티들이 layer에 상당 부분 속해있다.
        // CG: Core Grapphics
        // CA: Core Animations
        // UIKit가 상위 프레임워크
        
        // borderWith : 레이어 테두리 너비
        // masksToBounds : 하위 레이어가 레이어의 경계에 맞게 잘릴지 여부를 나타내는 부울 (clipsToBounds와 같은 기능을 하나 불러오는 곳이 다르다.)
        // cgColor : SwiftUI 색상에서 인스턴스를 얻을 수 있다.
        // cornerRadius : 레이어의 배경색과 테두리를 둥근 모서리로 자르지만 이미지에 적용되지 않는다. 하지만 masksToBounds를 true로 설정하면 이미지에 적용.
        
        moviePreview(a: preview1)
        moviePreview(a: preview2)
        moviePreview(a: preview3)
        
    }
    @IBAction func randomMoviePressed(_ sender: UIButton) {
        // assets에서 원하는 이미지 파일 이름을 입력
        randomMovieImage.image = UIImage(named: "Net\(Int.random(in: 1...4))")
    }
    func moviePreview(a: UIImageView) {
        a.layer.borderWidth = 4
        a.layer.masksToBounds = true
        a.layer.borderColor = UIColor.gray.cgColor
        a.layer.cornerRadius = a.frame.height/2
    }
    @IBAction func unwindVC(jySegue: UIStoryboardSegue) {
        
    }
}

