import UIKit



class SecondViewController: UIViewController {

    public var mensaje = ""
    
    @IBOutlet var imagen: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameOver.text = mensaje
        
        if (result == 1){
            imagen.image = #imageLiteral(resourceName: "victory.jpg")
        }   else { imagen.image = #imageLiteral(resourceName: "gameOver.jpg") }
        
        
    }

    @IBOutlet var replay: UIButton!
    @IBOutlet var gameOver: UILabel!
    

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let juego: ViewController =
            segue.destination as! ViewController
    }
    
  

    @IBAction func gameOver(_ sender: AnyObject) {
    }
    
}
