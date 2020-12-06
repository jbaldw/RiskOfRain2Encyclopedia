//
//  ItemDescriptionViewController.swift
//  Risk of Rain 2 Encyclopedia
//
//  Created by user180257 on 12/5/20.
//

import UIKit

class ItemDescriptionViewController: UIViewController {

    @IBOutlet var itemImage: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    
    var currentItem: UIImage? = nil
    var backgroundColor: UIColor? = nil
    var itemName = ""
    var itemDescription = ""
    var itemRarity = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = itemName
        
        itemImage.image = currentItem
        
        switch(itemRarity) {
            case "Common": backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            case "Uncommon": backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            case "Legendary": backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            case "Boss": backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
            case "Lunar": backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            default: backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        }

        itemImage.backgroundColor = self.backgroundColor
        itemImage.layer.cornerRadius = 10
        
        descriptionLabel.text = itemDescription
        
        // Do any additional setup after loading the view.
    }
}
