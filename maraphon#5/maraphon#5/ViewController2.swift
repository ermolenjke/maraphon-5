//
//  ViewController2.swift
//  maraphon#5
//
//  Created by Даниил Ермоленко on 14.05.2023.
//

import UIKit

class ViewController2: UIViewController {
    
    let segmentItems = ["280pt", "150pt"]
    let closeButton = UIButton()
    var segmentedControl = UISegmentedControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(self.view.frame)
        
        view.backgroundColor = .white
        setupCloseButton()
        setupSegmentedControl()
    }
    
    func  setupCloseButton() {
        view.addSubview(closeButton)
        
        closeButton.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        closeButton.tintColor = .gray
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.addTarget(self, action: #selector(сloseButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
    }
    
    func  setupSegmentedControl() {
        self.segmentedControl = UISegmentedControl(items: segmentItems)
        
        view.addSubview(segmentedControl)

        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlTapped), for: UIControl.Event.valueChanged)
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc func сloseButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc func segmentedControlTapped() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            self.preferredContentSize = CGSize(width: 300, height: 280)
        case 1:
            self.preferredContentSize = CGSize(width: 300, height: 150)
        default:
            print("default")
        }
    }
}

