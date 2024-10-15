#!/bin/sh
source ./.env
TWILIO=$(curl -s -G https://api.twilio.com/2010-04-01/Accounts/$TWILIO_SID/Balance.json   -u "$TWILIO_SID:$TWILIO_AUTH_TOKEN" | jq -r '.balance')
VONAGE=$(curl -s "https://rest.nexmo.com/account/get-balance?api_key=$VONAGE_API_KEY&api_secret=$VONAGE_API_SECRET" | jq -r '.value')

echo "Twilio balance is $TWILIO and Vonage balance is $VONAGE"
