import subprocess


def get_current_brightness():
    data = subprocess.run(["ddcutil", "getvcp", "10"], capture_output=True, text=True)
    value = None

    for line in data.stdout.split("\n"):
        if "current value" in line and "=" in line:
            value = int(line.split("=")[1].strip().split(",")[0])

    if value is None:
        raise ValueError("Can't get brightness value")

    return value


def set_brightness(value: int):
    subprocess.run(["ddcutil", "setvcp", "10", str(value)])
