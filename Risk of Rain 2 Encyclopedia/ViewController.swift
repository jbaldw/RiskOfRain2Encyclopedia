//
//  ViewController.swift
//  Risk of Rain 2 Encyclopedia
//
//  Created by user180257 on 12/5/20.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {

    @IBOutlet var collectionView: UICollectionView!
    
    let items = ["Armor-Piercing Rounds", "Backup Magazine", "Bundle of Fireworks", "Bustling Fungus", "Cautious Slug", "Crowbar", "Energy Drink", "Focus Crystal", "Fresh Meat", "Gasoline", "Item Scrap, White", "Lens-Maker's Glasses", "Medkit", "Monster Tooth", "Paul's Goat Hoof", "Personal Shield Generator", "Repulsion Armor Plate", "Rusted Key", "Soldier's Syringe", "Sticky Bomb", "Stun Grenade", "Topaz Brooch", "Tougher Times", "Tri-Tip Dagger", "Warbanner", /* End of Common Items*/  "AtG Missile Mk. 1", "57 Leaf Clover", "Artifact Key", "Beads of Fealty", "Blast Shower", "Effigy of Grief"]
    
    let itemImages: [UIImage] = [
        UIImage(named: "Armor-Piercing_Rounds")!,
        UIImage(named: "Backup_Magazine")!,
        UIImage(named: "Bundle_of_Fireworks")!,
        UIImage(named: "Bustling_Fungus")!,
        UIImage(named: "Cautious_Slug")!,
        UIImage(named: "Crowbar")!,
        UIImage(named: "Energy_Drink")!,
        UIImage(named: "Focus_Crystal")!,
        UIImage(named: "Fresh_Meat")!,
        UIImage(named: "Gasoline")!,
        UIImage(named: "Item_Scrap_White")!,
        UIImage(named: "Lens-Makers_Glasses")!,
        UIImage(named: "Medkit")!,
        UIImage(named: "Monster_Tooth")!,
        UIImage(named: "Pauls_Goat_Hoof")!,
        UIImage(named: "Personal_Shield_Generator")!,
        UIImage(named: "Repulsion_Armor_Plate")!,
        UIImage(named: "Rusted_Key")!,
        UIImage(named: "Soldiers_Syringe")!,
        UIImage(named: "Sticky_Bomb")!,
        UIImage(named: "Stun_Grenade")!,
        UIImage(named: "Topaz_Brooch")!,
        UIImage(named: "Tougher_Times")!,
        UIImage(named: "Tri-Tip_Dagger")!,
        UIImage(named: "Warbanner")!, /* End of Common Items */
        UIImage(named: "AtG_Missile_Mk._1")!,
        UIImage(named: "57_Leaf_Clover")!,
        UIImage(named: "Artifact_Key")!,
        UIImage(named: "Beads_of_Fealty")!,
        UIImage(named: "Blast_Shower")!,
        UIImage(named: "Effigy_of_Grief")!
    ]
    
    let itemDescriptions = ["Deal an additional 20% damage (+20% per stack) to bosses.", "Add +1 (+1 per stack) charge of your Secondary skill.", "Activating an interactable launches 8 (+4 per stack) fireworks that deal 300% base damage.", "After standing still for 2 seconds, create a zone that heals for 4.5% (+2.25% per stack) of your health every second to all allies within 3m (+1.5m per stack).", "Increases base health regeneration by +3hp/s (+3 hp/s per stack) while outside of combat.", "Deal 150% (+50% per stack) damage to enemies above 90% health.", "Sprint speed is improved by 30% (+20% per stack).", "Increase damage to enemies within 13m by 15% (+15% per stack).", "Increases base health regeneration by 2 hp/s for 3s (+3s per stack) after killing an enemy.", "Killing an enemy ignites all enemies within 12m (+4m per stack). Enemies burn for 150% (+75% per stack) base damage.", "Does nothing. Prioritized when used with 3D Printers.", "Your attacks have a 10% (+10% per stack) chance to 'Critically Strike', dealing double damange.", "2 seconds after getting hurt, heal for 20 plus an additional 5% (+5% per stack) of maximum health.", "Killing an enemy spawns a healing orb that heals for 8 plus an additional 2% (+2% per stack) of maximum health.", "Increases movement speed by 14% (+14% per stack).", "Gain a shield equal to 8% (+8% per stack) of your maximum health. Rechages outside of danger.", "Reduce all incoming damage by 5 (+5 per stack). Cannot be reduced below 1.", "A hidden cachce containing an item will appear in a random location on each stage. (Increases rarity of the item per stack).", "Increases attack speed by 15% (+15% per stack).", "5% (+5% per stack) chance on hit to attach a bomb to an enemy, detonating for 180% TOTAL damage.", "5% (+5% per stack) chance on hit to stun enemies for 2 seconds.", "Gain a temporary barrier on kill for 15 health (+15 per stack).", "15% (+15% per stack) chance to block incoming damage. Unaffected by luck.", "15% (+15% per stack) chance to bleed an enemy for 240% base damage.", "On level up or starting the Teleporter event, drop a banner that strengthens all allies within 16m (+8m per stack). Raise attack and movement speed by 30%.", "10% chance to fire a missile that deals 300% (+300% per stack) TOTAL damage.", "All random effects are rolled +1 (+1 per stack) times for a favorable outcome.", "A stone shard with immense power.", "Seems to do nothing... but...", "Cleanse all negative effects. Includes debuffs, damage over time, and nearby projectiles.", "All characters within are slowed by 50% and have their armor reduced by 20. Can place up to 5."]
    
    let itemRarities = ["Common", "Common", "Common", "Common", "Common", "Common", "Common", "Common", "Common", "Common", "Common", "Common", "Common", "Common", "Common", "Common", "Common", "Common", "Common", "Common", "Common", "Common", "Common", "Common", "Common", "Uncommon", "Legendary", "Boss", "Lunar", "Equipment", "Equipment"]
    
    let itemTypes = ["Passive", "Passive", "Passive", "Passive", "Passive", "Passive", "Passive", "Passive", "Passive", "Passive", "Passive", "Passive", "Passive", "Passive", "Passive", "Passive", "Passive", "Passive", "Passive", "Passive", "Passive", "Passive", "Passive", "Passive", "Passive", "Passive", "Passive", "Passive", "Passive", "Equipment", "Equipment"]
    
    var currentItem: UIImage? = nil
    var itemName = ""
    var itemDescription = ""
    var itemType = ""
    var itemRarity = ""
    var backgroundColor: UIColor? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Item", for: indexPath) as! CollectionViewCell
        
        cell.itemLabel.text = items[indexPath.item]
        cell.itemImageView.image = itemImages[indexPath.item]
        
        switch(itemRarities[indexPath.item]) {
            case "Common": cell.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            case "Uncommon": cell.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            case "Legendary": cell.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            case "Boss": cell.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
            case "Lunar": cell.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            default: cell.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        }
        
        cell.layer.cornerRadius = 10
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentItem = itemImages[indexPath.item]
        itemName = items[indexPath.item]
        itemDescription = itemDescriptions[indexPath.item]
        itemType = itemTypes[indexPath.item]
        itemRarity = itemRarities[indexPath.item]
                
        self.performSegue(withIdentifier: "SecondViewSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ItemDescriptionViewController
        vc.currentItem = self.currentItem
        vc.itemName = self.itemName
        vc.backgroundColor = self.backgroundColor
        vc.itemDescription = "Description: " + self.itemDescription + "\n\n"
            + "Type: " + self.itemType + "\n\n"
            + "Rarity: " + self.itemRarity;
        vc.itemRarity = self.itemRarity
    }
}

