import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: qsTr("Конвертер")
    }

    property string cur1: ""
    property string cur2: ""
    property double rate1: 0
    property double rate2: 0
    property double result: 0

    Item {
        id: container
        anchors {
            left: parent.left; right: parent.right;
            verticalCenter: parent.verticalCenter;
        }
        height: parent.height * 0.8

        Column {
            anchors.centerIn: parent

            Button {
                text: rate1 ? cur1 : "Валюта 1"
                onClicked: dialog1.open()
            }
            Label {
                font.pixelSize: 25
                text: "в рублях: " + rate1
            }

            Button {
                text: rate2 ? cur2 : "Валюта 2"
                onClicked: dialog2.open()
            }
            Label {
                font.pixelSize: 25
                text: "в рублях: " + rate2
            }

            TextField {
                id: amount
                placeholderText: "Количество"
            }
            Button {
                text: "Рассчитать"
                onClicked: {
                    var num = amount.text - 0
                    if (num) {
                        console.log(num)
                        result = rate1 * num / rate2
                    }
                }
            }
            Label {
                text: result
            }
        }
    }

    XmlListModel {
        id: xmlListModel
        // source: "http://www.cbr.ru/scripts/XML_daily.asp"
        query: "//Valute"
        XmlRole { name: "Name"; query: "Name/string()" }
        XmlRole { name: "Value"; query: "Value/string()" }
        xml: '<?xml version="1.0"?><ValCurs Date="02.11.2022" name="Foreign Currency Market"><Valute ID="R01010"><NumCode>036</NumCode><CharCode>AUD</CharCode><Nominal>1</Nominal><Name>Австралийский доллар</Name><Value>39,4549</Value></Valute><Valute ID="R01020A"><NumCode>944</NumCode><CharCode>AZN</CharCode><Nominal>1</Nominal><Name>Азербайджанский манат</Name><Value>36,1338</Value></Valute><Valute ID="R01035"><NumCode>826</NumCode><CharCode>GBP</CharCode><Nominal>1</Nominal><Name>Фунт стерлингов Соединенного королевства</Name><Value>70,7276</Value></Valute><Valute ID="R01060"><NumCode>051</NumCode><CharCode>AMD</CharCode><Nominal>100</Nominal><Name>Армянских драмов</Name><Value>15,5438</Value></Valute><Valute ID="R01090B"><NumCode>933</NumCode><CharCode>BYN</CharCode><Nominal>1</Nominal><Name>Белорусский рубль</Name><Value>24,8242</Value></Valute><Valute ID="R01100"><NumCode>975</NumCode><CharCode>BGN</CharCode><Nominal>1</Nominal><Name>Болгарский лев</Name><Value>31,1372</Value></Valute><Valute ID="R01115"><NumCode>986</NumCode><CharCode>BRL</CharCode><Nominal>1</Nominal><Name>Бразильский реал</Name><Value>11,6856</Value></Valute><Valute ID="R01135"><NumCode>348</NumCode><CharCode>HUF</CharCode><Nominal>100</Nominal><Name>Венгерских форинтов</Name><Value>14,8211</Value></Valute><Valute ID="R01200"><NumCode>344</NumCode><CharCode>HKD</CharCode><Nominal>10</Nominal><Name>Гонконгских долларов</Name><Value>78,3914</Value></Valute><Valute ID="R01215"><NumCode>208</NumCode><CharCode>DKK</CharCode><Nominal>10</Nominal><Name>Датских крон</Name><Value>81,8052</Value></Valute><Valute ID="R01235"><NumCode>840</NumCode><CharCode>USD</CharCode><Nominal>1</Nominal><Name>Доллар США</Name><Value>61,4275</Value></Valute><Valute ID="R01239"><NumCode>978</NumCode><CharCode>EUR</CharCode><Nominal>1</Nominal><Name>Евро</Name><Value>60,9668</Value></Valute><Valute ID="R01270"><NumCode>356</NumCode><CharCode>INR</CharCode><Nominal>100</Nominal><Name>Индийских рупий</Name><Value>74,2213</Value></Valute><Valute ID="R01335"><NumCode>398</NumCode><CharCode>KZT</CharCode><Nominal>100</Nominal><Name>Казахстанских тенге</Name><Value>13,1157</Value></Valute><Valute ID="R01350"><NumCode>124</NumCode><CharCode>CAD</CharCode><Nominal>1</Nominal><Name>Канадский доллар</Name><Value>45,0051</Value></Valute><Valute ID="R01370"><NumCode>417</NumCode><CharCode>KGS</CharCode><Nominal>100</Nominal><Name>Киргизских сомов</Name><Value>73,5697</Value></Valute><Valute ID="R01375"><NumCode>156</NumCode><CharCode>CNY</CharCode><Nominal>10</Nominal><Name>Китайских юаней</Name><Value>84,0548</Value></Valute><Valute ID="R01500"><NumCode>498</NumCode><CharCode>MDL</CharCode><Nominal>10</Nominal><Name>Молдавских леев</Name><Value>31,8140</Value></Valute><Valute ID="R01535"><NumCode>578</NumCode><CharCode>NOK</CharCode><Nominal>10</Nominal><Name>Норвежских крон</Name><Value>59,9778</Value></Valute><Valute ID="R01565"><NumCode>985</NumCode><CharCode>PLN</CharCode><Nominal>1</Nominal><Name>Польский злотый</Name><Value>12,9824</Value></Valute><Valute ID="R01585F"><NumCode>946</NumCode><CharCode>RON</CharCode><Nominal>1</Nominal><Name>Румынский лей</Name><Value>12,4171</Value></Valute><Valute ID="R01589"><NumCode>960</NumCode><CharCode>XDR</CharCode><Nominal>1</Nominal><Name>СДР (специальные права заимствования)</Name><Value>78,8293</Value></Valute><Valute ID="R01625"><NumCode>702</NumCode><CharCode>SGD</CharCode><Nominal>1</Nominal><Name>Сингапурский доллар</Name><Value>43,4516</Value></Valute><Valute ID="R01670"><NumCode>972</NumCode><CharCode>TJS</CharCode><Nominal>10</Nominal><Name>Таджикских сомони</Name><Value>60,1358</Value></Valute><Valute ID="R01700J"><NumCode>949</NumCode><CharCode>TRY</CharCode><Nominal>10</Nominal><Name>Турецких лир</Name><Value>33,0108</Value></Valute><Valute ID="R01710A"><NumCode>934</NumCode><CharCode>TMT</CharCode><Nominal>1</Nominal><Name>Новый туркменский манат</Name><Value>17,5507</Value></Valute><Valute ID="R01717"><NumCode>860</NumCode><CharCode>UZS</CharCode><Nominal>10000</Nominal><Name>Узбекских сумов</Name><Value>54,9963</Value></Valute><Valute ID="R01720"><NumCode>980</NumCode><CharCode>UAH</CharCode><Nominal>10</Nominal><Name>Украинских гривен</Name><Value>16,6325</Value></Valute><Valute ID="R01760"><NumCode>203</NumCode><CharCode>CZK</CharCode><Nominal>10</Nominal><Name>Чешских крон</Name><Value>24,8725</Value></Valute><Valute ID="R01770"><NumCode>752</NumCode><CharCode>SEK</CharCode><Nominal>10</Nominal><Name>Шведских крон</Name><Value>56,2214</Value></Valute><Valute ID="R01775"><NumCode>756</NumCode><CharCode>CHF</CharCode><Nominal>1</Nominal><Name>Швейцарский франк</Name><Value>61,8543</Value></Valute><Valute ID="R01810"><NumCode>710</NumCode><CharCode>ZAR</CharCode><Nominal>10</Nominal><Name>Южноафриканских рэндов</Name><Value>33,8155</Value></Valute><Valute ID="R01815"><NumCode>410</NumCode><CharCode>KRW</CharCode><Nominal>1000</Nominal><Name>Вон Республики Корея</Name><Value>43,3443</Value></Valute><Valute ID="R01820"><NumCode>392</NumCode><CharCode>JPY</CharCode><Nominal>100</Nominal><Name>Японских иен</Name><Value>41,3014</Value></Valute></ValCurs>'
    }

    Dialog {
        id: dialog1

        SilicaListView {
            anchors.fill: parent
            model: xmlListModel
            header: PageHeader { title: "Курсы" }
            section {
                property: 'Name'
                delegate: SectionHeader { text: section }
            }
            delegate: ListItem {
                Text { text: Value; }
                onClicked: {
                    cur1 = Name
                    rate1 = Value.replace(/,/g, '.') - 0
                    dialog1.accept()
                }
            }
        }
    }

    Dialog {
        id: dialog2

        SilicaListView {
            anchors.fill: parent
            model: xmlListModel
            header: PageHeader { title: "Курсы" }
            section {
                property: 'Name'
                delegate: SectionHeader { text: section }
            }
            delegate: ListItem {
                Text { text: Value; }
                onClicked: {
                    cur2 = Name
                    rate2 = Value.replace(/,/g, '.') - 0
                    dialog2.accept()
                }
            }
        }
    }
}
