//
//  GoalViewController.swift
//  tiny
//
//  Created by Carlos Cardona on 16/02/21.
//

import UIKit

class GoalViewController: UIViewController {
    
    let alcanzadoLabel: UILabel = {
        let label = UILabel()
        label.text = "51% Alcanzado. $102,000 / $200,000"
        label.textAlignment = .left
        label.font = label.font.withSize(15)
        return label
    }()
    
    let objetivoLabel: UILabel = {
        let label = UILabel()
        label.text = "Tu Objetivo:"
        label.textAlignment = .left
        label.font = label.font.withSize(40)
        return label
    }()
    
    let progressView: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.trackTintColor = .secondarySystemBackground
        progress.progressTintColor = #colorLiteral(red: 0.5190889239, green: 0.3699746728, blue: 0.7604205012, alpha: 1)
        progress.setProgress(0.51, animated: true)
        let pro = Progress(totalUnitCount: 100000)
        progress.observedProgress = pro
        return progress
    }()
    
    let emojiLabel: UILabel = {
        let label = UILabel()
        label.text = "🥳"
        label.textAlignment = .center
        label.font = label.font.withSize(80)
        return label
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.text =
            """
            ¡Felicidades!
            
            Formas parte del 2% de personas que se preocupan por el bienestar de su futuro
            """
        label.font = UIFont(name: "Menlo", size: 13)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        objetivoLabel.frame = CGRect(x: 10, y: view.safeAreaInsets.top + 85, width: view.width - 20, height: 56)
        
        alcanzadoLabel.frame = CGRect(x: 10, y: objetivoLabel.bottom + 35, width: view.width - 20, height: 20)
        
        progressView.frame = CGRect(x: 10, y: alcanzadoLabel.bottom + 7, width: view.width - 20, height: 10)
        
        emojiLabel.frame = CGRect(x: 10, y: progressView.bottom + 40, width: view.width - 20, height: 105)
        
        messageLabel.frame = CGRect(x: 10, y: emojiLabel.bottom + 10, width: view.width - 20, height: 69)
    }
    
    func addSubviews() {
        view.addSubview(objetivoLabel)
        view.addSubview(alcanzadoLabel)
        view.addSubview(progressView)
        view.addSubview(emojiLabel)
        view.addSubview(messageLabel)
    }
}
