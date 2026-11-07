import QtQuick
import Quickshell
import qs.Ui
import qs.Commons

BarWidget {
  id: root
  moduleName: "omarchy.menu"

  property string omarchyPath: Quickshell.env("OMARCHY_PATH") || (Quickshell.env("HOME") + "/shells/omarchy")

  FontLoader {
    id: omarchyFont
    source: "file://" + root.omarchyPath + "/default/fonts/omarchy/omarchy.ttf"
  }

  readonly property string customIcon: setting("icon", "")

  implicitWidth: button.implicitWidth
  implicitHeight: button.implicitHeight

  BarIconButton {
    id: button
    anchors.fill: parent
    bar: root.bar
    text: root.customIcon !== "" ? root.customIcon : "\ue900"
    fontFamily: root.customIcon !== "" ? Style.font.family : (omarchyFont.name || "omarchy")
    onPressed: function(button) {
      if (!root.bar) return
      if (button === Qt.RightButton) root.bar.run("xdg-terminal-exec")
      else root.bar.run("omarchy-shell shell toggle omarchy.menu '{\"menu\":\"root\"}'")
    }
  }
}
