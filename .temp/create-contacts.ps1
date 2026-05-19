$targetFolder = "C:\Users\karz\.MasterBrain\50_People"
$utf8NoBom = [System.Text.UTF8Encoding]::new($false)

function New-Contact {
    param(
        [string]$GN,
        [string]$SN,
        [string]$FN = "$GN $SN",
        [string]$EmailWork = "",
        [string]$UrlWork = "",
        [string]$Title = "",
        [string]$Role = "",
        [string]$Categories = "CTRM, Kontakt",
        [string]$Notes = ""
    )

    $uid = "urn:uuid:$(New-Guid)"
    $lines = [System.Collections.Generic.List[string]]::new()
    $lines.Add("---")
    $lines.Add("N.FN: $SN")
    $lines.Add("N.GN: $GN")
    $lines.Add("FN: $FN")
    $lines.Add("PHOTO: ")
    $lines.Add('"EMAIL[HOME]": ')
    $lines.Add('"EMAIL[WORK]": ' + $EmailWork)
    $lines.Add('"TEL[CELL]": ')
    $lines.Add('"TEL[WORK]": ')
    $lines.Add("BDAY: ")
    $lines.Add('"URL[WORK]": ' + $UrlWork)
    $lines.Add("ORG: Swiss Life AG")
    $lines.Add("TITLE: $Title")
    $lines.Add("ROLE: $Role")
    $lines.Add('"ADR[WORK].STREET": ')
    $lines.Add('"ADR[WORK].LOCALITY": Zürich')
    $lines.Add('"ADR[WORK].POSTAL": "8000"')
    $lines.Add('"ADR[WORK].COUNTRY": Switzerland')
    $lines.Add("CATEGORIES: $Categories")
    $lines.Add("UID: $uid")
    $lines.Add('VERSION: "4.0"')
    $lines.Add("---")
    $lines.Add("")
    $lines.Add("#### Notes")
    if ($Notes) { $lines.Add($Notes) }
    $lines.Add("")
    $lines.Add("#Contact #CTRM")

    $content = $lines -join "`n"
    $filePath = Join-Path $targetFolder "$FN.md"
    [System.IO.File]::WriteAllText($filePath, $content, $utf8NoBom)
    Write-Host "OK  $FN"
}

# ── E2E Kundenprozess ─────────────────────────────────────────────────────────
New-Contact -GN "Markus"       -SN "Berchtold"          -Title "Product Owner Suche / SM Kundenportal"              -Role "CH IKC"  -UrlWork "https://myassets.slcloud.ch/" -Categories "CTRM, Kontakt, E2E, Kundenportal"    -Notes "PO Suche und vieles mehr. SM Kundenportal Web und App."
New-Contact -GN "Jonas"        -SN "van Laere"           -Title "Product Owner Berater Cockpit"                                      -Categories "CTRM, Kontakt, E2E"
New-Contact -GN "Fabian"       -SN "Meier"               -Title "Product Owner Advice / Analysis"                                     -Categories "CTRM, Kontakt, E2E"
New-Contact -GN "Gian Andrea"  -SN "Jäger"               -Title "Business Analyst Berater Cockpit"                                    -Categories "CTRM, Kontakt, E2E"
New-Contact -GN "Romeo"        -SN "Christen"            -Title "Business Analyst Berater Cockpit"                   -Role "SLS"     -Categories "CTRM, Kontakt, E2E, SLS"
New-Contact -GN "Benjamin"     -SN "Peter"               -Title "Product Owner Kundenportal Web"                                      -Categories "CTRM, Kontakt, E2E, Kundenportal"
New-Contact -GN "Rafael"       -SN "Radzyner"            -Title "Fachverantwortung Kundenportal Web (PAV)"                            -Categories "CTRM, Kontakt, E2E, Kundenportal"
New-Contact -GN "Daniel"       -SN "Stabile"             -Title "Fachverantwortung Kundenportal Web (UAT) / 2. Säule"                 -Categories "CTRM, Kontakt, E2E, Kundenportal, U"
New-Contact -GN "Niloufar"     -SN "Tale Dastjerdi"      -Title "Business Analyst Kundenportal Web/App"                              -Categories "CTRM, Kontakt, E2E, Kundenportal"
New-Contact -GN "Asim"         -SN "Kalkinc"             -Title "Business Analyst Kundenportal Web"                                   -Categories "CTRM, Kontakt, E2E, Kundenportal"
New-Contact -GN "Othmar"       -SN "Morger"              -Title "Tester Kundenportal Web (UAT)"                                       -Categories "CTRM, Kontakt, E2E, Kundenportal"
New-Contact -GN "Joachim"      -SN "Stein"               -Title "Tester Kundenportal Web (PAV)"                                       -Categories "CTRM, Kontakt, E2E, Kundenportal"
New-Contact -GN "Lea"          -SN "Walter"              -Title "Product Owner Kundenportal App"                                      -Categories "CTRM, Kontakt, E2E, Kundenportal"
New-Contact -GN "Cédéric"      -SN "Stutz"               -Title "Product Owner Marktplatz"                                            -Categories "CTRM, Kontakt, E2E"
New-Contact -GN "Adriana"      -SN "Bogdanova"           -Title "Business Analyst Advice / Analysis"                                  -Categories "CTRM, Kontakt, E2E"
New-Contact -GN "Nastasia"     -SN "Müller"              -Title "Business Analyst Advice / Analysis"                                  -Categories "CTRM, Kontakt, E2E"
New-Contact -GN "Selina"       -SN "Gigeer"              -Title "Business Analyst Advice / Analysis"                                  -Categories "CTRM, Kontakt, E2E"

# ── F2C ───────────────────────────────────────────────────────────────────────
New-Contact -GN "Philippe"     -SN "Birbaum"             -Title "Product Owner Kundenportal Login / Dokustore"                        -Categories "CTRM, Kontakt, F2C"
New-Contact -GN "Normen"       -SN "Scheiber"            -Title "Business Analyst Dokustore"                                          -Categories "CTRM, Kontakt, F2C"
New-Contact -GN "Simon"        -SN "van der Beek"        -Title "Product Owner F2C Datenbanken"                                       -Categories "CTRM, Kontakt, F2C"

# ── U (2. Säule) ─────────────────────────────────────────────────────────────
New-Contact -GN "Yves"         -SN "d'Hooghe"            -Title "Scrum Master 2. Säule"                              -Role "CH BM"   -Categories "CTRM, Kontakt, U"
New-Contact -GN "Thomas"       -SN "Mutter"              -Title "Tester 2. Säule"                                                     -Categories "CTRM, Kontakt, U"
New-Contact -GN "Armin"        -SN "Eigel"               -Title "Know-how 2. Säule NVS / FZP"                                         -Categories "CTRM, Kontakt, U"
New-Contact -GN "Morgan"       -SN "Johnston"            -Title "xPlan Datentransfer"                                                  -Categories "CTRM, Kontakt, U"
New-Contact -GN "Christine"    -SN "Zangerle"            -Title "Incident Manager PAV / Stammdaten"                  -Role "CH USU"  -Categories "CTRM, Kontakt, U, CH-IU"
New-Contact -GN "Patrick"      -SN "Mattenburger"        -Title "Stammdaten"                                                          -Categories "CTRM, Kontakt, U"
New-Contact -GN "Alex"         -SN "Mosimann"            -Title "2. Säule Digis"                                                      -Categories "CTRM, Kontakt, U"
New-Contact -GN "Pascal"       -SN "Ziegler"             -Title "2. Säule Digis"                                                      -Categories "CTRM, Kontakt, U"
New-Contact -GN "Christian"    -SN "Schmid"              -Title "Premium Invoice"                       -EmailWork "christian.schmid2@swisslife.ch" -Categories "CTRM, Kontakt, U"

# ── P (Private Vorsorge) ──────────────────────────────────────────────────────
New-Contact -GN "Elisabeth"    -SN "Baumer Soldan"       -Title "Fachverantwortung / BA ZMA, FactSheets, BAPA"                        -Categories "CTRM, Kontakt, P"
New-Contact -GN "Marc"         -SN "Thalmann"            -Title "Tester ZMA / EV / Hypo"                             -Role "CH IPO"  -Categories "CTRM, Kontakt, P"
New-Contact -GN "Michael"      -SN "Haitz"               -Title "Fachverantwortung Wealth Management"                                  -Categories "CTRM, Kontakt, P, WM"
New-Contact -GN "Marc"         -SN "Züllig"              -Title "Business Analyst Wealth Management"                                   -Categories "CTRM, Kontakt, P, WM"
New-Contact -GN "Jörg"         -SN "Schwieger"           -Title "Fachverantwortung EV"                                                 -Categories "CTRM, Kontakt, P, EV"
New-Contact -GN "Urs"          -SN "Gisler"              -Title "Business Analyst EV"                                                  -Categories "CTRM, Kontakt, P, EV"
New-Contact -GN "Martin"       -SN "Schido"              -Title "Tester EV / MARS (Opus)"                                             -Categories "CTRM, Kontakt, P, EV"
New-Contact -GN "Bruno"        -SN "Büchel"              -Title "Tester EV (Opus)"                                                    -Categories "CTRM, Kontakt, P, EV"
New-Contact -GN "Katrin"       -SN "Keller"              -Title "PM Dokumente EV"                                                      -Categories "CTRM, Kontakt, P, EV"
New-Contact -GN "Jurij"        -SN "Bernhardt"           -Title "GFA Service EV"                                                       -Categories "CTRM, Kontakt, P, EV"
New-Contact -GN "Andreas"      -SN "Riedel"              -Title "GFA Service EV"                                     -Role "CH IPB"  -Categories "CTRM, Kontakt, P, EV"
New-Contact -GN "Christoph"    -SN "Nievergelt"          -Title "Morpheus EV"                                                          -Categories "CTRM, Kontakt, P, EV"
New-Contact -GN "Marc-Etienne" -SN "Adank"               -Title "Fachverantwortung Hypo"                             -Role "CH PCE"  -Categories "CTRM, Kontakt, P, Hypo"
New-Contact -GN "Michèle"      -SN "Strasser"            -Title "Business Analyst Hypo"                              -Role "CH PCE"  -Categories "CTRM, Kontakt, P, Hypo"
New-Contact -GN "Marcel"       -SN "Schoch"              -Title "System Hypo"                                        -Role "CH IPA"  -Categories "CTRM, Kontakt, P, Hypo"
New-Contact -GN "Céline"       -SN "Ly"                  -Title "Business Analyst FactSheets"                                          -Categories "CTRM, Kontakt, P"
New-Contact -GN "Sonja"        -SN "Lindner"             -Title "Business Analyst FactSheets (evt.)"                                   -Categories "CTRM, Kontakt, P"
New-Contact -GN "Thomas"       -SN "Anderegg"            -Title "Architect IP / WM / EV / MARS"                                       -Categories "CTRM, Kontakt, P, WM, EV"
New-Contact -GN "Dalibor"      -SN "Peric"               -Title "Architect Wealth Management"                                          -Categories "CTRM, Kontakt, P, WM"
New-Contact -GN "Thomas"       -SN "Früh"                -Title "BAPA IT"                                            -Role "CH IPO"  -Categories "CTRM, Kontakt, P"

# ── Diverses ──────────────────────────────────────────────────────────────────
New-Contact -GN "Giada"        -SN "Zacheo"              -Title "Product Owner myMatching"                                             -Categories "CTRM, Kontakt, Diverses"
New-Contact -GN "Michael"      -SN "Stranz"              -Title "a.i. Product Owner myMatching"                                        -Categories "CTRM, Kontakt, Diverses"
New-Contact -GN "Franz"        -SN "Häflinger"           -Title "Product Owner Kundenportal 1st Level Support"                         -Categories "CTRM, Kontakt, Diverses, Kundenportal"
New-Contact -GN "Kriyonas"     -SN "Kosta"               -Title "AEM Content"                                                          -Categories "CTRM, Kontakt, AEM"
New-Contact -GN "Alexander"    -SN "Filus"               -Title "AEM Technisch"                                                        -Categories "CTRM, Kontakt, AEM"

# ── IU PO Liste ───────────────────────────────────────────────────────────────
New-Contact -GN "Tamara"       -SN "Vidakovic"           -Title "Product Owner Team Offerte / Leistungen"                              -Categories "CTRM, Kontakt, IU"
New-Contact -GN "Claudia"      -SN "Hafen"               -Title "Product Owner Team Portal"                                            -Categories "CTRM, Kontakt, IU"
New-Contact -GN "Leurita"      -SN "Bejtullahu"          -Title "Product Owner Team Backend und Documents"                             -Categories "CTRM, Kontakt, IU"
New-Contact -GN "Olivier"      -SN "Lüthi"               -Title "Product Owner Team Buchhaltung"                                       -Categories "CTRM, Kontakt, IU"
New-Contact -GN "Ruggero"      -SN "Trapasso"            -Title "Product Owner Team WEGIS"                                             -Categories "CTRM, Kontakt, IU"
New-Contact -GN "Marc"         -SN "Schnetzler"          -Title "Product Owner Team WEGIS"                                             -Categories "CTRM, Kontakt, IU"
New-Contact -GN "Lukas"        -SN "Schumacher"          -Title "Product Owner Team Basis-Systemlandschaft"                            -Categories "CTRM, Kontakt, IU"
New-Contact -GN "Alexandre"    -SN "Stauffer"            -Title "Product Owner Team Versicherungstechnik"                              -Categories "CTRM, Kontakt, IU"
New-Contact -GN "Yanick"       -SN "Dlabek"              -Title "Team BA"                                                              -Categories "CTRM, Kontakt, IU"
New-Contact -GN "Grit"         -SN "Hieke"               -Title "IAM"                                                                  -Categories "CTRM, Kontakt, IU, IAM"
New-Contact -GN "Alexis"       -SN "Skliamis"            -Title "DSG"                                                                  -Categories "CTRM, Kontakt, IU, DSG"
New-Contact -GN "Thomas"       -SN "Ritzi"               -Title "Incident Management"                                                  -Categories "CTRM, Kontakt, IU"

# ── IT ────────────────────────────────────────────────────────────────────────
New-Contact -GN "Christopher"  -SN "Steiner"             -Title "IT"                                                                   -Categories "CTRM, Kontakt, IT"
New-Contact -GN "Mauro"        -SN "Hefti"               -Title "IT"                                                                   -Categories "CTRM, Kontakt, IT"
New-Contact -GN "Patrick"      -SN "Maurer"              -Title "Simulation Server (neu starten)"                                      -Categories "CTRM, Kontakt, IT"
New-Contact -GN "Dieter"       -SN "Niggeler"            -Title "Simulation Server (Daten kommen falsch/nicht)"                        -Categories "CTRM, Kontakt, IT"

# ── F2C Services / Dokumente ──────────────────────────────────────────────────
New-Contact -GN "Asani"        -SN "Bejtulla"            -Title "Notification Service"                                                  -Categories "CTRM, Kontakt, F2C"
New-Contact -GN "Mariusz"      -SN "Matysek"             -Title "Notification Service"                                                  -Categories "CTRM, Kontakt, F2C"
New-Contact -GN "Marco"        -SN "Sgro"                -Title "F2C Datenbanken"                                                      -Categories "CTRM, Kontakt, F2C"

# ── Network ───────────────────────────────────────────────────────────────────
New-Contact -GN "Stefan"       -SN "Lüchinger"           -Title "Network (IP freischalten für www-q)"                                  -Categories "CTRM, Kontakt, IT, Network"
New-Contact -GN "Artan"        -SN "Sulemani"            -Title "Network"                                                              -Categories "CTRM, Kontakt, IT, Network"

# ── Common Identity Security ──────────────────────────────────────────────────
New-Contact -GN "Pascal"       -SN "Senn"                -Title "Common Identity Security"                                             -Categories "CTRM, Kontakt, IT, Identity"
New-Contact -GN "Gabriel"      -SN "Luca"                -Title "Common Identity Security"                                             -Categories "CTRM, Kontakt, IT, Identity"

Write-Host "`nFertig! $(Get-ChildItem $targetFolder -Filter '*.md' | Measure-Object | Select-Object -ExpandProperty Count) Kontakte in $targetFolder"
