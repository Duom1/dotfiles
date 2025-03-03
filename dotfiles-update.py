#!/bin/python3

from os.path import expanduser
import tomllib as toml
import subprocess
import shutil
import os
import glob
import multiprocessing
import sys

SUDO = "sudo"

def loadConfig():
    s: str = ""
    with open("./config.toml", "r") as f:
        s = f.read()
    return toml.loads(s)

def getLinuxDistro():
    """
    Get the current Linux distribution name.
    :return: String representing the Linux distribution name.
    """
    try:
        with open("/etc/os-release", "r") as f:
            for line in f:
                if line.startswith("PRETTY_NAME"):
                    return line.split("=")[1].strip().strip('"')
    except FileNotFoundError:
        return "Unknown Linux Distribution"

def neutralizePakages(p, distro) :
    a = []
    for x in p:
        if distro == "Arch Linux":
            if type(x) != str:
                a.append(x[1])
            else:
                a.append(x)
    return a

def installProgram(p):
    distro = getLinuxDistro()
    if distro == "Arch Linux":
        a = neutralizePakages(p, distro)
        try:
            subprocess.run(["yay", "-S", *a])
        except FileNotFoundError:
            print("please install yay:\n" 
                    "git clone https://aur.archlinux.org/yay.git --depth 1 && "
                    "cd yay && makepkg -si")
            sys.exit(1)
    else:
        print(f"Unable to install packages on {distro}")

def ensureInstalled(p: list[str]):
    toInstall = []
    for program in p:
        bak = program
        if type(program) != str:
            program = program[0]
        if not shutil.which(program):
            print(f"unable to find with shutil {program}")
            toInstall.append(bak)
    if toInstall != []:
        installProgram(toInstall)

def ensureInstalledLibs(p: list[str]):
    toInstall = []
    for lib in p:
        bak = lib
        if type(lib) != str:
            lib = lib[0]
        if not checkLibInstalled(lib):
            print(f"unable to find {lib}")
            toInstall.append(bak)
    if toInstall != []:
        installProgram(toInstall)

def checkLibInstalled(lib):
    """
    Check if certain libraries are installed using pkg-config.
    :param libraries: List of library names as strings.
    :return: Dictionary with library names as keys and boolean values indicating installation status.
    """
    try:
        subprocess.run(["pkg-config", "--exists", lib], check=True)
        return True
    except subprocess.CalledProcessError:
        return False

def elementary(a):
    if (a["install"]):
        if not os.path.isdir("./elementary"):
            subprocess.run(["git", "clone", a["repo"], "--depth", "1", "elementary"])
        files = glob.glob("./elementary/backgrounds/*")
        subprocess.run(["cp", *files, "./Wallpapers"])

def wallpaperDir():
    if not os.path.isdir("./Wallpapers"):
        os.makedirs("./Wallpapers")

def fontsDir():
    if not os.path.isdir("./fonts"):
        os.makedirs("./fonts")

def fossDir():
    if not os.path.isdir(expanduser("~/code/foss")):
        os.makedirs(expanduser("~/code/foss"))

def fonts(a):
    if (a["enable"]):
        for i in a:
            i = a[i]
            if type(i) == bool:
                continue
            if ["enable"]:
                subprocess.run(["wget", i["link"]])
                subprocess.run(["mv", i["name"], "./fonts"])
                subprocess.run(["unzip", f"./fonts/{i['name']}", "-d", "./fonts"])
        a = glob.glob("./fonts/*.ttf")
        subprocess.run([SUDO, "cp", *a, "/usr/share/fonts"])

def suckless(a):
    for i in a:
        if not a[i]["enable"]:
            continue
        os.chdir(expanduser("~/code/foss/"))
        dir = expanduser(f"~/code/foss/{i}")
        if not os.path.isdir(dir):
            subprocess.run(["git", "clone", a[i]["source"]])
        os.chdir(dir)
        subprocess.run([SUDO, "make", "clean", "all", "install", "-j", str(multiprocessing.cpu_count())])
    setDefDir()

def wal(a):
    wallpaper = "./Wallpapers/" + a["wallpaper"]
    if a["enable"]:
        subprocess.run(["wal", "-nsti", wallpaper])
        if not os.path.isdir(expanduser("~/.local/share/rofi/themes")):
            os.makedirs(expanduser("~/.local/share/rofi/themes"))
        subprocess.run(["cp", expanduser("~/.cache/wal/colors-rofi-dark.rasi"), expanduser("~/.local/share/rofi/themes/")])
        if (sedInplaceCheck()):
            subprocess.run(["sed", "-i", "/SchemeUrg/d", expanduser("~/.cache/wal/colors-wal-dwm.h")])
        else:
            print("manual intervension for ~/.cache/wal/colors-wal-dwm.h is needed since sed inplace is not supported")

def setDefDir():
    os.chdir(os.path.dirname(os.path.abspath(__file__)))

def isLinkToTarget(file_path: str, target_path: str) -> bool:
    """
    Check if a file is a symbolic link to a specific target file.
    
    :param file_path: Path to the file to check.
    :param target_path: Expected target of the symbolic link.
    :return: True if file_path is a symlink to target_path, False otherwise.
    """
    if not os.path.islink(file_path):
        return False
    
    actual_target = os.readlink(file_path)
    return os.path.abspath(actual_target) == os.path.abspath(target_path)

def link(a):
    if not a["enable"]:
        return
    for i in a:
        i = a[i]
        if type(i) == bool:
            continue
        if not i["enable"]:
            continue
        dest = expanduser(i["dest"])
        destPath = os.path.dirname(dest)
        source = os.path.abspath(i["source"])
        if not os.path.isdir(destPath):
            os.makedirs(destPath)
        if isLinkToTarget(dest, source):
            print(f"link {dest} already exists")
            continue
        elif os.path.isfile(dest):
            print(f"not replacing {dest} because it exists")
            continue
        subprocess.run(["ln", "-s", source, dest])
        print(f"created symlink {dest} -> {source}")

def sedInplaceCheck():
    try:
        result = subprocess.run(["sed", "--help"], stderr=subprocess.PIPE, stdout=subprocess.PIPE, text=True)
        return "-i[SUFFIX]" in result.stdout or "-i[SUFFIX]" in result.stderr
    except FileNotFoundError:
        return False

def nvim(a):
    if a["astronvim"]:
        subprocess.run(["mv", expanduser("~/.config/nvim"), expanduser("~/.config/nvim.bak")])
        subprocess.run(["git", "clone", "--depth", "1", "https://github.com/AstroNvim/template", expanduser("~/.config/nvim")])
        extra = ""
        with open("./nvim-extra.lua", "r") as f:
            extra = f.read()
        with open(expanduser("~/.config/nvim/init.lua"), "a") as f:
            f.write(extra)

def main():
    setDefDir()
    config = loadConfig()
    wallpaperDir()
    fontsDir()
    fossDir()
    ensureInstalled(config["ensure_installed"]["programs"])
    ensureInstalledLibs(config["ensure_installed"]["libs"])
    elementary(config["wallpaper_and_theme"]["elementary"])
    fonts(config["wallpaper_and_theme"]["fonts"])
    link(config["link"])
    wal(config["wallpaper_and_theme"]["wal"])
    suckless(config["suckless"])
    nvim(config["nvim"])

if __name__ == "__main__":
    main()
