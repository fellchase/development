/*
LUFA Library
Copyright (C) Dean Camera, 2014.

dean [at] fourwalledcubicle [dot] com
www.lufa-lib.org
*/

/*
Copyright 2014  Dean Camera (dean [at] fourwalledcubicle [dot] com)

Permission to use, copy, modify, distribute, and sell this
software and its documentation for any purpose is hereby granted
without fee, provided that the above copyright notice appear in
all copies and that both that the copyright notice and this
permission notice and warranty disclaimer appear in supporting
documentation, and that the name of the author not be used in
advertising or publicity pertaining to distribution of the
software without specific, written prior permission.

The author disclaims all warranties with regard to this
software, including all implied warranties of merchantability
and fitness.  In no event shall the author be liable for any
special, indirect or consequential damages or any damages
whatsoever resulting from loss of use, data or profits, whether
in an action of contract, negligence or other tortious action,
arising out of or in connection with the use or performance of
this software.
*/

/** \file
*  \brief Board specific information header for the Arduino Leonardo board.
*  \copydetails Group_BoardInfo_LEONARDO
*
*  \note This file should not be included directly. It is automatically included as needed by the Board driver
*        dispatch header located in LUFA/Drivers/Board/Board.h.
*/

/** \ingroup Group_BoardInfo
*  \defgroup Group_BoardInfo_LEONARDO LEONARDO
*  \brief Board specific information header for the Arduino Leonardo board.
*
*  Board specific information header for the Arduino Leonardo board (http://arduino.cc/en/Main/arduinoBoardLeonardo).
*
*  @{
*/

#ifndef __BOARD_HOODLOADER_H__
#define __BOARD_HOODLOADER_H__

/* Includes: */
//#include "../../../../Common/Common.h"
//#include "../../LEDs.h"

/* Enable C linkage for C++ Compilers: */
#if defined(__cplusplus)
extern "C" {
#endif

	/* Preprocessor Checks: */
#if !defined(__INCLUDE_FROM_BOARD_H)
#error Do not include this file directly. Include LUFA/Drivers/Board/Board.h instead.
#endif

	/* Public Interface - May be used in end-application: */
	/* Macros: */
	/** Indicates the board has hardware LEDs mounted. */
#define BOARD_HAS_LEDS

#define AVR_RESET_LINE_PORT PORTD
#define AVR_RESET_LINE_DDR DDRD
#define AVR_RESET_LINE_PIN PIND
#define AVR_RESET_LINE_MASK (1 << 7)

	// hardware configuration
#define AVR_SPI_PIN PINB
#define AVR_SPI_PORT PORTB
#define AVR_SPI_DDR DDRB
#define AVR_MOSI 2
#define AVR_MISO 3
#define AVR_SCK 1
	// the "real" SS pin is not connected on a normal Arduino so we use another pin as SS.
	// the hardware SS pin still needs to be in output mode to enable SPI master mode.
	// SS is the pin thats close to the TX Led (bottom right)
#define AVR_SS 4
#define AVR_HARDWARE_SS 0

#define LOW 0
#define HIGH 1

	/* Disable C linkage for C++ Compilers: */
#if defined(__cplusplus)
}
#endif

#endif

/** @} */

