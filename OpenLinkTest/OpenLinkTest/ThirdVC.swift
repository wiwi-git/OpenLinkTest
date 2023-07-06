//
//  ThirdVC.swift
//  OpenLinkTest
//
//  Created by apple on 2023/07/06.
//

import UIKit

class ThirdVC: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setup()
  }
  
  private func setup() {
    self.view.backgroundColor = .red
    let label: UILabel = .init()
    label.text = .init(describing: self)
    label.textColor = .white
    label.font = .systemFont(ofSize: 50, weight: .bold)
    
    self.view.addSubview(label)
    label.translatesAutoresizingMaskIntoConstraints = false
    
    [
      label.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
      label.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor)
    ].forEach {
      $0.isActive = true
    }
    
  }
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
