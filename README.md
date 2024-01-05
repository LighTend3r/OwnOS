# OwnOS
Creating x86 Kernel

I'm followinf this manual : https://littleosbook.github.io/

## Installation

```
git clone https://github.com/LighTend3r/OwnOS.git

sudo apt-get install build-essential nasm xorriso grub-pc-bin bochs bochs-sdl
```

## Launch

```
make run
```


Step : (The last step is the real step)
- For this moment, just run make an error, but if you press "c" on Bochs, you can see "Hello, World!"
- Writing Hello, World! on com1.com, we would have to rearrange the kmain.c file
