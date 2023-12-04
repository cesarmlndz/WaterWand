- This is the IOS application code.
- This Swift code connects to the Raspberry Pi of the WaterWand through a GET request of a Flask server. Connection is through Wi-Fi.
- User connects to the WaterWand Wi-Fi network and opens the mobile app to fetch data.
- If you want to connect this application to your own Raspberry Pi, you must modify the "fetchData()" function on the "Data" view to match your
  Raspberry Pi's IP address & GET request route name. You must also set up your Raspberry Pi as a Wi-Fi Access Point (AP).

As urban flooding due to global warming and sea-level rise in coastal cities like Miami is becoming more frequent, 
finding methods for engaging and informing the affected citizens is critical.
Water Wand is a crowdsourced hydrometry effort composed of a mobile application and a portable sensing device that 
allows citizens to collect and share water quality and depth data with the stakeholders and engaged community.

The lightweight and user-friendly Water Wand sensing device measure water depth, turbidity, conductivity, water temperature, as well as 
the GPS of the collection zone. The Water Wand app communicates the importance of water quality monitoring research to the engaged 
community and allows citizen scientists to navigate the device easily. Water Wand is in its final production phase. The aim is to make the 
technology open source so that it can not only be used during the FIU Institute of the Environment’s community events
but can also impact anyone interested in joining the monitoring efforts.
