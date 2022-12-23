import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    allowedOrientations: Orientation.All

    ListModel {
        id: recipesModel
        // Схема ListElement { name_pecipe: "Оливье"; image_recipe: "../images/olive.jpg"; }
    }

    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 100
        text: "Добавить рецепт"
        onClicked: {
            diag_page.openPage()
        }
    }

    SlideshowView {
        id: view
        anchors.verticalCenter: parent.verticalCenter
        height: width
        itemHeight: width
        itemWidth: width

        model: recipesModel
        delegate: Column {
            width: view.itemWidth;
            height: view.itemHeight;
            spacing: 25

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: name_pecipe
                font.pixelSize: 50
            }

            Image {
                id: image
                source: image_recipe
                height: page.width;
                width: page.width;
                fillMode: Image.PreserveAspectFit
            }

            Button {
                text: "Рецепт"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    console.log(name_pecipe);
                    recipe_page.showPageRecipe(name_pecipe)
                }
            }
        }
    }

    function selectRecipe() {
        recipesModel.clear();
        dao.retrieveRecipe(function(recipes) {
            for (var i = 0; i < recipes.length; i++) {
                var recipe = recipes.item(i);
                console.log("Название: " + recipe.name);
                console.log("Картинка: " + recipe.image);
                recipesModel.append({name_pecipe: recipe.name, image_recipe: recipe.image});
            }
        });
    }

    Component.onCompleted: selectRecipe();

}
