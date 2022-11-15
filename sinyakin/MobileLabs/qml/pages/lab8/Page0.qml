import QtQuick 2.0
import Sailfish.Silica 1.0
import com.calculator 1.0

Page {

    PageHeader {
        objectName: "Счетчик"
        title: "Калькулятор"
        extraContent.children: [
            IconButton {
                objectName: "aboutButton"
                icon.source: "image://theme/icon-m-capslock"
                anchors.verticalCenter: parent.verticalCenter

                onClicked: {
                    pageStack.clear()
                    pageStack.replace(Qt.resolvedUrl("../MainPage.qml"))
                }
            }
        ]
    }


    Calculator {
        id: calculator
    }

    property double result: 0

    Column {
        id: column
        width: parent.width
        anchors.centerIn: parent
        spacing: 20

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            TextField {
                width: 200
                id: field1
                onTextChanged: calculator.m_num_1 = text - 0
            }
            TextField {
                width: 200
                id: field2
                onTextChanged: calculator.m_num_2 = text - 0
            }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 20
            Button {
                width: 200
                text: "+"
                onClicked: {
                    result = calculator.add()
                }
            }
            Button {
                width: 200
                text: "-"
                onClicked: {
                    result = calculator.sub()
                }
            }
        }

        Row {
            spacing: 20
            anchors.horizontalCenter: parent.horizontalCenter
            Button {
                    width: 200
                text: "*"
                onClicked: {
                    result = calculator.mul()
                }
            }
            Button {
                width: 200
                text: "/"
                onClicked: {
                    result = calculator.div()
                }
            }
        }


        Label {
            id: label;
            anchors.horizontalCenter: parent.horizontalCenter
            text: result
        }
    }

    IconButton {
        icon.source: "image://theme/icon-m-enter-next"
        onClicked: pageStack.push(Qt.resolvedUrl("Page2.qml"))
        x: parent.width - 100
        y: parent.height - 100
    }
}
