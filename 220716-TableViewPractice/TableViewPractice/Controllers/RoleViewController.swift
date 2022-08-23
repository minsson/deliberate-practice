//  Created by minsson on 2022/06/14.

import UIKit

final class RoleViewController: UIViewController {

    @IBOutlet private weak var emojiLicenseLabel: UILabel!
    @IBOutlet private weak var roleTableView: UITableView!
    
    private var roleArray: [Role] = []
    private var dataManager = RoleDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emojiLicenseLabel.text = """
            All emojis designed by OpenMoji
            – the open-source emoji and icon project.
        """
        emojiLicenseLabel.lineBreakMode = .byWordWrapping
        emojiLicenseLabel.numberOfLines = 0
        
        roleTableView.dataSource = self
        roleTableView.rowHeight = 120
        
        dataManager.parseData()
        roleArray = dataManager.getRoleData()
    }
}
    
extension RoleViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = roleTableView.dequeueReusableCell(withIdentifier: "RoleCell", for: indexPath) as! RoleCell
        
        let role = roleArray[indexPath.row]
        
        cell.RoleImageView.image = role.image
        cell.nameLabel.text = role.name
        cell.descriptionLabel.text = role.description
        
        return cell
    }
}


