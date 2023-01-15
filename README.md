# Example deeplink command to launch url on android
# - New Topics
adb shell 'am start -W -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "lumite:///news?topic=latest"'
# - New Details (Partially works)
db shell 'am start -W -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "lumite:///news/details/Best%2520smartphones%2520under%2520RM600%2520(Dec%25202022)%2520%257C%2520SoyaCincau%25E2%2580%2599s%2520Best%2520Budget%2520Buys"'