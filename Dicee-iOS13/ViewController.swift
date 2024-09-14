//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView = UIImageView()
    let logoImageView = UIImageView()
    let diceOneImageView = UIImageView()
    let diceTwoImageView = UIImageView()
    let rollButton = UIButton()
    
    let images = ["DiceOne", "DiceTwo", "DiceThree", "DiceFour", "DiceFive", "DiceSix"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupView()
    }
    
    private func setupView() {
        //ImageView
        imageView.image = UIImage(named: "GreenBackground")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        //Logo
        logoImageView.image = UIImage(named: "DiceeLogo")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoImageView)
        
        //Dice 1
        diceOneImageView.image = UIImage(named: "DiceOne")
        diceOneImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(diceOneImageView)
        
        //Dice 2
        diceTwoImageView.image = UIImage(named: "DiceTwo")
        diceTwoImageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.addSubview(diceTwoImageView)
        
        //Button
        rollButton.setTitle("Roll", for: .normal)
        rollButton.setTitleColor(.white, for: .normal)
        rollButton.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        rollButton.layer.cornerRadius = 12
        rollButton.backgroundColor = hexStringToUIColor(hex: "#A02334")
        rollButton.addTarget(self, action: #selector(rollButtonPressed), for: .touchUpInside)
        rollButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rollButton)
        
        NSLayoutConstraint.activate([
            //ImageView
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            //Logo
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 120),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            
            //Dice 1
            diceOneImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            diceOneImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            diceOneImageView.heightAnchor.constraint(equalToConstant: 120),
            diceOneImageView.widthAnchor.constraint(equalToConstant: 120),
            
            //Dice 2
            diceTwoImageView.topAnchor.constraint(equalTo: diceOneImageView.topAnchor),
            diceTwoImageView.leadingAnchor.constraint(equalTo: diceOneImageView.trailingAnchor, constant: 40),
            diceTwoImageView.heightAnchor.constraint(equalToConstant: 120),
            diceTwoImageView.widthAnchor.constraint(equalToConstant: 120),
            
            //Button
            rollButton.topAnchor.constraint(equalTo: diceOneImageView.bottomAnchor, constant: 50),
            rollButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rollButton.heightAnchor.constraint(equalToConstant: 60),
            rollButton.widthAnchor.constraint(equalToConstant: 80),
        ])
    }
    
    @objc func rollButtonPressed() {
        guard let randomImageName1 = images.randomElement() else { return }
        guard let randomImageName2 = images.randomElement() else { return }
        diceOneImageView.image = UIImage(named: randomImageName1)
        diceTwoImageView.image = UIImage(named: randomImageName2)
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}

