# NyankoMobile

A mobile version of Nyanko.

## Setup

You should be able to open this project in Android Studio and build easily however it is important
to first compile the `libnyanko_c` dynamic library by going to the
[`nyanko` repository](https://github.com/HiruNya/nyanko) and building the `nyanko_c` package
to the target required.
After compilation, place that binary into `android/app/src/main/jniLibs/{architecture}`
where architecture is the architecture that the library is built for.
e.g. i868 is put underneath the `x86` folder.
