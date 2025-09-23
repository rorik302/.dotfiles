import subprocess


class DDCUtil:
    def __init__(self, monitor_bus: int):
        self.monitor_bus = monitor_bus

    def get_current_brightness(self):
        data = subprocess.run(
            [
                "ddcutil",
                "getvcp",
                "10",
                "-b",
                str(self.monitor_bus),
                "--skip-ddc-checks",
            ],
            capture_output=True,
            text=True,
        )
        if "current value" in data.stdout:
            return int(data.stdout.split("current value =")[1].split(",")[0].strip())

    def get_current_contrast(self):
        data = subprocess.run(
            [
                "ddcutil",
                "getvcp",
                "12",
                "-b",
                str(self.monitor_bus),
                "--skip-ddc-checks",
            ],
            capture_output=True,
            text=True,
        )
        if "current value" in data.stdout:
            return int(data.stdout.split("current value =")[1].split(",")[0].strip())

    def set_brightness(self, value: str):
        subprocess.run(
            [
                "ddcutil",
                "setvcp",
                "10",
                value,
                "-b",
                str(self.monitor_bus),
                "--skip-ddc-checks",
            ]
        )

    def set_contrast(self, value: str):
        subprocess.run(
            [
                "ddcutil",
                "setvcp",
                "12",
                value,
                "-b",
                str(self.monitor_bus),
                "--skip-ddc-checks",
            ]
        )
