//
//  BluetoothManager.swift
//  WaterWand1
//
//  Created by Cesar Melendez on 9/25/23.
//

import Foundation
import CoreBluetooth

class BluetoothManager: NSObject, ObservableObject, CBCentralManagerDelegate, CBPeripheralDelegate {
    private var centralManager: CBCentralManager!
    private var peripheral: CBPeripheral?
    @Published var receivedData: String = ""

    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }

    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            // Bluetooth is ready for use, start scanning for peripherals.
            startScanning()
        } else {
            // Handle other states (e.g., .poweredOff, .resetting, .unsupported, .unauthorized, .unknown).
        }
    }

    func startScanning() {
        let serviceUUIDs = [CBUUID(string: "YourServiceUUID")]
        centralManager.scanForPeripherals(withServices: serviceUUIDs, options: nil)
    }

    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String: Any], rssi RSSI: NSNumber) {
        // Handle discovered peripherals here.
        // You can filter by peripheral name or other criteria.
        if peripheral.name == "raspberrypi" {
            centralManager.connect(peripheral, options: nil)
        }
    }

    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        peripheral.delegate = self
        peripheral.discoverServices(nil)
    }

    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        if let services = peripheral.services {
            for service in services {
                peripheral.discoverCharacteristics(nil, for: service)
            }
        }
    }

    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
           if let data = characteristic.value {
               // Handle and process the received data from the Raspberry Pi here.
               if let receivedString = String(data: data, encoding: .utf8) {
                   receivedData = receivedString
               }
           }
    }
}

