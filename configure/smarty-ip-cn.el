(defcustom smarty-ip-fail-node "result"
  "Failed Node,if this node get invalid data.the result will be treate as fail."
  :type "symbol")

(defcustom smarty-ip-fail-value "0"
  "Failed value match.")

(defcustom smarty-ip-api "http://ipquery.sdo.com/getipinfo.php?ip="
  "ip location sevice api url."
  :group 'smarty-ip)

(defcustom smarty-ip-api-charset "utf-8"
  "ip location sevice api charset."
  :group 'smarty-ip)


(defcustom smarty-ip-city-name "city"
  "city name"
  :group 'smarty-ip)

(defcustom smarty-ip-country-name "country"
  "country name"
  :group 'smarty-ip)

(defcustom smarty-ip-sp-name "sp"
  "service provider name"
  :group 'smarty-ip)

(defcustom smarty-ip-result-name "result"
  "result flag"
  :group 'smarty-ip)


(defcustom smarty-ip-msg-findout "ip %s 检索成功，所属城市为 %s。"
  "ip convert display locale"
  :group 'smarty-ip)

(defcustom smarty-ip-msg-notfind "ip %s 检索失败，未找到相关信息。"
  "ip convert display locale"
  :group 'smarty-ip)

