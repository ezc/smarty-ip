(defcustom smarty-ip-fail-node "cityName"
  "Failed Node,if this node get invalid data.the result will be treate as fail."
  :type "symbol")

(defcustom smarty-ip-fail-value "-"
  "Failed value match.")

(defcustom smarty-ip-api "http://api.ipinfodb.com/v3/ip-city/?key=42545cc51c9d9069a7eef4373cbee9bacb1eb4e1ff6c28ee96840f85b2dd4c49&format=xml&ip="
  "ip location sevice api url."
  :group 'smarty-ip)

(defcustom smarty-ip-api-charset "utf-8"
  "ip location sevice api charset."
  :group 'smarty-ip)


(defcustom smarty-ip-city-name "cityName"
  "city name"
  :group 'smarty-ip)

(defcustom smarty-ip-country-name "countryName"
  "country name"
  :group 'smarty-ip)

(defcustom smarty-ip-sp-name "sp"
  "service provider name"
  :group 'smarty-ip)

(defcustom smarty-ip-result-name "result"
  "result flag"
  :group 'smarty-ip)


(defcustom smarty-ip-msg-findout "ip %s found，city %s."
  "ip convert display locale"
  :group 'smarty-ip)

(defcustom smarty-ip-msg-notfind "ip %s not found."
  "ip convert display locale"
  :group 'smarty-ip)

