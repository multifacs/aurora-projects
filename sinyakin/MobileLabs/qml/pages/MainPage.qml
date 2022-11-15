import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "Лабораторные"
    }

        Column {
            spacing: 20
            anchors.centerIn: parent

            Button {
                text: "Lab2"
                onClicked: pageStack.replace(Qt.resolvedUrl("lab2/Page1.qml"))
            }
            Button {
                text: "Lab3"
                onClicked: pageStack.replace(Qt.resolvedUrl("lab3/Page1.qml"))
            }

            Button {
                text: "Lab4"
                onClicked: pageStack.replace(Qt.resolvedUrl("lab4/Page1.qml"))
            }

            Button {
                text: "Lab5"
                onClicked: pageStack.replace(Qt.resolvedUrl("lab5/Page01_1.qml"))
            }

            Button {
                text: "Lab6"
                onClicked: pageStack.replace(Qt.resolvedUrl("lab6/Page1.qml"))
            }

            Button {
                text: "Lab7"
                onClicked: pageStack.replace(Qt.resolvedUrl("lab7/Page1.qml"))
            }

            Button {
                text: "Lab8"
                onClicked: pageStack.replace(Qt.resolvedUrl("lab8/Page0.qml"))
            }

            Button {
                text: "Project"
                onClicked: pageStack.replace(Qt.resolvedUrl("project/MainPage.qml"))
            }
        }
}
