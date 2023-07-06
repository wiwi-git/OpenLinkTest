//
//  AppDelegate.swift
//  OpenLinkTest
//
//  Created by apple on 2023/07/06.
//

import UIKit

class FakeSplashScreenVC: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  func performInitialLoading(completion: @escaping () -> Void) {
    
    let apiUrl = URL(string: "https://timeapi.io/api/Time/current/zone?timeZone=Europe/Amsterdam")
    
    guard let apiUrl else {
      completion()
      return
    }

    let session = URLSession.shared
    let task = session.dataTask(with: apiUrl) { (data, response, error) in
      self.responseHandler(data: data, response: response, error: error, completion: completion)
    }
    task.resume()
  }
  
  
  private func responseHandler(data: Data?, response: URLResponse?, error: Error?, completion: @escaping () -> Void) {
    if let error = error {
      print("Error: \(error)")
      completion()
      return
    }
    
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
      print("Error: Invalid response from the server")
      completion()
      return
    }
    
    guard let data else {
      completion()
      return
    }
    do {
      let json = try JSONSerialization.jsonObject(with: data, options: [])
      print("Response JSON: \(json)")
      completion()
    } catch {
      print("Error parsing JSON: \(error)")
    }
    
  }// responseHandler
  
}
