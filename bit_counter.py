import RPi.GPIO as GPIO
import time

#Setting up script to use the right pin configuration
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

#Define some variables
LED_counter = 0                     #The current number in decimal
bit_counter = 0                     #The current bit
current_num = ""                    #The current number in binary
LED_array = [[17,0],[22,0],[6,0],[26,0]]        #The LED configuration array

Pin_array = [17,22,6,26,4]

#Set all the pins to outputs
for index in range(len(Pin_array)):
    GPIO.setup(Pin_array[index], GPIO.OUT)

#Reset all the pins to 0
def resetPins():
    for index in range(len(Pin_array)):
        GPIO.output(Pin_array[index], 0)

    time.sleep(0.3)
    return

#Turn the LEDs on or off
def makeitso(theLEDs = [], *args):
    LED_counter = 0

    while LED_counter < 4:
        GPIO.output(theLEDs[LED_counter][0], theLEDs[LED_counter][1])
        LED_counter += 1
        time.sleep(.3)
    return

#Define the pin configuration by counting in binary and stripping out each bit, char by char.
while LED_counter <= 15:
    resetPins()
        
    current_num = bin(LED_counter)[2:].zfill(4)

    while bit_counter < 4:
        LED_array[bit_counter][1] = int(current_num[bit_counter])
        bit_counter += 1

    bit_counter = 0
    GPIO.output(Pin_array[4], 1)
    makeitso(LED_array)
    LED_counter += 1

GPIO.cleanup()