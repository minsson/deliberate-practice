//  Created by minsson on 2022/06/17.

import UIKit

struct RoleDataManager {
    
    var roleDataArray: [Role] = []
    
    mutating func parseData() { // JSON 파일 등을 파싱하는 메서드라고 가정
        roleDataArray = [
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
    }
    
    func getRoleData() -> [Role] {

        return roleDataArray
    }
    
}
