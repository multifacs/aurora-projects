import QtQuick 2.0
import Sailfish.Silica 1.0

Page {  
    PageHeader {
        objectName: "Лабораторные"
        title: "Мобильные системы"
    }

    Item {
        width: parent.width - 100
        height: parent.height - 400
        anchors.centerIn: parent

        SilicaGridView {
            cellWidth: width
            cellHeight: cellWidth / 5
            anchors.fill: parent

            model: ListModel {
                ListElement {
                    link: "lab2/Page1.qml"
                    name: "Лабораторная работа №2"
                    desc: "Кликер"
                }
                ListElement {
                    link: "lab3/Page1.qml"
                    name: "Лабораторная работа №3"
                    desc: "Контейнеры и позиционирование"
                }
                ListElement {
                    link: "lab4/Page1.qml"
                    name: "Лабораторная работа №4"
                    desc: "Базовые элементы GUI"
                }
                ListElement {
                    link: "lab5/Page01_1.qml"
                    name: "Лабораторная работа №5"
                    desc: "Работа со страницами и экраном"
                }
                ListElement {
                    link: "lab6/Page1.qml"
                    name: "Лабораторная работа №6"
                    desc: "JavaScript use"
                }
                ListElement {
                    link: "lab7/Page1.qml"
                    name: "Лабораторная работа №7"
                    desc: "Собственные компоненты"
                }
                ListElement {
                    link: "lab8/Page1.qml"
                    name: "Лабораторная работа №8"
                    desc: "Backend на C++"
                }
                ListElement {
                    link: "project/MainPage.qml"
                    name: "Проект"
                    desc: ""
                }
            }

            delegate: GridItem {

                Column {
                    anchors.verticalCenter: parent.verticalCenter
                    Label {
                        text: name
                    }
                    Label {
                        text: desc
                        font.pixelSize: 30
                        opacity: 0.5
                    }
                }

                onClicked: pageStack.replace(Qt.resolvedUrl(link))
            }
        }
    }
}
