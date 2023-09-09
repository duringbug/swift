import UIKit

public class ViewControllerImpl :UIViewController{
    public override func viewDidLoad() {
        super.viewDidLoad()
        let button=UIButton(type: .custom)
        button.frame=CGRect(x: 0, y: 200, width: 300, height: 50)
        button.setTitle("点击跳转", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        view.addSubview(button)
    }
}
