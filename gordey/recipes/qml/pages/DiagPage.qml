import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    allowedOrientations: Orientation.All

    Column {
        anchors.centerIn: parent
        spacing: 100;

        TextField {
            id: tf_name;
            placeholderText: "название"
            wrapMode: Text.WordWrap;
            width: 600

        }

        TextField {
            id: tf_ing;
            placeholderText: "Ингредиенты"
            wrapMode: Text.WordWrap;

        }

        TextField {
            id: tf_desk;
            placeholderText: "Описание"
            wrapMode: Text.WordWrap;

        }

        TextField {
            id: tf_img;
            text: "../images/domashnie-pelmeni.jpg"
            placeholderText: "Путь к изображению"
            wrapMode: Text.WordWrap;
        }

        Button {
            text: "Добавить"
            onClicked: {
                dao.newRecipe(tf_name.text, tf_ing.text, tf_desk.text, tf_img.text);
                pageStack.pop()
            }
        }

    }

    function openPage() {
        pageStack.animatorPush(Qt.resolvedUrl("DiagPage.qml"))
    }
}
