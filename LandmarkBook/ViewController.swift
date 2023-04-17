//
//  ViewController.swift
//  LandmarkBook

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    
    var chosenName = ""
    var chosenImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        landmarkNames = [String]()
        landmarkNames.append("Abs")
        landmarkNames.append("Chest")
        landmarkNames.append("Back")
        landmarkNames.append("Arm")
        landmarkNames.append("Leg")
        
        landmarkImages = [UIImage]()
        landmarkImages.append(UIImage(named: "1")!)
        landmarkImages.append(UIImage(named: "2")!)
        landmarkImages.append(UIImage(named: "3")!)
        landmarkImages.append(UIImage(named: "4")!)
        landmarkImages.append(UIImage(named: "5")!)
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]
        //content.secondaryText = "Test"
        cell.contentConfiguration = content
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenImage = landmarkImages[indexPath.row]
        chosenName = landmarkNames[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedName = chosenName
            destinationVC.selectedImage = chosenImage
        }
    }
}

