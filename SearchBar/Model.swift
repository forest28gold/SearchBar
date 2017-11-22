import UIKit

var modelAry = [Model]()

class Model: NSObject {
    var imageTerm:String = ""
    var imageDefinition:String = ""
    var imageTypes:String = ""
    var imageLink: String = ""
    var imageVideo: String = ""
    var imageP: String = ""
    var modelAry = [Model]()

    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("All")

    init(Term:String,Definition:String,Types:String,Link: String, Video: String, P: String) {
        self.imageTerm = Term
        self.imageDefinition = Definition
        self.imageTypes = Types
        self.imageLink = Link
        self.imageVideo = Video
        self.imageP = P
    }

    class func generateModelArray() -> [Model]{
        var modelAry = [Model]()
        
        modelAry.append(Model( Term: "scalo",Definition: "ARTEGA",Types: "GERMANY",Link: "https://en.wikipedia.org/wiki/List_of_countries_by_vehicles_per_capita",Video: "https://www.youtube.com/watch?v=3_axM0AfoCo", P: ""))
            modelAry.append(Model( Term: "A5",Definition: "AUDI",Types: "GERMANY",Link: "https://en.wikipedia.org/wiki/List_of_countries_by_vehicles_per_capita",Video: "https://www.youtube.com/watch?v=VnGeOmrXH6A", P: ""))
            modelAry.append(Model( Term: "X6",Definition: "BMW",Types: "GERMANY",Link: "https://en.wikipedia.org/wiki/List_of_countries_by_vehicles_per_capita",Video: "https://www.youtube.com/watch?v=IKcTu8Eniyw", P: ""))
            modelAry.append(Model( Term: "Astra",Definition: "OPEL",Types: "GERMANY",Link: "https://en.wikipedia.org/wiki/List_of_countries_by_vehicles_per_capita",Video: "https://www.youtube.com/watch?v=OuCsDYuxQAs", P: ""))
            modelAry.append(Model( Term: "panamera",Definition: "PORSCHE",Types: "GERMANY",Link: "https://en.wikipedia.org/wiki/List_of_countries_by_vehicles_per_capita",Video: "https://www.youtube.com/watch?v=TCybJZBOPIs", P: ""))
            modelAry.append(Model( Term: "Jetta",Definition: "VOLKSWAGEN",Types: "GERMANY",Link: "https://en.wikipedia.org/wiki/List_of_countries_by_vehicles_per_capita",Video: "https://www.youtube.com/watch?v=9iyW-3kkFjk", P: ""))
            modelAry.append(Model( Term: "Corsa",Definition: "OPEL",Types: "GERMANY",Link: "https://en.wikipedia.org/wiki/List_of_countries_by_vehicles_per_capita",Video: "https://www.youtube.com/watch?v=TrVSHj7CJRo", P: ""))
            modelAry.append(Model( Term: "MDX",Definition: "ACURA",Types: "JAPAN",Link: "https://en.wikipedia.org/wiki/List_of_countries_by_vehicles_per_capita",Video: "https://www.youtube.com/watch?v=fsgUKpEfGqM", P: ""))
            modelAry.append(Model( Term: "GO PLUS",Definition: "DATSUN",Types: "JAPAN",Link: "https://en.wikipedia.org/wiki/List_of_countries_by_vehicles_per_capita",Video: "https://www.youtube.com/watch?v=bSB_2dEBkWo", P: ""))
            modelAry.append(Model( Term: "CIVIC",Definition: "HONDA",Types: "JAPAN",Link: "https://en.wikipedia.org/wiki/List_of_countries_by_vehicles_per_capita",Video: "https://www.youtube.com/watch?v=K6kyAeAozBs", P: ""))
            modelAry.append(Model( Term: "QX80",Definition: "INFINTI",Types: "JAPAN",Link: "https://en.wikipedia.org/wiki/List_of_countries_by_vehicles_per_capita",Video: "https://www.youtube.com/watch?v=ah2G-n4fvPM", P: ""))
            modelAry.append(Model( Term: "GS",Definition: "LEXUS",Types: "JAPAN",Link: "https://en.wikipedia.org/wiki/List_of_countries_by_vehicles_per_capita",Video: "https://www.youtube.com/watch?v=H_4qELUIwco", P: ""))
            modelAry.append(Model( Term: "Altima",Definition: "NISSAN",Types: "JAPAN",Link: "https://en.wikipedia.org/wiki/List_of_countries_by_vehicles_per_capita",Video: "https://www.youtube.com/watch?v=OchR65mRoVs", P: ""))
            modelAry.append(Model( Term: "corolla",Definition: "TOYOTA",Types: "JAPAN",Link: "https://en.wikipedia.org/wiki/List_of_countries_by_vehicles_per_capita",Video: "https://www.youtube.com/watch?v=Gdjqs98e4GI", P: ""))
            modelAry.append(Model( Term: "swift",Definition: "SUZUKI",Types: "JAPAN",Link: "https://en.wikipedia.org/wiki/List_of_countries_by_vehicles_per_capita",Video: "https://www.youtube.com/watch?v=IVYifRNsohM", P: ""))
            modelAry.append(Model( Term: "regal",Definition: "BUICK",Types: "AMERICAN",Link: "https://en.wikipedia.org/wiki/List_of_countries_by_vehicles_per_capita",Video: "https://www.youtube.com/watch?v=1eZVbbFaKOE", P: ""))
            modelAry.append(Model( Term: "CT6",Definition: "CADILLAC",Types: "AMERICAN",Link: "https://en.wikipedia.org/wiki/List_of_countries_by_vehicles_per_capita",Video: "https://www.youtube.com/watch?v=bX25sWfeW-s", P: ""))
            modelAry.append(Model( Term: "camaro",Definition: "CHEVROLET",Types: "AMERICAN",Link: "https://en.wikipedia.org/wiki/List_of_countries_by_vehicles_per_capita",Video: "https://www.youtube.com/watch?v=o0vBLmJp9ck", P: ""))
            modelAry.append(Model( Term: "pacifica",Definition: "CHRYSLER",Types: "AMERICAN",Link: "https://en.wikipedia.org/wiki/List_of_countries_by_vehicles_per_capita",Video: "https://www.youtube.com/watch?v=_bjSS7aAXnA", P: ""))
            modelAry.append(Model( Term: "edge",Definition: "FORD",Types: "AMERICAN",Link: "https://en.wikipedia.org/wiki/List_of_countries_by_vehicles_per_capita",Video: "https://www.youtube.com/watch?v=bUqRV1rIng4", P: ""))
            modelAry.append(Model( Term: "wrangler",Definition: "JEEP",Types: "AMERICAN",Link: "https://en.wikipedia.org/wiki/List_of_countries_by_vehicles_per_capita",Video: "https://www.youtube.com/watch?v=7vBwANzl-HE", P: ""))
            modelAry.append(Model( Term: "viper",Definition: "DODGE",Types: "AMERICAN",Link: "https://en.wikipedia.org/wiki/List_of_countries_by_vehicles_per_capita",Video: "https://www.youtube.com/watch?v=MlO9F-r65gc", P: ""))
        return modelAry
    }
}
