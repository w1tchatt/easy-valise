//
//  SuitcaseModels.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 30/04/2023.
//

import Foundation

enum SuitcasesModelsEnum: CaseIterable {
    case shortTravelSummer
    case longTravelSummer
    case shortTravelWinter
    case longTravelWinter
    
    var name: String {
        switch self {
        case .shortTravelSummer:
            return "Petite valise été"
        case .longTravelSummer:
            return "Grande valise été"
        case .shortTravelWinter:
            return "Petite valise hiver"
        case .longTravelWinter:
            return "Grande Valise hiver"
        }
    }
    
    var model: [Item] {
        switch self {
        case .shortTravelSummer:
            return SuitcaseModels.shortTravelSummer
        case .longTravelSummer:
            return SuitcaseModels.longTravelSummer
        case .shortTravelWinter:
            return SuitcaseModels.shortTravelWinter
        case .longTravelWinter:
            return SuitcaseModels.longTravelWinter
        }
    }
}

class SuitcaseModels: Codable {
    
    static let shortTravelSummer: [Item] = [
        itemClothes1, itemClothes3, itemClothes5,itemClothes6, itemClothes7, itemClothes8, itemClothes9, itemClothes10, itemClothes11, itemClothes13,
        itemToiletry1, itemToiletry2, itemToiletry3, itemToiletry4, itemToiletry5, itemToiletry6, itemToiletry7, itemToiletry8, itemToiletry9, itemToiletry10, itemToiletry11, itemToiletry12, itemToiletry13, itemToiletry14, itemToiletry15,
        itemAccessory1, itemAccessory2, itemAccessory3, itemAccessory4, itemAccessory5, itemAccessory6, itemAccessory7, itemAccessory8,
        itemElectronic1, itemElectronic2, itemElectronic3, itemElectronic4,
        itemTravelDocument1, itemTravelDocument2, itemTravelDocument3, itemTravelDocument4, itemTravelDocument5, itemTravelDocument6, itemTravelDocument7, itemTravelDocument8,
        itemEntertainment1, itemEntertainment2, itemEntertainment6,
        itemDrug1, itemDrug2, itemDrug3, itemDrug4, itemDrug5, itemDrug6
    ]
    
    static let longTravelSummer: [Item] = [
        itemClothes1, itemClothes3, itemClothes5,itemClothes6, itemClothes7, itemClothes8, itemClothes9, itemClothes10, itemClothes11, itemClothes13,
        itemToiletry1, itemToiletry2, itemToiletry3, itemToiletry4, itemToiletry5, itemToiletry6, itemToiletry7, itemToiletry8, itemToiletry9, itemToiletry10, itemToiletry11, itemToiletry12, itemToiletry13, itemToiletry14, itemToiletry15,
        itemAccessory1, itemAccessory2, itemAccessory3, itemAccessory4, itemAccessory5, itemAccessory6, itemAccessory7, itemAccessory8,
        itemElectronic1, itemElectronic2, itemElectronic3, itemElectronic4,
        itemTravelDocument1, itemTravelDocument2, itemTravelDocument3, itemTravelDocument4, itemTravelDocument5, itemTravelDocument6, itemTravelDocument7, itemTravelDocument8,
        itemEntertainment1, itemEntertainment2, itemEntertainment6,
        itemDrug1, itemDrug2, itemDrug3, itemDrug4, itemDrug5, itemDrug6
    ]
    
    static let shortTravelWinter: [Item] = [
        itemClothes2, itemClothes4, itemClothes5,itemClothes6, itemClothes7, itemClothes9, itemClothes10, itemClothes11, itemClothes12,
        itemToiletry1, itemToiletry2, itemToiletry3, itemToiletry4, itemToiletry5, itemToiletry6, itemToiletry7, itemToiletry8, itemToiletry9, itemToiletry10, itemToiletry11, itemToiletry12, itemToiletry13, itemToiletry14, itemToiletry15,
        itemAccessory1, itemAccessory2, itemAccessory3, itemAccessory4, itemAccessory5, itemAccessory6, itemAccessory8, itemAccessory9, itemAccessory10, itemAccessory11,
        itemElectronic1, itemElectronic2, itemElectronic3, itemElectronic4,
        itemTravelDocument1, itemTravelDocument2, itemTravelDocument3, itemTravelDocument4, itemTravelDocument5, itemTravelDocument6, itemTravelDocument7, itemTravelDocument8,
        itemEntertainment1, itemEntertainment2, itemEntertainment6,
        itemDrug1, itemDrug2, itemDrug3, itemDrug4, itemDrug5, itemDrug6
    ]
    
    static let longTravelWinter: [Item] = [
        itemClothes2, itemClothes4, itemClothes5,itemClothes6, itemClothes7, itemClothes9, itemClothes10, itemClothes11, itemClothes12,
        itemToiletry1, itemToiletry2, itemToiletry3, itemToiletry4, itemToiletry5, itemToiletry6, itemToiletry7, itemToiletry8, itemToiletry9, itemToiletry10, itemToiletry11, itemToiletry12, itemToiletry13, itemToiletry14, itemToiletry15,
        itemAccessory1, itemAccessory2, itemAccessory3, itemAccessory4, itemAccessory5, itemAccessory6, itemAccessory8, itemAccessory9, itemAccessory10, itemAccessory11,
        itemElectronic1, itemElectronic2, itemElectronic3, itemElectronic4,
        itemTravelDocument1, itemTravelDocument2, itemTravelDocument3, itemTravelDocument4, itemTravelDocument5, itemTravelDocument6, itemTravelDocument7, itemTravelDocument8,
        itemEntertainment1, itemEntertainment2, itemEntertainment3, itemEntertainment4, itemEntertainment5,itemEntertainment6, itemEntertainment7,
        itemDrug1, itemDrug2, itemDrug3, itemDrug4, itemDrug5, itemDrug6
    ]
    
    
    static let itemClothes1 = Item(name: "Tshirt", isChecked: false, section: Section.clothes.rawValue)
    static let itemClothes2 = Item(name: "Pantalons", isChecked: false, section: Section.clothes.rawValue)
    static let itemClothes3 = Item(name: "Shorts", isChecked: false, section: Section.clothes.rawValue)
    static let itemClothes4 = Item(name: "Pull", isChecked: false, section: Section.clothes.rawValue)
    static let itemClothes5 = Item(name: "Tshirt manche longues", isChecked: false, section: Section.clothes.rawValue)
    static let itemClothes6 = Item(name: "Sous-vêtements", isChecked: false, section: Section.clothes.rawValue)
    static let itemClothes7 = Item(name: "Chaussettes", isChecked: false, section: Section.clothes.rawValue)
    static let itemClothes8 = Item(name: "Tong", isChecked: false, section: Section.clothes.rawValue)
    static let itemClothes9 = Item(name: "Basket", isChecked: false, section: Section.clothes.rawValue)
    static let itemClothes10 = Item(name: "Maillot de bain", isChecked: false, section: Section.clothes.rawValue)
    static let itemClothes11 = Item(name: "Pyjama", isChecked: false, section: Section.clothes.rawValue)
    static let itemClothes12 = Item(name: "Serviette", isChecked: false, section: Section.clothes.rawValue)
    static let itemClothes13 = Item(name: "Serviette de plage", isChecked: false, section: Section.clothes.rawValue)
    
    static let itemToiletry1 = Item(name: "Brosse à dent", isChecked: false, section: Section.toiletItems.rawValue)
    static let itemToiletry2 = Item(name: "Dentifrice", isChecked: false, section: Section.toiletItems.rawValue)
    static let itemToiletry3 = Item(name: "Savon", isChecked: false, section: Section.toiletItems.rawValue)
    static let itemToiletry4 = Item(name: "Shampoing", isChecked: false, section: Section.toiletItems.rawValue)
    static let itemToiletry5 = Item(name: "Déodorant", isChecked: false, section: Section.toiletItems.rawValue)
    static let itemToiletry6 = Item(name: "Parfum", isChecked: false, section: Section.toiletItems.rawValue)
    static let itemToiletry7 = Item(name: "Mascaraca", isChecked: false, section: Section.toiletItems.rawValue)
    static let itemToiletry8 = Item(name: "Maquillage", isChecked: false, section: Section.toiletItems.rawValue)
    static let itemToiletry9 = Item(name: "Brosse / Peigne", isChecked: false, section: Section.toiletItems.rawValue)
    static let itemToiletry10 = Item(name: "Rasoir", isChecked: false, section: Section.toiletItems.rawValue)
    static let itemToiletry11 = Item(name: "Serviettes hygiéniques", isChecked: false, section: Section.toiletItems.rawValue)
    static let itemToiletry12 = Item(name: "Crème", isChecked: false, section: Section.toiletItems.rawValue)
    static let itemToiletry13 = Item(name: "Baume à lèvre", isChecked: false, section: Section.toiletItems.rawValue)
    static let itemToiletry14 = Item(name: "Lingette démaquillante", isChecked: false, section: Section.toiletItems.rawValue)
    static let itemToiletry15 = Item(name: "Crème solaire", isChecked: false, section: Section.toiletItems.rawValue)
    
    static let itemAccessory1 = Item(name: "Sac à main", isChecked: false, section: Section.accessories.rawValue)
    static let itemAccessory2 = Item(name: "Sac à dos", isChecked: false, section: Section.accessories.rawValue)
    static let itemAccessory3 = Item(name: "Lunettes de soleil", isChecked: false, section: Section.accessories.rawValue)
    static let itemAccessory4 = Item(name: "Montre", isChecked: false, section: Section.accessories.rawValue)
    static let itemAccessory5 = Item(name: "Ceinture", isChecked: false, section: Section.accessories.rawValue)
    static let itemAccessory6 = Item(name: "Bijoux", isChecked: false, section: Section.accessories.rawValue)
    static let itemAccessory7 = Item(name: "Chapeau/casquette", isChecked: false, section: Section.accessories.rawValue)
    static let itemAccessory8 = Item(name: "Parapluie", isChecked: false, section: Section.accessories.rawValue)
    static let itemAccessory9 = Item(name: "Echarpe / foulard", isChecked: false, section: Section.accessories.rawValue)
    static let itemAccessory10 = Item(name: "Bonnet", isChecked: false, section: Section.accessories.rawValue)
    static let itemAccessory11 = Item(name: "Gants", isChecked: false, section: Section.accessories.rawValue)
    
    static let itemElectronic1 = Item(name: "Chargeur téléphone", isChecked: false, section: Section.electronic.rawValue)
    static let itemElectronic2 = Item(name: "Ecouteurs", isChecked: false, section: Section.electronic.rawValue)
    static let itemElectronic3 = Item(name: "Adaptateur de voyage", isChecked: false, section: Section.electronic.rawValue)
    static let itemElectronic4 = Item(name: "Batterie externe", isChecked: false, section: Section.electronic.rawValue)
    
    static let itemTravelDocument1 = Item(name: "Passport / carte d'identité", isChecked: false, section: Section.travelDocs.rawValue)
    static let itemTravelDocument2 = Item(name: "Permis de conduire", isChecked: false, section: Section.travelDocs.rawValue)
    static let itemTravelDocument3 = Item(name: "Papiers / emails de reservation", isChecked: false, section: Section.travelDocs.rawValue)
    static let itemTravelDocument4 = Item(name: "Carte d'embarquement / bilstatic let de train", isChecked: false, section: Section.travelDocs.rawValue)
    static let itemTravelDocument5 = Item(name: "Itinéraire de voyage", isChecked: false, section: Section.travelDocs.rawValue)
    static let itemTravelDocument6 = Item(name: "Argent liquide", isChecked: false, section: Section.travelDocs.rawValue)
    static let itemTravelDocument7 = Item(name: "Carte bancaire", isChecked: false, section: Section.travelDocs.rawValue)
    static let itemTravelDocument8 = Item(name: "Livre de voyage", isChecked: false, section: Section.travelDocs.rawValue)
    
    static let itemEntertainment1 = Item(name: "Livres / Liseuse", isChecked: false, section: Section.entertainmentItems.rawValue)
    static let itemEntertainment2 = Item(name: "Magazine", isChecked: false, section: Section.entertainmentItems.rawValue)
    static let itemEntertainment3 = Item(name: "Jeux de sociétés", isChecked: false, section: Section.entertainmentItems.rawValue)
    static let itemEntertainment4 = Item(name: "Jeux pour enfants", isChecked: false, section: Section.entertainmentItems.rawValue)
    static let itemEntertainment5 = Item(name: "Stylo / crayons", isChecked: false, section: Section.entertainmentItems.rawValue)
    static let itemEntertainment6 = Item(name: "Téléchargement d'épisodes/films", isChecked: false, section: Section.entertainmentItems.rawValue)
    static let itemEntertainment7 = Item(name: "Jeux de carte", isChecked: false, section: Section.entertainmentItems.rawValue)
    
    static let itemDrug1 = Item(name: "Médicament sur ordonnance", isChecked: false, section: Section.drugs.rawValue)
    static let itemDrug2 = Item(name: "Médicament mal de transports", isChecked: false, section: Section.drugs.rawValue)
    static let itemDrug3 = Item(name: "Médicaments vente libre", isChecked: false, section: Section.drugs.rawValue)
    static let itemDrug4 = Item(name: "Pansements", isChecked: false, section: Section.drugs.rawValue)
    static let itemDrug5 = Item(name: "Antispetique", isChecked: false, section: Section.drugs.rawValue)
    static let itemDrug6 = Item(name: "Antimoustique", isChecked: false, section: Section.drugs.rawValue)
    
    //        static let item1 = Item(name: String, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item2 = Item(name: String, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item3 = Item(name: String, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item4 = Item(name: String, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item5 = Item(name: String, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item6 = Item(name: String, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item7 = Item(name: String, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item8 = Item(name: <#T##String#>, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item9 = Item(name: <#T##String#>, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item10 = Item(name: <#T##String#>, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item11 = Item(name: <#T##String#>, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item12 = Item(name: <#T##String#>, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item13 = Item(name: <#T##String#>, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item14 = Item(name: <#T##String#>, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item15 = Item(name: <#T##String#>, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item16 = Item(name: <#T##String#>, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item17 = Item(name: <#T##String#>, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item18 = Item(name: <#T##String#>, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item19 = Item(name: <#T##String#>, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item20 = Item(name: String, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item21 = Item(name: String, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item22 = Item(name: String, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item23 = Item(name: String, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item24 = Item(name: String, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item25 = Item(name: String, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item26 = Item(name: String, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item27 = Item(name: String, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item28 = Item(name: String, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item29 = Item(name: String, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item30 = Item(name: String, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item31 = Item(name: String, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item32 = Item(name: String, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item33 = Item(name: String, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item34 = Item(name: String, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item35 = Item(name: String, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item36 = Item(name: String, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item37 = Item(name: String, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item38 = Item(name: <#T##String#>, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item39 = Item(name: <#T##String#>, isChecked: false, section: <#T##Section.RawValue#>)
    //        static let item40 = Item(name: <#T##String#>, isChecked: false, section: <#T##Section.RawValue#>)
    
}
