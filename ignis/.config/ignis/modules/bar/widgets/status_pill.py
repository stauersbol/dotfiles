from ignis.services.audio import AudioService
from ignis.widgets import Widget

audio = AudioService.get_default()


class IndicatorIcon(Widget.Icon):
    def __init__(self, css_classes: list[str] = [], **kwargs):
        super().__init__(
            style="margin-right: 0.5rem;", css_classes=["unset"] + css_classes, **kwargs
        )


class VolumeIcon(IndicatorIcon):
    def __init__(self):
        super().__init__(
            image=audio.speaker.bind("icon_name"),
        )


def calc_volume():
    current_level: float = audio.speaker.volume

    current_level_int = int(current_level * 100)
    return max(current_level_int, 0)


class VolumeNumber(Widget.Label):
    def __init__(self):
        super().__init__(label=calc_volume())


class StatusPill(Widget.Button):
    def __init__(self, monitor: int):
        self._monitor = monitor

        super().__init__(child=Widget.Box(child=[VolumeIcon(), VolumeNumber()]))
