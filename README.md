# Audio to MP3 Conversion Script

This Bash script, released under the GNU General Public License version 3 (GPL-3.0), enables the conversion of various audio file formats to MP3. It utilizes `ffmpeg` for conversion and supports formats such as WAV, FLAC, OGG, OPUS, and M4A.

## Installation

### Dependencies

Ensure that `ffmpeg` is installed on your system. You can install it using the package manager of your Linux distribution.

#### Debian-based Systems (e.g., Debian, Ubuntu)

```bash
sudo apt-get update
sudo apt-get install ffmpeg
```

#### Fedora

```bash
sudo dnf install ffmpeg
```

#### Arch Linux

```bash
sudo pacman -S ffmpeg
```

### Permission and Execution

1. Clone the repository:

```bash
git clone https://gitlab.com/hecdelatorre/audio-to-mp3-conversion-script.git
```

2. Change into the script directory:

```bash
cd audio-to-mp3-conversion-script
```

3. Give execution permission:

```bash
chmod +x index.sh
```

4. Run the script:

```bash
./index.sh
```

### Run without Cloning

You can run the script directly without cloning the repository using the following command:

```bash
bash -c "$(curl -fsSL https://gitlab.com/hecdelatorre/audio-to-mp3-conversion-script/-/raw/main/index.sh)"
```

## Usage

1. The script will prompt you to enter a directory path.
2. It identifies and lists audio files in the specified directory (excluding `.mp3`).
3. You can choose to continue with the conversion or abort.
4. Converted files are saved as MP3, and the original files are deleted.

## License

This script is licensed under the [GNU General Public License version 3 (GPL-3.0)](LICENSE).
