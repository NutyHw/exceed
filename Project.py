from machine import Pin  ,ADC , PWM
import machine
from time import sleep
import network
import urequests
import json
from _thread import start_new_thread as thread
ssid = 'exceed16_6'
pwd = '12345678'
count = 0
url = 'https://exceed.superposition.pknn.dev/data/boobo_hardware'
Red = Pin(15,Pin.OUT)
Switch = Pin(19,Pin.IN)
tilt = Pin(0,Pin.IN)
Hit = Pin(13, Pin.IN)
Micro = ADC(Pin(32))
Micro.atten(ADC.ATTN_11DB)
station = network.WLAN(network.STA_IF)
station.active(True)
current_state = 0
headers = {"content-Type" : "application/json"}
def tilt():
  while True:
    sleep(0.1)
    current_state = tilt.value()
    if current_state == 1:
      print(True)
      Red.value(1)
      sleep(10)
    else:
      print(False)
      Red.value(0)
      sleep(1 )
    
def micro():
  Bus = PWM(Pin(26),freq = 20)
  while True:
    print(Micro.read())
    sleep(0.1)
def getdata():
  while True:
    if station.isconnected():
      Result = urequests.get(url).json()
      print(Result)
      sleep(1)
      if Result["isDanger"] == "False":
        Bus = PWM(Pin(26),freq = 20)
        Bus.deinit()
        Red.value(0)
  

def connection():
  while(1):
    while not station.isconnected():
      station.connect(ssid,pwd)
      print('Connect...')
      sleep(0.5)
      if station.isconnected():
        print("connected")
        
def hit():
  data = {"isWear" : "False" ,"isDanger" : "False"}
  status = 0
  while True:
    if Switch.value():
      data = {"isWear" : "False" ,"isDanger" : "False"}
    if station.isconnected():
        print("Switch: ",Switch.value())
        sleep(0.5)
        if Switch.value() == 1:
          data["isWear"] = "True"
          print(Switch.value(),2)
          if station.isconnected():
            Result = urequests.get(url).json()
            print(Result)
            sleep(3)
            if Result["isDanger"] == "False":
              Bus = PWM(Pin(26))
              Bus.deinit()
              Red.value(0)
        else:
          if status == 0 :
            print("###################")
            data["isWear"]="False"
            js = json.dumps({"data" : data})
            r = urequests.post(url=url, data=js, headers=headers)
            sleep(3)
            status = 1
            
          continue
           
        print(Hit.value())
        print(Micro.read())
        print(Switch.value())
        sleep(1.5)
        if (Hit.value() == 1 or Micro.read() >= 50) and Switch.value() == 1 :
          
          print("Hello")
          Red.value(1)
          Bus = PWM(Pin(26),freq = 20)
          data["isDanger"] = "True"
          
          js = json.dumps({"data" : data})
          r = urequests.post(url=url, data=js, headers=headers)
          results = r.json()
          print(results)
          sleep(1)
          print("Hee")
          print(results)
      

  

def getdata():
    if station.isconnected():
      Result = urequests.get(url).json()
      print(Result)
      sleep(5)
      if Result["isDanger"] == "False":
        Bus = PWM(Pin(26),freq = 20)
        Bus.deinit()
        Red.value(0)
  
def switch():
  while True:
    print(Switch.value())
    print('Still')
    sleep(1)
    
thread(hit,())
thread(connection,())


