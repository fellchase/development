/*
Copyright (c) 2014 NicoHood
See the readme for credit to other people.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/


#ifndef RAM_H
#define RAM_H

#include "Metainclude.h"
#include "Lib/NHP.h"
#include "Lib/HID_Reports.h"

//================================================================================
// RAM
//================================================================================

// global variable to hold specific ram data
// because we only have 500 bytes we have to free some memory for different modes
typedef struct{
	// Circular buffer to hold data from the serial port before it is sent to the host.
	LRingBuffer_t RingBuffer;

	// Underlying data buffer for RingBuffer, where the stored bytes are located.
	uint8_t RingBuffer_Data[128];

	// if baud == AVRISP_BAUD AVRISP mode
	struct{
		uint8_t error : 7;
		uint8_t pmode : 1; // true/false
		int _addr; // here
		struct{
			int pagesize;
			int eepromsize;
		} param;
	} isp;

	// Pulse generation counters to keep track of the number of milliseconds remaining for each pulse type
#define NHP_TIMEOUT_MS 3
	union{
		uint8_t whole;
		struct{
			uint8_t TxLEDPulse : 2; // Milliseconds remaining for data Tx LED pulse
			uint8_t RxLEDPulse : 2; // Milliseconds remaining for data Rx LED pulse
			uint8_t NHPTimeout : 2;
			uint8_t PModePulse : 2; // Not used <--
		};
	} PulseMSRemaining;

	// variables to save hid states
	struct{
		// Report ID that is being received
		uint8_t ID : 4; // 0-15
		// number of bytes received
		uint8_t recvlength : 4; // 0-15
		// Buffer for the incoming HID report
		uint8_t buffer[sizeof(HID_HIDReport_Data_t)];
		// int to check if a report is cleared or not
		uint16_t writtenReport : 15;
		// variable to perform a "HID flush" and to indicate what report should be written down
		uint16_t writeHID : 1; // true/false
	}HID;

	// NHP needed as Serial Protocol to receive HID data
	NHP_Data_t NHP;
	uint8_t skipNHP; // up to 12 bytes (address error + nhp error)
}ram_t;

// access as global ram share
extern ram_t ram;

#endif

