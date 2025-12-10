from ignis import widgets
from ignis.services.hyprland import HyprlandService, HyprlandWorkspace

hyprland = HyprlandService.get_default()


class WorkspaceButton(widgets.Button):
    def __init__(self, workspace: HyprlandWorkspace) -> None:
        super().__init__(
            css_classes=["workspace", "unset"],
            on_click=lambda x: workspace.switch_to(),
            halign="start",
            valign="center",
            child=widgets.Label(label=id_to_kanji(workspace.id)),
        )
        if workspace.id == hyprland.active_workspace.id:
            self.add_css_class("active")


def id_to_kanji(id: int) -> str:
    match id:
        case 1:
            return "一"
        case 2:
            return "二"
        case 3:
            return "三"
        case 4:
            return "四"
        case 5:
            return "五"
        case 6:
            return "六"
        case 7:
            return "七"
        case 8:
            return "八"
        case 9:
            return "九"
        case 10:
            return "十"
        case _:
            return ""


class Workspaces(widgets.Box):
    def __init__(self):
        if hyprland.is_available:
            child = [
                widgets.EventBox(
                    css_classes=["workspaces"],
                    child=hyprland.bind_many(
                        ["workspaces", "active_workspace"],
                        transform=lambda workspaces, *_: [
                            WorkspaceButton(i) for i in workspaces
                        ],
                    ),
                )
            ]
        else:
            child = []
        super().__init__(child=child)
