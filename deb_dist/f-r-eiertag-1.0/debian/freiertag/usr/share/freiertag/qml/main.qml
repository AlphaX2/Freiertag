import QtQuick 1.1
import com.nokia.meego 1.0

PageStackWindow {
    id: appWindow
    initialPage: mainPage

//some functions
    function create_listview(list)
            {
                var i = 0
                resultPage.holidayList.clear()
                for (i = 0; i<list.length; i++){
                    resultPage.holidayList.append({"name": list[i], "date": list[i+1]})
                    i++
                }
            }

//Pages of the App
    MainPage {
        id: mainPage
    }

    ResultPage {
        id: resultPage
    }

    ToolBarLayout {
        id: commonTools
        visible: true
        ToolIcon {
            platformIconId: "toolbar-view-menu"
            anchors.right: (parent === undefined) ? undefined : parent.right
            onClicked: (myMenu.status == DialogStatus.Closed) ? myMenu.open() : myMenu.close()
        }
    }

//Menu
    Menu {
        id: myMenu
        visualParent: pageStack
        MenuLayout {
            MenuItem { text: qsTr("Information"); onClicked: {infoDialog.open()} }
        }
    }

    QueryDialog {
        id: infoDialog

        Text {
            width: parent.width

            font {family: "Nokia Pure Text Light"; pixelSize: 24}
            color: "white"
            anchors.verticalCenter: parent.verticalCenter
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            text:"<b><font size='4'>Informationen</font></b><br><br>Mit Freiertag können die Schulferien, als auch die Feiertage aller deutschen Bundesländer abgefragt werden. Der SourceCode der Anwendung wird unter den Bedingungeen der GPL3 Lizenz veröffentlicht.<br><br>Autor:<br>Gabriel Böhme<br><br>E-Mail: m.gabrielboehme@googlemail.com<br><br>Datenquelle:<br>www.schulferien.org/iCal/"
        }
    }
}
