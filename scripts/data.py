from dataclasses import dataclass


@dataclass
class MonitorData:
    brightness: int | None
    contrast: int | None
