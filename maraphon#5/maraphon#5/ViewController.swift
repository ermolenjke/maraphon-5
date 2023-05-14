//
//  ViewController.swift
//  maraphon#5
//
//  Created by Даниил Ермоленко on 14.05.2023.
//

import UIKit

class ViewController: UIViewController {

    lazy var presentButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupPresentButton()
    }

    func setupPresentButton() {
        view.addSubview(presentButton)
        
        presentButton.setTitle("Present", for: .normal)
        presentButton.setTitleColor(.systemMint, for: .normal)
        presentButton.translatesAutoresizingMaskIntoConstraints = false
        presentButton.addTarget(self, action: #selector(presentButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            presentButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentButton.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
    
    @objc func presentButtonTapped() {
        let popoverContent = ViewController2()
        popoverContent.modalPresentationStyle = .popover
        popoverContent.preferredContentSize = CGSize(width: 300, height: 280)
        
        guard let presentationVC = popoverContent.popoverPresentationController else { return }
        presentationVC.delegate = self
        
        presentationVC.sourceView = presentButton
        presentationVC.permittedArrowDirections = .up
        presentationVC.sourceRect = CGRect(x: presentButton.bounds.midX,
                                           y: presentButton.bounds.midY + 15,
                                           width: 0,
                                           height: 0)
        present(popoverContent, animated: true)
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    
     func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        .none
    }
}

