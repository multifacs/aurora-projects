import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    allowedOrientations: Orientation.All

    SilicaListView {
        id: listView1
        model: 1
        anchors.fill: parent
        header: PageHeader {
            title: name_data
        }

        delegate: TextArea {
            id: ta_1
            readOnly: true
            text: ingr_data + "\n\n" + desc_data
        }
        VerticalScrollDecorator {}
    }

    function showPageRecipe(name_recipe) {
        pageStack.animatorPush(Qt.resolvedUrl("SecondPage.qml"))
        name_data = name_recipe;
        ingr_data =  dao.getIngredients(name_recipe);
        desc_data = dao.getDescription(name_recipe);
    }
}
