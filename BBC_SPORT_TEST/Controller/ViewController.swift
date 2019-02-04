//
//  ViewController.swift
//  BBC_SPORT_TEST
//
//  Created by Nathan Tugwell on 18/01/2019.
//  Copyright © 2019 nathantugwell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    let url = "https://bbc.github.io/sport-app-dev-tech-challenge/data.json"
    
    var metaData: MetaData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getJSONData()
    }
    
    func getJSONData() {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                self.metaData = try decoder.decode(MetaData.self, from: data)
                
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
                
            } catch let error {
                print("failed", error)
            }
            
            }.resume()
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return metaData?.data.items.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        if let sportTitle = metaData?.data.items[indexPath.row] {
            cell.titleLabel.text = sportTitle.title
            cell.lastUpdated.text = sportTitle.lastUpdatedText
            
            DispatchQueue.global(qos: .background).async {
                do {
                    let data = try Data.init(contentsOf: URL.init(string: sportTitle.image.medium)!)
                    DispatchQueue.main.async {
                        let image = UIImage(data: data)
                        cell.f1Image.image = image
                    }
                }
                catch {
                    print(error.localizedDescription)
                }
            }
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return metaData?.data.topic.title
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
