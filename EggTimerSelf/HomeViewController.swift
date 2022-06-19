//
//  ViewController.swift
//  EggTimerSelf
//
//  Created by Ömer Faruk Kılıçaslan on 18.06.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    var eggOneImageView = UIImageView()
    var eggTwoImageView = UIImageView()
    var eggThreeImageView = UIImageView()
    var eggFourImageView = UIImageView()
    var headerLabel = UILabel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureFirstImageView()
        configureSecondImageView()
        configureThirdImageView()
        configureFourthImageView()
        configureHeaderLabel()
        
        view.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    
    func configureHeaderLabel() {
        view.addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.textColor = .label
        headerLabel.font = UIFont(name: headerLabel.font.fontName, size: 30)
        headerLabel.text = "How Do You Like Your Egg?"
        
        
        
        NSLayoutConstraint.activate([
        
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 65),
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerLabel.heightAnchor.constraint(equalToConstant: 40)
        
        
        ])
        
    }
    
    func configureFirstImageView(){
        view.addSubview(eggOneImageView)
        eggOneImageView.translatesAutoresizingMaskIntoConstraints = false
        eggOneImageView.image = UIImage(named: "egg-1")
        
        
        NSLayoutConstraint.activate([
        
            eggOneImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            eggOneImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            eggOneImageView.widthAnchor.constraint(equalToConstant: 130),
            eggOneImageView.heightAnchor.constraint(equalToConstant: 130)

        ])
        
        configureImageViews(imageView: eggOneImageView)
        
    }
    
    func configureSecondImageView(){
        view.addSubview(eggTwoImageView)
        eggTwoImageView.translatesAutoresizingMaskIntoConstraints = false
        eggTwoImageView.image = UIImage(named: "egg-2")
        
        
        NSLayoutConstraint.activate([
        
            eggTwoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            eggTwoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            eggTwoImageView.widthAnchor.constraint(equalToConstant: 130),
            eggTwoImageView.heightAnchor.constraint(equalToConstant: 130)
        ])
        
        configureImageViews(imageView: eggTwoImageView)
    }
    
    func configureThirdImageView(){
        view.addSubview(eggThreeImageView)
        eggThreeImageView.translatesAutoresizingMaskIntoConstraints = false
        eggThreeImageView.image = UIImage(named: "egg-3")
        
        
        NSLayoutConstraint.activate([
        
            eggThreeImageView.topAnchor.constraint(equalTo: eggOneImageView.bottomAnchor, constant: 10),
            eggThreeImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            eggThreeImageView.widthAnchor.constraint(equalToConstant: 130),
            eggThreeImageView.heightAnchor.constraint(equalToConstant: 130)
        ])
        
        configureImageViews(imageView: eggThreeImageView)
    }
    
    func configureFourthImageView(){
        view.addSubview(eggFourImageView)
        eggFourImageView.translatesAutoresizingMaskIntoConstraints = false
        eggFourImageView.image = UIImage(named: "egg-4")
        
        
        NSLayoutConstraint.activate([
        
            eggFourImageView.topAnchor.constraint(equalTo: eggTwoImageView.bottomAnchor, constant: 10),
            eggFourImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            eggFourImageView.widthAnchor.constraint(equalToConstant: 130),
            eggFourImageView.heightAnchor.constraint(equalToConstant: 130)
        
        ])
        
        configureImageViews(imageView: eggFourImageView)
    }
    
    func configureImageViews(imageView: UIImageView) {
        imageView.isUserInteractionEnabled = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 30
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            imageView.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImageView = tapGestureRecognizer.view as! UIImageView
        let tappedEggStyle:String
        
        let detailVC = DetailViewController()
        
        switch tappedImageView {
            
        case eggOneImageView:
            tappedEggStyle = "Easy"
            detailVC.selectedEggLabel.text = Eggs.eggType(type: .easy)[0]
            detailVC.selectedEggImageView = UIImageView(image: UIImage(named: "egg-1"))
            detailVC.counter = Eggs.cooking(style: .easy)
            break
            
        case eggTwoImageView:
            tappedEggStyle = "Medium"
            detailVC.selectedEggLabel.text = Eggs.eggType(type: .medium)[0]
            detailVC.selectedEggImageView = UIImageView(image: UIImage(named: Eggs.eggType(type: .medium)[1]))
            detailVC.counter = Eggs.cooking(style: .medium)
            break
            
        case eggThreeImageView:
            tappedEggStyle = "Hard"
            detailVC.selectedEggLabel.text = Eggs.eggType(type: .hard)[0]
            detailVC.selectedEggImageView = UIImageView(image: UIImage(named: Eggs.eggType(type: .hard)[1]))
            detailVC.counter = Eggs.cooking(style: .hard)
            break
            
        case eggFourImageView:
            tappedEggStyle = "SoHard"
            detailVC.selectedEggLabel.text = Eggs.eggType(type: .soHard)[0]
            detailVC.selectedEggImageView = UIImageView(image: UIImage(named: Eggs.eggType(type: .soHard)[1]))
            detailVC.counter = Eggs.cooking(style: .soHard)
            
        default:
            tappedEggStyle = ""
            break
            
        }

        
        navigationController?.pushViewController(detailVC, animated: true)
    }


}

