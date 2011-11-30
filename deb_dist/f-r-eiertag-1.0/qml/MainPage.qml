import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    id: mainPage
    tools: commonTools

    orientationLock: PageOrientation.LockPortrait

    Item {
    id: header

    Label {
    id: headertitle
    text: "Freiertag"
    font {pixelSize: 60; bold: false; family: "Nokia Pure Text Light"}
    color: "#298ede"
    anchors.left: parent.left
    anchors.leftMargin: 20
    anchors.top: parent.top
    anchors.topMargin: 10
    }

    Rectangle {
        id: headerline_p1
        width: mainPage.width
        height: 2
        color: "lightgrey"
        anchors.top: parent.top
        anchors.topMargin: 80
    }

    Rectangle {
        id: headerline_p2
        width: mainPage.width
        height: 2
        color: "white"
        anchors.top: headerline_p1.bottom
    }

   }

        Rectangle {
            id: bland_line
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 110
            width: 380
            height: 1
            color: "white"


            Text {
                text: "Bundesland"
                font.pixelSize: 14
                font.family: "Nokia Pure Text"
                color: "darkgrey"
                anchors.left: bland_line.right
                anchors.leftMargin: 10
                anchors.verticalCenter: bland_line.verticalCenter
            }
        }


    Button {
        id: land_button
        width: 400
        text: dialog_bundesland.model.get(dialog_bundesland.selectedIndex).name

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 130

        onClicked: dialog_bundesland.open()

        Image {
                source: "image://theme/meegotouch-combobox-indicator"
                anchors.left: parent.right
                anchors.leftMargin: -50
                anchors.verticalCenter: parent.verticalCenter
            }
    }

    Rectangle {
        id: jahr_line
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 210
        width: 425
        height: 1
        color: "white"


        Text {
            text: "Jahr"
            font.pixelSize: 14
            font.family: "Nokia Pure Text"
            color: "darkgrey"
            anchors.left: jahr_line.right
            anchors.leftMargin: 10
            anchors.verticalCenter: jahr_line.verticalCenter
        }
    }

    Button {
        id: jahr_button        
        text: dialog_jahr.model.get(dialog_jahr.selectedIndex).name

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 230

        onClicked: dialog_jahr.open()

        Image {
                source: "image://theme/meegotouch-combobox-indicator"
                anchors.left: parent.right
                anchors.leftMargin: -50
                anchors.verticalCenter: parent.verticalCenter
            }
        }

    Rectangle {
        id: auswahl_line
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 310
        width: 410
        height: 1
        color: "white"


        Text {
            text: "Ferien"
            font.pixelSize: 14
            font.family: "Nokia Pure Text"
            color: "darkgrey"
            anchors.left: auswahl_line.right
            anchors.leftMargin: 10
            anchors.verticalCenter: auswahl_line.verticalCenter
        }
    }

    ButtonColumn {
        id: ferien_auswahl
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 330
        checkedButton: ferien_button

        Button {
            id: ferien_button
            text: "Schulferien"
            onClicked: {
                pyfunc.holidayKind(String(ferien_button.text))
            }
        }

        Button {
            id: feiertag_button
            text: "gesetzliche Feiertage"
            onClicked: {
                pyfunc.holidayKind(String(feiertag_button.text))
            }
        }
        Button {
            id: feiertag_alle_button
            text: "alle Feiertage"
            onClicked: {
                pyfunc.holidayKind(String(feiertag_alle_button.text))
            }
        }
    }

    Button {
        id: such_button
        objectName: "such_button"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 600
        width: 300
        height: 70

        //text: "Suchen"
        iconSource: "image://theme/icon-m-toolbar-search"

        onClicked: {
            pageStack.push(resultPage)
            //create_listview(results)
            console.log(ferien_button.text)
            resultPage.blandText = dialog_bundesland.model.get(dialog_bundesland.selectedIndex).name
            resultPage.jahrText = dialog_jahr.model.get(dialog_jahr.selectedIndex).name
            resultPage.ferienText = ferien_auswahl.checkedButton.text
        }
    }

    SelectionDialog {
             id: dialog_bundesland
             titleText: "Welches Bundesland?"
             selectedIndex: 0

             model: ListModel {
                 ListElement { name: "Baden-Württemberg" }
                 ListElement { name: "Bayern" }
                 ListElement { name: "Berlin" }
                 ListElement { name: "Brandenburg" }
                 ListElement { name: "Bremen" }
                 ListElement { name: "Hamburg" }
                 ListElement { name: "Hessen" }
                 ListElement { name: "Mecklenburg-Vorpommern" }
                 ListElement { name: "Niedersachsen" }
                 ListElement { name: "Nordrhein-Westfalen" }
                 ListElement { name: "Rheinland-Pfalz" }
                 ListElement { name: "Saarland" }
                 ListElement { name: "Sachsen" }
                 ListElement { name: "Sachsen-Anhalt" }
                 ListElement { name: "Schleswig-Holstein" }
                 ListElement { name: "Thüringen" }
             }

             onAccepted: {
                 pyfunc.blandIndex(String(dialog_bundesland.model.get(dialog_bundesland.selectedIndex).name))
             }

         }

    SelectionDialog {
         id: dialog_jahr
         titleText: "Welches Jahr?"
         selectedIndex: 0

         model: ListModel {
             ListElement { name: "2011" }
             ListElement { name: "2012" }
             ListElement { name: "2013" }
             }

         onAccepted: {
             pyfunc.jahrIndex(String(dialog_jahr.model.get(dialog_jahr.selectedIndex).name))
             }
        }
}
