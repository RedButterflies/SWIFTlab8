//
//  main.swift
//  lab7
//
//  Created by admin on 11/21/23.
//

import Foundation
////zad.8.1.1
var osoba = (imie:"Aleksandra", nazwisko :"Olejarz", rokUr: 2002)

////zad.8.1.2
var osobaA = (imie: "Kuba", nazwisko:"Krzak", rokUr: 2005)
var osobaB = (imie: "Julia", nazwisko:"Korzen",rokUr: 1991)
if(osobaA.rokUr<osobaB.rokUr)
{
    print("Osoba \(osobaA.imie) \(osobaA.nazwisko) jest starsza niz osoba: \(osobaB.imie) \(osobaB.nazwisko)")
}
else if (osobaA.rokUr>osobaB.rokUr)
{
    print("Osoba \(osobaB.imie) \(osobaB.nazwisko) jest starsza niz osoba: \(osobaA.imie) \(osobaA.nazwisko) ")
}
else{
    print("Osoby: \(osobaA.imie) \(osobaA.nazwisko) i \(osobaB.imie) \(osobaB.nazwisko) sa w tym samym wieku")
}
////zad8.2
var student : [(nazwisko:String, ocenaA: Double, ocenaB: Double, ocenaC: Double, srednia: Double)] = Array(repeating: ("",0.0,0.0,0.0,0.0), count: 3)
var wNazwisko = ""
var nazwisko = ""
var wOcena = ""
var ocena = 0.0
for i in student.indices
{
    print("Wprowadz nazwisko studenta: ")
    wNazwisko = readLine()!
    if(Int(wNazwisko) != nil)
    {
        print("Nazwisko nie moze byc cyfra. Wprowadz poprawne nazwisko: ")
        wNazwisko = readLine()!
    }
    nazwisko = wNazwisko
    student[i].nazwisko = nazwisko
    print("Wprowadz ocene 1. studenta: ")
    wOcena = readLine()!
    while(Double(wOcena)==nil || Double(wOcena)! > 5.0 || Double(wOcena)! < 2.0)
    {
        print("Wprowadzono niepoprawna ocene. Wprowadz poprawna ocene: ")
        wOcena = readLine()!
    }

    ocena = Double(wOcena)!
    student[i].ocenaA = ocena
    print("Wprowadz ocene 2. studenta: ")
    wOcena = readLine()!
    while(Double(wOcena)==nil || Double(wOcena)! > 5.0 || Double(wOcena)! < 2.0)
    {
        print("Wprowadzono niepoprawna ocene. Wprowadz poprawna ocene: ")
        wOcena = readLine()!
    }

    ocena = Double(wOcena)!
    student[i].ocenaB = ocena
    print("Wprowadz ocene 3. studenta: ")
    wOcena = readLine()!
    while(Double(wOcena)==nil || Double(wOcena)! > 5.0 || Double(wOcena)! < 2.0)
    {
        print("Wprowadzono niepoprawna ocene. Wprowadz poprawna ocene: ")
        wOcena = readLine()!
    }

    ocena = Double(wOcena)!
    student[i].ocenaC = ocena

    student[i].srednia = (student[i].ocenaA + student[i].ocenaB + student[i]
                            .ocenaC) / 3.0


}

var posortowanyStudent: [(nazwisko:String, ocenaA: Double, ocenaB: Double, ocenaC: Double, srednia: Double)] = Array()
posortowanyStudent = student.sorted{ $0.srednia > $1.srednia }

for i in posortowanyStudent.indices
{
    print(String(format:"Nazwisko: \(posortowanyStudent[i].nazwisko), Ocena A: \(posortowanyStudent[i].ocenaA) Ocena B: \(posortowanyStudent[i].ocenaB) Ocena C: \(posortowanyStudent[i].ocenaC). Srednia: %.2lf",posortowanyStudent[i].srednia))
}

//zad8.3
print("Wprowadz liczbe mieszkan: ")
var wLiczbaMieszkanA = readLine()!
while(Int(wLiczbaMieszkanA)==nil)
{
    print("Wprowadzono niepoprawna liczbe mieszkan. Wprowadz poprawna wartosc: ")
    wLiczbaMieszkanA = readLine()!
}
var liczbaMieszkanA = Int(wLiczbaMieszkanA)!
var wLokalizacjaA = ""
var wPowierzchniaA = ""
var wCenaZaMetrA = ""
var mieszkaniaA : [(lokalizacja: String, powierzchnia: Double, cenaZaMetr: Double)] = Array(repeating:("",0.0,0.0) , count: liczbaMieszkanA)
for i in mieszkaniaA.indices
{
    print("Wprowasz lokalizacje: ")
    mieszkaniaA[i].lokalizacja = readLine()!
    print("Wprowadz powierzchnie: ")
    wPowierzchniaA = readLine()!
    while(Double(wPowierzchniaA)==nil)
    {
        print("Wprowadzono niepoprawna wartosc powierzchni. Wprowadz poprawna powierzchnie mieszkania w m2: ")
        wPowierzchniaA = readLine()!
    }
    mieszkaniaA[i].powierzchnia = Double(wPowierzchniaA)!
    print("Wprowadz cene za metr: ")
    wCenaZaMetrA = readLine()!
    while(Double(wCenaZaMetrA)==nil)
    {
        print("Wprowadzono bledna wartosc Wprowadz poprawna cene za metr: ")
        wCenaZaMetrA = readLine()!
    }
    mieszkaniaA[i].cenaZaMetr = Double(wCenaZaMetrA)!

}
var posortowaneMieszkaniaA : [(lokalizacja: String, powierzchnia: Double, cenaZaMetr: Double)] = Array(repeating:("",0.0,0.0) , count: liczbaMieszkanA)
posortowaneMieszkaniaA = mieszkaniaA.sorted{$0.cenaZaMetr*$0.powierzchnia > $1.cenaZaMetr*$1.powierzchnia}
print("\nNajtansze mieszkanie: \(posortowaneMieszkaniaA[posortowaneMieszkaniaA.count-1].self). \nNajdrozsze mieszkanie: \(posortowaneMieszkaniaA[0].self)")

//zad8.4
enum Miesiace: CaseIterable
{
    case Styczen, Luty, Marzec, Kwiecien, Maj, Czerwiec, Lipiec, Sierpien, Wrzesien, Pazdziernik, Listopad, Grudzien
}
var miesiac : Miesiace = Miesiace.Luty
switch(miesiac)
{
case .Grudzien, .Styczen, .Luty: print("zima")
case .Marzec,.Kwiecien,.Maj: print("wiosna")
case .Czerwiec, .Lipiec, .Sierpien: print ("lato")
case .Wrzesien, .Pazdziernik, .Listopad: print("jesien")
}
//zad8.5
enum Standard
{
    case wysoki, sredni, niski
}
print("Wprowadz liczbe mieszkan: ")
var wLiczbaMieszkan = readLine()!
while(Int(wLiczbaMieszkan)==nil)
{
    print("Wprowadzono niepoprawna liczbe mieszkan. Wprowadz poprawna wartosc: ")
    wLiczbaMieszkan = readLine()!
}
var liczbaMieszkan = Int(wLiczbaMieszkan)!
var wLokalizacja = ""
var wPowierzchnia = ""
var wCenaZaMetr = ""
var mieszkania : [(lokalizacja: String, powierzchnia: Double, cenaZaMetr: Double, standard: Standard)] = Array(repeating:("",0.0,0.0,Standard.sredni) , count: liczbaMieszkan)
for i in mieszkania.indices
{
    print("Wprowasz lokalizacje: ")
    mieszkania[i].lokalizacja = readLine()!
    print("Wprowadz powierzchnie: ")
    wPowierzchnia = readLine()!
    while(Double(wPowierzchnia)==nil)
    {
        print("Wprowadzono niepoprawna wartosc powierzchni. Wprowadz poprawna powierzchnie mieszkania w m2: ")
        wPowierzchnia = readLine()!
    }
    mieszkania[i].powierzchnia = Double(wPowierzchnia)!
    print("Wprowadz cene za metr: ")
    wCenaZaMetr = readLine()!
    while(Double(wCenaZaMetr)==nil)
    {
        print("Wprowadzono bledna wartosc Wprowadz poprawna cene za metr: ")
        wCenaZaMetr = readLine()!
    }
    mieszkania[i].cenaZaMetr = Double(wCenaZaMetr)!
    print("Wprowadz standard mieszkania: ")
    var wStandard = readLine()!
    while(wStandard != "niski" && wStandard != "sredni" && wStandard != "wysoki")
    {
        print("Wprowadzono niepoprawna wartosc. Wprowadz wartosc z zakresu (niski, sredni, wysoki) i sprobuj ponownie: ")
        wStandard = readLine()!
        
    }
    switch(wStandard)
    {
    case let x where x == "niski":
        mieszkania[i].standard = Standard.niski
    case let x where x == "sredni":
        mieszkania[i].standard = Standard.sredni
    case let x where x == "wysoki":
        mieszkania[i].standard = Standard.wysoki
    default:
        mieszkania[i].standard = Standard.sredni
    }

}
var posortowaneMieszkania : [(lokalizacja: String, powierzchnia: Double, cenaZaMetr: Double,standard:Standard)] = Array(repeating:("",0.0,0.0,Standard.sredni) , count: liczbaMieszkan)
posortowaneMieszkania = mieszkania.sorted{$0.cenaZaMetr*$0.powierzchnia > $1.cenaZaMetr*$1.powierzchnia}
print("\nNajtansze mieszkanie: \(posortowaneMieszkania[posortowaneMieszkania.count-1].self). \nNajdrozsze mieszkanie: \(posortowaneMieszkania[0].self)")
