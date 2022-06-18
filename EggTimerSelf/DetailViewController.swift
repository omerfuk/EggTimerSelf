//
//  DetailViewController.swift
//  EggTimerSelf
//
//  Created by Ömer Faruk Kılıçaslan on 18.06.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedEggImageView: UIImageView = UIImageView()
    var selectedEggLabel: UILabel = UILabel()
    var eggTime :UILabel = UILabel()
    var eggSlider            = UISlider()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureLabel()
//        configureImageView()


        
    }

    
    func configureLabel() {
        
        view.addSubview(selectedEggLabel)
        selectedEggLabel.translatesAutoresizingMaskIntoConstraints = false
        selectedEggLabel.textColor = .label
        selectedEggLabel.font = UIFont(name: selectedEggLabel.font.fontName, size: 30)
        
        NSLayoutConstraint.activate([
        
            selectedEggLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 65),
            selectedEggLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            selectedEggLabel.heightAnchor.constraint(equalToConstant: 40)
        
        
        ])
        
        
    
        
    }
    
//
//    func configureImageView() {
//
//        view.addSubview(selectedEggImageView)
//        selectedEggImageView.translatesAutoresizingMaskIntoConstraints = false
//        selectedEggImageView.layer.masksToBounds = true
//        selectedEggImageView.layer.cornerRadius = 30
//
//
//        NSLayoutConstraint.activate([
//
//            selectedEggImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
//            selectedEggImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
//            selectedEggImageView.widthAnchor.constraint(equalToConstant: 270),
//            selectedEggImageView.heightAnchor.constraint(equalToConstant: 270)
//
//
//
//        ])
        
        
        
//    }
    
    
    func configureSlider() {
        
        // will be filled
    }
    

   

}
