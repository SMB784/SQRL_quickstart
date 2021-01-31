# basic constraints for blinky

# 200 MHz LVDS clock
# Bank 15 is 1.5V so externally terminated
# see AR43989 for details

set_property PACKAGE_PIN J19 [get_ports CLK_P]
set_property IOSTANDARD LVDS_25 [get_ports CLK_P]
set_property PACKAGE_PIN H19 [get_ports CLK_N]
set_property IOSTANDARD LVDS_25 [get_ports CLK_N]

# Create clock

create_clock -name clk200 -period 5 [get_ports CLK_P]

set_max_delay 10 -from clk200 -to [get_ports LED[*]]

set_max_delay 10 -from clk200 -to [get_ports IO[*]]

# LEDs, Bank 35, 3.3V
set_property PACKAGE_PIN G3 [get_ports LED[0]]
set_property IOSTANDARD LVCMOS33 [get_ports LED[0]]
set_property PULLUP true [get_ports LED[0]]
set_property DRIVE 8 [get_ports LED[0]]

set_property PACKAGE_PIN H3 [get_ports LED[1]]
set_property IOSTANDARD LVCMOS33 [get_ports LED[1]]
set_property PULLUP true [get_ports LED[1]]
set_property DRIVE 8 [get_ports LED[1]]

set_property PACKAGE_PIN G4 [get_ports LED[2]]
set_property IOSTANDARD LVCMOS33 [get_ports LED[2]]
set_property PULLUP true [get_ports LED[2]]
set_property DRIVE 8 [get_ports LED[2]]

set_property PACKAGE_PIN H4 [get_ports LED[3]]
set_property IOSTANDARD LVCMOS33 [get_ports LED[3]]
set_property PULLUP true [get_ports LED[3]]
set_property DRIVE 8 [get_ports LED[3]]

# IOs, 3.3V

set_property PACKAGE_PIN AB8 [get_ports IO[0]]
set_property IOSTANDARD LVCMOS33 [get_ports IO[0]]
set_property PULLUP true [get_ports IO[0]]

set_property PACKAGE_PIN AA8 [get_ports IO[1]]
set_property IOSTANDARD LVCMOS33 [get_ports IO[1]]
set_property PULLUP true [get_ports IO[1]]

set_property PACKAGE_PIN Y9 [get_ports IO[2]]
set_property IOSTANDARD LVCMOS33 [get_ports IO[2]]
set_property PULLUP true [get_ports IO[2]]

set_property PACKAGE_PIN W9 [get_ports IO[3]]
set_property IOSTANDARD LVCMOS33 [get_ports IO[3]]
set_property PULLUP true [get_ports IO[3]]

set_property PACKAGE_PIN Y8 [get_ports IO[4]]
set_property IOSTANDARD LVCMOS33 [get_ports IO[4]]
set_property PULLUP true [get_ports IO[4]]

set_property PACKAGE_PIN Y7 [get_ports IO[5]]
set_property IOSTANDARD LVCMOS33 [get_ports IO[5]]
set_property PULLUP true [get_ports IO[5]]

set_property PACKAGE_PIN V9 [get_ports IO[6]]
set_property IOSTANDARD LVCMOS33 [get_ports IO[6]]
set_property PULLUP true [get_ports IO[6]]

set_property PACKAGE_PIN V8 [get_ports IO[7]]
set_property IOSTANDARD LVCMOS33 [get_ports IO[7]]
set_property PULLUP true [get_ports IO[7]]

# IOs, 2.5V

set_property PACKAGE_PIN K2 [get_ports IO[8]]
set_property IOSTANDARD LVCMOS33 [get_ports IO[8]]
set_property PULLUP true [get_ports IO[8]]

set_property PACKAGE_PIN J2 [get_ports IO[9]]
set_property IOSTANDARD LVCMOS33 [get_ports IO[9]]
set_property PULLUP true [get_ports IO[9]]

set_property PACKAGE_PIN J5 [get_ports IO[10]]
set_property IOSTANDARD LVCMOS33 [get_ports IO[10]]
set_property PULLUP true [get_ports IO[10]]

set_property PACKAGE_PIN H5 [get_ports IO[11]]
set_property IOSTANDARD LVCMOS33 [get_ports IO[11]]
set_property PULLUP true [get_ports IO[11]]

# see UG912

set_property CONFIG_VOLTAGE {3.3} [current_design]
set_property CFGBVS {VCCO} [current_design]
set_property CONFIG_MODE {SPIx4} [current_design]

# see Appendix A in UG908
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN {Div-1} [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR {Yes} [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH {4} [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE {Yes} [current_design]
set_property BITSTREAM.GENERAL.COMPRESS {True} [current_design]
