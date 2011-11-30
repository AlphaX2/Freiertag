import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    id: resultPage
    tools: commonTools

    orientationLock: PageOrientation.LockPortrait

    property alias holidayList: result_ListModel
    property alias blandText: headertitle.text
    property alias ferienText: footerFerien.text
    property alias jahrText: footerJahr.text

    ToolBarLayout {
        id: commonTools
        visible: true
        ToolIcon {
            platformIconId: "toolbar-view-menu"
            anchors.right: (parent === undefined) ? undefined : parent.right
            onClicked: (myMenu.status == DialogStatus.Closed) ? myMenu.open() : myMenu.close()
        }
        ToolIcon {
            platformIconId: "toolbar-back"
            anchors.left: (parent === undefined) ? undefined : parent.left
            onClicked: pageStack.pop()
        }
    }

    Item {
     id: header

     Label {
     id: headertitle
     text: "Bundesland X"
     font {pixelSize: 35 ; bold: false; family: "Nokia Pure Text Light"}
     color: "#298ede"
     anchors.left: parent.left
     anchors.leftMargin: 20
     anchors.top: parent.top
     anchors.topMargin: 10
     }

     Label {
         id: footerFerien
         text: "Ferien/Feiertage"
         font {pixelSize: 20; family: "Nokia Pure Text Light"}
         color: "black"
         anchors {top: headertitle.bottom; topMargin: 5; left: parent.left; leftMargin: 20}
     }

     Label {
         id: footerJahr
         text: "Jahr X"
         font {pixelSize: 20; family: "Nokia Pure Text Light"}
         color: "black"
         anchors {top: headertitle.bottom; topMargin: 5; left: footerFerien.right; leftMargin: 10}
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

    ListView{
        id: resultList
        width: 480
        height: 630
        anchors.top: parent.top
        anchors.topMargin: 100
        clip: true
        delegate: resultDelegation

        model: ListModel {
            id:result_ListModel
        }
    }

    ScrollDecorator { flickableItem: resultList }

    Component {
        id: resultDelegation

        Column{
            Rectangle {
                color: "lightgrey"
                height: holidayText.height+5
                width: 480
                radius: 5

                Text {
                    id: holidayText
                    anchors {left: parent.left; leftMargin: 10; verticalCenter: parent.verticalCenter}
                    color: "#191919"
                    text: name
                    font {pixelSize: 28; bold: true; family: "Nokia Pure Text Light"}

                    }
            }

            Text {
                anchors {left: parent.left; leftMargin: 20; top: parent.top; topMargin: 40}
                text: date
                color: "#191919"
                font {pixelSize: 24; family: "Nokia Pure Text"}

            }

            Rectangle {
                width: 480
                height: 20
                color: "transparent"
            }
        }
    }
}
