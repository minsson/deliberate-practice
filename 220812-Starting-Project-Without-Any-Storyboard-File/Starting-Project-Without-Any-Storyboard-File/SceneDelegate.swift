//
//  SceneDelegate.swift
//  Starting-Project-Without-Any-Storyboard-File
//
//  Created by minsson on 2022/08/13.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        
        // MARK: UIWindow 타입의 `window`를 설정하고, 기본으로 제공되는 `UIWindowScene` 타입의 `scene`에 연결하기
        
//        // 기본으로 제공되던 코드에서 변수명만 입력해줍니다.
//        // scene은 UIScene 타입인데, UIWindowScene으로 다운캐스팅해 windowScene에 넣어주고 있어요.
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//        // 주석에서 시키는대로 여기서 window 프로퍼티를 configure 해주고 있어요.
//        window = UIWindow(windowScene: windowScene)
//
//        // 아래 코드에서 뷰컨트롤러를 생성해줘요.
//        // 여기서는 프로젝트를 만들면 기본으로 제공되는 ViewController 타입을 선택했지만, MyViewController 같은 타입을 만들고, 그 타입을 쓸 수도 있겠죠?
//        let initialViewController = ViewController()
//
//        // window 위에 최초의 뷰가 올라갈텐데, 루트뷰컨트롤러 프로퍼티를 이용해 어떤 뷰컨트롤러와 연결해줄지 선택해줘야 해요. 간단히 말해, 앱 켜자마자 나올 뷰를 위한 뷰컨트롤러를 고르는 과정이에요.
//        window?.rootViewController = initialViewController
//
//        // 말 그대로 window가 보이게 해주는데요, 해당 윈도우 이하 레벨의 모든 윈도우 중 가장 앞에 표시해달라는 메서드예요.
//        window?.makeKeyAndVisible()
//
        
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        
        let initialViewController = ViewController()
        
        // 윈도우 위에 네비게이션 컨트롤러가 있고, 네비게이션 컨트롤러의 네비게이션 스택 맨 처음에 쌓이는 건 rootViewController예요. 여기에 맨 처음 보여주고 싶은 뷰인 initialViewController를 넣었어요.
        let navigationController = UINavigationController(rootViewController: initialViewController)

        // 네비게이션 컨트롤러 -> 우리가 처음 보여주려는 뷰컨트롤러 (initialViewController)의 형태로 올라가야 하니까, window의 rootViewController에는 네비게이션 컨트롤러가 올라가요.
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

