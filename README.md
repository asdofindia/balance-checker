# Balance Check

## Setup

```
sudo apt install curl jq
```

Get your Twilio Auth Token and SID from account info section of your [twilio console](https://console.twilio.com/)

Get Vonage API key and secret from your [nexmo dashboard](https://dashboard.nexmo.com/)

Put them in `.env` file like this:

```
TWILIO_AUTH_TOKEN=....
TWILIO_SID=....
VONAGE_API_KEY=....
VONAGE_API_SECRET=....
```

## Running

```
./check-balance.sh
```

The above command will source the secrets from your .env, check balance, and then fetch the right column from output using jq.

## Setup notification via xmpp

Install and configure any of

1. [go-sendxmpp](https://salsa.debian.org/mdosch/go-sendxmpp)
2. [sendxmpp-rs](https://github.com/moparisthebest/sendxmpp-rs)
3. sendxmpp


For go-sendxmpp, you can create `~/.config/go-sendxmpp/config` with content like:

```
username: jid
password: password
alias: balancechecker
```

The alias is used in MUCs

You have to `chmod 400 ~/.config/go-sendxmpp/config`

## Run with notification

```bash
./check-balance.sh | go-sendxmpp -c chatroom@conference.example.com
```

## Scheduling

You can use cron to schedule it as you like
