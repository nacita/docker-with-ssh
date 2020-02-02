# Custom Docker image with SSH

Run multiple docker container with ssh access.

## Usage

- Make sure you have docker installed on your machine and can run perfectly.
- Clone or download this repository:

```
git clone https://github.com/nacita/docker-with-ssh.git
cd docker-with-ssh
```

- Prepare the `peserta.csv` file, or whatever the name you define in variabel in `run.sh`. The content in csv file is something like this:

```
31	zaenal
32	juliansyah
33	Kawakib
```

- or just copy from the example:

```
cp peserta.csv.example peserta.csv
```

- Adjust the variable in the file `run.sh` or just leave the default.
- Give the script an executable flag with `chmod`

```
chmod +x run.sh
```

- execute the script with -s

```
./run.sh -s
```

## Screencast

[![asciicast](https://asciinema.org/a/EofB9u6rkBje4lEqkc0kxwJ3B.svg)](https://asciinema.org/a/EofB9u6rkBje4lEqkc0kxwJ3B)

## LICENSE

MIT
