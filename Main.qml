import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Window {
    width: 320
    height: 480
    visible: true
    title: qsTr("Калькулятор")

    Rectangle {
        id: _rect1
        width: parent.width
        height: parent.height * 0.33
        color: "#202020"

        TextInput {
            id: _txtInput
            rightPadding: 10
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            text: ""
            color: "#ffffff"
            font.pointSize: 24
            validator: RegularExpressionValidator {
                regularExpression: /^[0-9]+[.]?[0-9]*([-+/*]?[0-9]+[.]?[0-9]*)+[=]$/
            }
        }
    }

    Rectangle {
        id: _rect2
        anchors.top: _rect1.bottom
        anchors.bottom: parent.bottom
        width: parent.width
        color: "#202020"

        GridLayout {
            columns: 4
            rows: 5
            width: parent.width
            height: parent.height

            RadioButton {
                Layout.column: 0
                Layout.row: 0
                id: _rButtonIntLib
                text: "INT"

                //onClicked: _txtInput.text += "/"
                indicator: Rectangle {
                    implicitWidth: 13
                    implicitHeight: 13
                    x: _rButtonIntLib.leftPadding
                    y: parent.height / 2 - height / 2
                    radius: 13
                    border.color: _rButtonIntLib.down ? "#17a81a" : "#21be2b"

                    Rectangle {
                        width: 7
                        height: 7
                        x: 3
                        y: 3
                        radius: 7
                        color: _rButtonIntLib.down ? "#17a81a" : "#21be2b"
                        visible: _rButtonIntLib.checked
                    }
                }

                contentItem: Text {
                    text: _rButtonIntLib.text
                    font: _rButtonIntLib.font
                    color: _rButtonIntLib.down ? "#ffffff" : "#dddddd"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _rButtonIntLib.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5
                }
            }

            RadioButton {
                Layout.column: 1
                Layout.row: 0
                id: _rButtonExtLib
                text: "EXT"
                //onClicked: _txtInput.text += "/"

                indicator: Rectangle {
                    implicitWidth: 13
                    implicitHeight: 13
                    x: _rButtonExtLib.leftPadding
                    y: parent.height / 2 - height / 2
                    radius: 13
                    border.color: _rButtonExtLib.down ? "#17a81a" : "#21be2b"

                    Rectangle {
                        width: 7
                        height: 7
                        x: 3
                        y: 3
                        radius: 7
                        color: _rButtonExtLib.down ? "#17a81a" : "#21be2b"
                        visible: _rButtonExtLib.checked
                    }
                }

                contentItem: Text {
                    text: _rButtonExtLib.text
                    font: _rButtonExtLib.font
                    color: _rButtonExtLib.down ? "#ffffff" : "#dddddd"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _rButtonExtLib.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5
                }
            }

            Button {
                Layout.column: 2
                Layout.row: 0
                id: _buttonCancel
                text: "CE"
                onClicked: _txtInput.text = ""
                flat: true

                contentItem: Text {
                    text: _buttonCancel.text
                    font: _buttonCancel.font
                    color: _buttonCancel.down ? "#ffffff" : "#dddddd"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _buttonCancel.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5
                }
            }

            Button {
                Layout.column: 3
                Layout.row: 0
                id: _buttonDev
                text: "/"
                onClicked: _txtInput.text += "/"
                flat: true

                contentItem: Text {
                    text: _buttonDev.text
                    font: _buttonDev.font
                    color: _buttonDev.down ? "#ffffff" : "#dddddd"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _buttonDev.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5
                }
            }

            Button {
                Layout.column: 0
                Layout.row: 1
                id: _button7
                text: "7"
                onClicked: _txtInput.text += "7"
                flat: true

                contentItem: Text {
                    text: _button7.text
                    font: _button7.font
                    color: _button7.down ? "#ffffff" : "#dddddd"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _button7.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5
                    }
                }

            Button {
                Layout.column: 1
                Layout.row: 1
                id: _button8
                text: "8"
                onClicked: _txtInput.text += "8"
                flat: true

                contentItem: Text {
                    text: _button8.text
                    font: _button8.font
                    color: _button8.down ? "#ffffff" : "#dddddd"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _button8.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5
                }
            }

            Button {
                Layout.column: 2
                Layout.row: 1
                id: _button9
                text: "9"
                onClicked: _txtInput.text += "9"
                flat: true

                contentItem: Text {
                    text: _button9.text
                    font: _button9.font
                    color: _button9.down ? "#ffffff" : "#dddddd"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _button9.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5
                }
            }

            Button {
                Layout.column: 3
                Layout.row: 1
                id: _buttonMul
                text: "*"
                onClicked: _txtInput.text += "*"
                flat: true

                contentItem: Text {
                    text: _buttonMul.text
                    font: _buttonMul.font
                    color: _buttonMul.down ? "#ffffff" : "#dddddd"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _buttonMul.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5
                }
            }

            Button {
                Layout.column: 0
                Layout.row: 2
                id: _button4
                text: "4"
                onClicked: _txtInput.text += "4"
                flat: true

                contentItem: Text {
                    text: _button4.text
                    font: _button4.font
                    color: _button4.down ? "#ffffff" : "#dddddd"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _button4.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5
                }
            }

            Button {
                Layout.column: 1
                Layout.row: 2
                id: _button5
                text: "5"
                onClicked: _txtInput.text += "5"
                flat: true

                contentItem: Text {
                    text: _button5.text
                    font: _button5.font
                    color: _button5.down ? "#ffffff" : "#dddddd"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _button5.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5
                }
            }

            Button {
                Layout.column: 2
                Layout.row: 2
                id: _button6
                text: "6"
                onClicked: _txtInput.text += "6"
                flat: true

                contentItem: Text {
                    text: _button6.text
                    font: _button6.font
                    color: _button6.down ? "#ffffff" : "#dddddd"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _button6.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5
                }
            }

            Button {
                Layout.column: 3
                Layout.row: 2
                id: _buttonMin
                text: "-"
                onClicked: _txtInput.text += "-"
                flat: true

                contentItem: Text {
                    text: _buttonMin.text
                    font: _buttonMin.font
                    color: _buttonMin.down ? "#ffffff" : "#dddddd"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _buttonMin.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5
                }
            }

            Button {
                Layout.column: 0
                Layout.row: 3
                id: _button1
                text: "1"
                onClicked: _txtInput.text += "1"
                flat: true

                contentItem: Text {
                    text: _button1.text
                    font: _button1.font
                    color: _button1.down ? "#ffffff" : "#dddddd"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _button1.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5
                }
            }

            Button {
                Layout.column: 1
                Layout.row: 3
                id: _button2
                text: "2"
                onClicked: _txtInput.text += "2"
                flat: true

                contentItem: Text {
                    text: _button2.text
                    font: _button2.font
                    color: _button2.down ? "#ffffff" : "#dddddd"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _button2.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5
                }
            }

            Button {
                Layout.column: 2
                Layout.row: 3
                id: _button3
                text: "3"
                onClicked: _txtInput.text += "3"
                flat: true

                contentItem: Text {
                    text: _button3.text
                    font: _button3.font
                    color: _button3.down ? "#ffffff" : "#dddddd"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _button3.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5
                }
            }

            Button {
                Layout.column: 3
                Layout.row: 3
                id: _buttonPlu
                text: "+"
                onClicked: _txtInput.text += "+"
                flat: true

                contentItem: Text {
                    text: _buttonPlu.text
                    font: _buttonPlu.font
                    color: _buttonPlu.down ? "#ffffff" : "#dddddd"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _buttonPlu.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5
                }
            }

            Button {
                Layout.column: 1
                Layout.row: 4
                id: _button0
                text: "0"
                onClicked: _txtInput.text += "0"
                flat: true

                contentItem: Text {
                    text: _button0.text
                    font: _button0.font
                    color: _button0.down ? "#ffffff" : "#dddddd"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _button0.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5
                }
            }

            Button {
                Layout.column: 2
                Layout.row: 4
                id: _buttonDot
                text: "."
                onClicked: _txtInput.text += "."
                flat: true

                contentItem: Text {
                    text: _buttonDot.text
                    font: _buttonDot.font
                    color: _buttonDot.down ? "#ffffff" : "#dddddd"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _buttonDot.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5
                }
            }

            Button {
                Layout.column: 3
                Layout.row: 4
                id: _buttonEqu
                text: "="
                onClicked: _txtInput.text += "="
                flat: true

                contentItem: Text {
                    text: _buttonEqu.text
                    font: _buttonEqu.font
                    color: _buttonEqu.down ? "#ffffff" : "#dddddd"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                background: Rectangle {
                    implicitWidth: (_rect2.width / 4 - 10)
                    implicitHeight: (_rect2.height / 5 - 10)
                    color: _buttonEqu.down ? "#3b3b3b" : "#323232"
                    border.color: "#202020"
                    border.width: 1
                    radius: 5
                }
            }
        }
    }
}
