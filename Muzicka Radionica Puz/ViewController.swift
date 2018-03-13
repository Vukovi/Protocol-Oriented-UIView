//
//  ViewController.swift
//  Muzicka Radionica Puz
//
//  Created by Vuk Knežević on 3/13/18.
//  Copyright © 2018 Vuk Knežević. All rights reserved.
//

import UIKit
import SnapKit

class BuzzableTextField: UITextField, Buzzable {}
class BuzzableButton: UIButton, Buzzable {}
class BuzzableImageView: UIImageView, Buzzable {}
class BuzzablePoppableLabel: UILabel, Buzzable, Poppable {}

class ViewController: UIViewController {
    
    lazy var imageView: BuzzableImageView = {
        let image = BuzzableImageView()
        image.image = UIImage(named: "puzina")
        image.contentMode = .scaleAspectFit
        let imageHeight = image.frame.height/2
        image.layer.cornerRadius = imageHeight
        image.layer.masksToBounds = true
        return image
    }()
    
    let label: UILabel = {
        let lbl = UILabel()
        lbl.text = "Muzička Radionica Puž"
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "Helvetica Neue Bold Italic", size: 20)
        lbl.textColor = .black
        return lbl
    }()
    
    let textFld: BuzzableTextField = {
        let tf = BuzzableTextField()
        tf.placeholder = "Polaznik"
        return tf
    }()
    
    let popUpLabel: BuzzablePoppableLabel = {
       let lbl = BuzzablePoppableLabel()
        lbl.text = "Unesite ime polaznika"
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "Helvetica Neue Bold Italic", size: 12)
        lbl.textColor = .gray
        return lbl
    }()
    
    let button: BuzzableButton = {
        let btn = BuzzableButton()
        btn.backgroundColor = .blue
        btn.setTitle("Počnimoooo", for: .normal)
        btn.titleLabel?.textColor = .white
        btn.titleLabel?.textAlignment = .center
        btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setElements()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(gesture)
    }

    func setElements() {
        self.view.addSubview(imageView)
        self.view.addSubview(label)
        self.view.addSubview(textFld)
        self.view.addSubview(popUpLabel)
        self.view.addSubview(button)
        
        imageView.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(140)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(200)
        }
        
        label.snp.remakeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(50)
        }
        
        textFld.snp.remakeConstraints { (make) in
            make.top.equalTo(label.snp.bottom).offset(10)
            make.leading.equalTo(label.snp.leading)
            make.trailing.equalTo(label.snp.trailing)
            make.height.equalTo(15)
        }
        
        popUpLabel.snp.remakeConstraints { (make) in
            make.top.equalTo(textFld.snp.bottom).offset(10)
            make.leading.equalTo(label.snp.leading)
            make.trailing.equalTo(label.snp.trailing)
            make.height.equalTo(15)
        }
        
        button.snp.remakeConstraints { (make) in
            make.top.equalTo(popUpLabel.snp.bottom).offset(15)
            make.leading.equalTo(label.snp.leading)
            make.trailing.equalTo(label.snp.trailing)
            make.height.equalTo(50)
        }
        
    }
    
    @objc func btnAction() {
        textFld.buzz()
        button.buzz()
        popUpLabel.buzz()
        popUpLabel.pop()
        imageView.buzz()
        textFld.text = ""
    }

    @objc func tapped() {
        self.view.endEditing(true)
    }

}

