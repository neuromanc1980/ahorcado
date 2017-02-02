

import UIKit

   public var result = 0

class ViewController: UIViewController {
    
 
    
     var palabras = ["perro", "esquizofrenico", "almohada", "mayal", "cenit", "llavero", "capella", "arpeggio", "hikikomori", "hipocondriaco" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        start()
    
    }
    
    @IBOutlet var Palabra: UILabel!
    @IBOutlet var Letra: UITextField!
    @IBOutlet var Imagen: UIImageView!
    @IBOutlet var instrucciones: UILabel!
    @IBOutlet var comprobar: UIButton!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()        }
    
    public var intentos = 9
    public var oculta = ""
    public var visible = [Character]()
    var aciertos = 0
    
    
    func start(){
        
        Imagen.image = UIImage(named: "ahorcado1.jpg")
        
        //elegimos una palabra del array
        let rand = Int(arc4random_uniform(UInt32(palabras.count)))
        instrucciones.text = "Te quedan "+String(intentos-2)+" intentos"
        oculta = (palabras[rand])
        
        //rellenamos la palabra visible con guioncitos
        for x in 1...oculta.characters.count {
            
            //indice dentro de la palabra
            let posicion = oculta.index(oculta.startIndex, offsetBy: x-1)
            print (oculta[posicion])
            visible.append("_")
            visible.append(" ")
        }
         Palabra.text = String(visible)
    }
   
    
    func imgUpdate(){
        switch intentos {
        case 1:            Imagen.image = UIImage(named: "ahorcado1.jpg")
        case 2:            Imagen.image = UIImage(named: "ahorcado9.jpg")
        case 3:            Imagen.image = UIImage(named: "ahorcado8.jpg")
        case 4:            Imagen.image = UIImage(named: "ahorcado7.jpg")
        case 5:            Imagen.image = UIImage(named: "ahorcado6.jpg")
        case 6:            Imagen.image = UIImage(named: "ahorcado5.jpg")
        case 7:            Imagen.image = UIImage(named: "ahorcado4.jpg")
        case 8:            Imagen.image = UIImage(named: "ahorcado3.jpg")
        case 9:            Imagen.image = UIImage(named: "ahorcado2.jpg")
        default:           Imagen.image = UIImage(named: "ahorcado1.jpg")
        }
    }
    
    @IBAction func comprobar(_ sender: UIButton) {
        
        let letra = Letra.text?.lowercased().characters.first
        
        var error = true
        
        for x in 1...oculta.characters.count {
            
            //indice dentro de la palabra
            let posicion = oculta.index(oculta.startIndex, offsetBy: x-1)
            
            if (oculta[posicion]==letra){
                error = false
            }
            
        }
        
        if (error == true){      intentos -= 1     }
        if (error == false){
            for x in 1...oculta.characters.count {
                
                //indice dentro de la palabra
                let posicion = oculta.index(oculta.startIndex, offsetBy: x-1)
                let posicion2 = (x*2)-1
                
                if (oculta[posicion]==letra){
                    visible[posicion2-1] = " "
                    visible[posicion2] = letra!
                    aciertos += 1
                }
                
            }
        }
        
        imgUpdate()
        Letra.text = ""
        Palabra.text = String(visible)
        instrucciones.text = "Te quedan "+String(intentos-2)+" intentos"
        
        if ((intentos-2)==0){
            gameOver();
        }
        
        if (aciertos == oculta.characters.count) {
            victory();
        }
        
    }
    
    func gameOver(){
    
    let secondViewController: SecondViewController = self.storyboard?.instantiateViewController(withIdentifier: "GameOver") as! SecondViewController
        
        secondViewController.mensaje = "GAME OVER"
        result = 0
    
    self.show(secondViewController, sender: self)        
    
    }
    
    func victory(){
        
        let secondViewController: SecondViewController = self.storyboard?.instantiateViewController(withIdentifier: "GameOver") as! SecondViewController
        
        secondViewController.mensaje = "WOHOOO"        
        result = 1
        
        self.show(secondViewController, sender: self)
        
    }
    
    
    

}

