//
//  DetailViewController.swift
//  EggTimerSelf
//
//  Created by Ömer Faruk Kılıçaslan on 18.06.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var timerClass = Timer()
    var counter:Int!
    
    var selectedEggImageView: UIImageView = UIImageView()
    var selectedEggLabel: UILabel = UILabel()
    var eggTimeLabel :UILabel = UILabel()
    var eggSlider            = UISlider()
    
    //buttons
    
    var resetButton = UIButton()
    var pauseButton = UIButton()
    var continueButton = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        eggTimeLabel.text = "Timer : \(counter!)"
        timerClass = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        eggSlider.maximumValue = Float(counter)
        
        configureLabel()
        
        configureImageView()
        
        configureTimeLabel()
        
        configureSlider()
        
        configureResetButton()
        
        configurePauseButton()
        
        configureContinueButton()
        
        

        
    }
    
    @objc func timerCounter() {
        
        counter -= 1
        eggTimeLabel.text = "Timer : \(counter!)"
        eggSlider.value  = Float(counter)
            if counter == 0 {
                timerClass.invalidate()
                eggTimeLabel.text = "Time is OVER"
            
            
                let alert = callAlert(title1: "Warning", message1: "Time IS OVER")
                self.present(alert, animated: true, completion: nil)
            
                }
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
    

    func configureImageView() {

        view.addSubview(selectedEggImageView)
        selectedEggImageView.translatesAutoresizingMaskIntoConstraints = false
        selectedEggImageView.layer.masksToBounds = true
        selectedEggImageView.layer.cornerRadius = 30


        NSLayoutConstraint.activate([

            selectedEggImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            selectedEggImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            selectedEggImageView.widthAnchor.constraint(equalToConstant: 270),
            selectedEggImageView.heightAnchor.constraint(equalToConstant: 270)



        ])
        
    }
    
    
    func configureTimeLabel() {
        
        view.addSubview(eggTimeLabel)
        eggTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        eggTimeLabel.textAlignment = .center
        
        
        NSLayoutConstraint.activate([
        
            eggTimeLabel.topAnchor.constraint(equalTo: selectedEggImageView.bottomAnchor, constant: 30),
            eggTimeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        
        ])
        
    }
    
    
    func configureSlider() {
        
        view.addSubview(eggSlider)
        eggSlider.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            eggSlider.topAnchor.constraint(equalTo: eggTimeLabel.bottomAnchor, constant: 30),
            eggSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            eggSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
        
        ])
    }
    
    func configureAllButtons(button:UIButton) {
        button.clipsToBounds = true
        button.layer.cornerRadius = 25
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemYellow

    }
    
    func configureResetButton() {
        
        view.addSubview(resetButton)
        configureAllButtons(button: resetButton)
        resetButton.setTitle("◻️", for: .normal)
        resetButton.setTitleColor(.white, for: .normal)
        resetButton.addTarget(self, action: #selector(resetButtonPressed), for: .touchUpInside)

        NSLayoutConstraint.activate([
            resetButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
            resetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            resetButton.widthAnchor.constraint(equalToConstant: 50),
            resetButton.heightAnchor.constraint(equalToConstant: 50)

        ])
        
    }
    
    func configurePauseButton() {
        
        view.addSubview(pauseButton)
        configureAllButtons(button: pauseButton)
        pauseButton.setTitle("॥", for: .normal)
        pauseButton.setTitleColor(.white, for: .normal)
        pauseButton.addTarget(self, action: #selector(pauseButtonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            pauseButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
            pauseButton.leadingAnchor.constraint(equalTo: resetButton.trailingAnchor, constant: 20),
            pauseButton.widthAnchor.constraint(equalToConstant: 50),
            pauseButton.heightAnchor.constraint(equalToConstant: 50)
        
        
        ])
    }
    
    func configureContinueButton() {
        view.addSubview(continueButton)
        configureAllButtons(button: continueButton)
        continueButton.setTitle("▶", for: .normal)
        continueButton.addTarget(self, action: #selector(continueButtonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
            continueButton.leadingAnchor.constraint(equalTo: pauseButton.trailingAnchor, constant: 20),
            continueButton.widthAnchor.constraint(equalToConstant: 50),
            continueButton.heightAnchor.constraint(equalToConstant: 50)
        
        
        ])
    }
    
    
    @objc func resetButtonPressed() {
        counter = 0
        eggTimeLabel.text = String(counter)
        timerClass.invalidate()
        eggSlider.value = 0
        let alert = callAlert(title1: "Warning", message1: "Time is Over")
        present(alert, animated: true) {
            DispatchQueue.main.async {
                let homeVC = HomeViewController()
                self.navigationController?.pushViewController(homeVC, animated: true)
            }
            
        }
    }
    
    @objc func continueButtonPressed(){
                
        timerClass = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerApp), userInfo: nil, repeats: true)
        
    }
    
    @objc func pauseButtonPressed() {
        timerClass.invalidate()
    }
    
    @objc func timerApp() {
        eggTimeLabel.text = "Timer : \(counter!)"
        if counter >= 1 {
            eggSlider.value = Float(counter)
            counter -= 1
        }
        else {
            let alert = callAlert(title1: "Warning", message1: "Time is Over")
            present(alert, animated: true, completion: nil)
        }
       
    }

   

}

extension DetailViewController {
    
    func callAlert(title1: String, message1: String) -> UIAlertController {
        let alert = UIAlertController(title: title1, message: message1, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
        alert.addAction(okAction)
        
            
            
            return alert
            
        }

}
