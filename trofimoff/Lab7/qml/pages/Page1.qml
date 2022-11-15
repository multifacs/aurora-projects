import QtQuick 2.0
import Sailfish.Silica 1.0
import com.calc 1.0

Page {
    id: page
    allowedOrientations: Orientation.All

    Calc {
        id: calc
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
                onTextChanged: calc.m_num_1 = text - 0
            }
            TextField {
                width: 200
                id: field2
                onTextChanged: calc.m_num_2 = text - 0
            }
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "+"
            onClicked: {
                result = calc.add()
            }
        }
        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "-"
            onClicked: {
                result = calc.sub()
            }
        }
        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "*"
            onClicked: {
                result = calc.mul()
            }
        }
        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "/"
            onClicked: {
                if (calc.getNum2() !== 0) {
                    result = calc.div()
                }
            }
        }

        Label {
            id: label;
            anchors.horizontalCenter: parent.horizontalCenter
            text: result
            font.pixelSize: Theme.fontSizeExtraLarge
        }
    }

}
