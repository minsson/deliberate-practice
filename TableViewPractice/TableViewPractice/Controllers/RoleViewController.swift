//  Created by minsson on 2022/06/14.

import UIKit

final class RoleViewController: UIViewController, UITableViewDataSource {

    @IBOutlet private weak var emojiLicenseLabel: UILabel!
    @IBOutlet private weak var roleTableView: UITableView!
    
    private var roleArray: [Role] = [
        Role(image: UIImage(named: "astronaut.png"), name: "우주비행사", description: "우주를 비행해요"),
        Role(image: UIImage(named: "cook.png"), name: "요리사", description: "맛있는 요리를 해요"),
        Role(image: UIImage(named: "doctor.png"), name: "의사", description: "사람들을 치료해줘요"),
        Role(image: UIImage(named: "factoryworker.png"), name: "용접공", description: "금속을 용접해요"),
        Role(image: UIImage(named: "firefighter.png"), name: "소방관", description: "화재를 진압해요"),
        Role(image: UIImage(named: "judge.png"), name: "판사", description: "판결을 내려줘요"),
        Role(image: UIImage(named: "mechanic.png"), name: "정비공", description: "정비해줘요"),
        Role(image: UIImage(named: "scientist.png"), name: "과학자", description: "실험해요"),
        Role(image: UIImage(named: "singer.png"), name: "가수", description: "노래해요"),
        Role(image: UIImage(named: "student.png"), name: "학생", description: "공부해요")
    ]
    
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
    }

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


