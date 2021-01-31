This is a small repository containing a build script necessary to
recreate the vivado project that will upload a basic load-out
configuration for the SQRL Acorn CLE 215/215+ Artix7 FPGA board.

I have created a couple scripts for uploading the post-implementation
 .bit & .bin files using an FT232H based board (similar to a bus pirate
or a shikra).  These scripts specifically work with the Shikra
(https://int3.cc/products/the-shikra), but you can subsitute your own
custom interface script for the shikra script in the load scripts that
I have provided.

To load the provided designs using an FT232H board, you will need to build
openocd from the github source found here: https://github.com/ntfreak/openocd

After cloning the openocd git repository and running .bootstrap,
the following line in flash configuration file found at
openocd/src/flash/nor/spi.c from:

FLASH_ID("sp s25fl256s", 0x13, 0x00, 0x12, 0xdc, 0xc7, 0x00190201, 0x100, 0x10000, 0x800000),

to:

FLASH_ID("sp s25fl256s", 0x03, 0x00, 0x02, 0xd8, 0xc7, 0x00190201, 0x100, 0x10000, 0x800000),

Then run:

./configure --enable-ftdi && make && sudo make install

This will install openocd and allow you to use the provided scripts for loading
these designs onto the FPGA or its flash memory using a shikra (or your own
FT232H board)

The pinout and output frequencies for the Hirose DF52 connector mounted to the
board is provided below:

|----------------->  
|20---> GND  
|19---> 6.1  kHz  
|18---> 12.2 kHz  
|17---> GND  
|16---> 24.4 kHz  
|15---> 48.8 kHz  
|14---> GND  
|13---> 97.7 kHz  
|12---> 195  kHz  
|11---> GND  
|10---> 391  kHz  
|09---> 782  kHz  
|08---> GND  
|07---> 1.56 MHz  
|06---> 3.13 MHz  
|05---> GND  
|04---> 6.25 MHz  
|03---> 12.5 MHz  
|02---> 3.3V  
|01---> 3.3V  
|----------------->  

To get 3.3V operation on pins 15, 16, 18, and 19, you will need to remove the U11 regulator (schematic found here: https://raw.githubusercontent.com/RHSResearchLLC/NiteFury-and-LiteFury/master/Hardware/uEVB.pdf) and short the input and output pins together on the U11 pad.
