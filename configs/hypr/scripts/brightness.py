import subprocess


def get_current_brightness():
    data = subprocess.run(
        ["hyprctl", "hyprsunset", "gamma"], capture_output=True, text=True
    )
    value = None

    for line in data.stdout.split("\n"):
        if len(line) > 0:
            value = int(line)

    if value is None:
        raise ValueError("Can't get brightness value")

    return value


def set_brightness(value: int):
    subprocess.run(["hyprctl", "hyprsunset", "gamma", str(value)])
