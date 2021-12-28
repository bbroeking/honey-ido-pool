NEW_MINT=$(spl-token create-token --decimals 9 | awk -F"token " '/token /{print $2}')
NEW_ACC=$(spl-token create-account $NEW_MINT | awk -F"account " '/account /{print $2}')
AUTHORITY=B9RmxeRiWWo8TFh1ydAb5wiUh7SrFrbVcjbwKPQuNLsT
IDO_AMOUNT=30000000
IDO_START_TS=1640389800
IDO_DEPOSIT_PERIOD_SEC=300
IDO_CANCEL_PERIOD_SEC=0
IDO_WITHDRAW_TS=1640390100
USDC_MINT=6Xg9kxbm12y9yVkQmXWD2gHdq7NPjxwTXLYdjxAERySV

echo "NEW MINT: $NEW_MINT - $NEW_ACC"
spl-token mint $NEW_MINT $IDO_AMOUNT $NEW_ACC

node cli/index.js init $USDC_MINT $NEW_MINT $NEW_ACC $IDO_AMOUNT $AUTHORITY --start_time $IDO_START_TS --deposit_duration $IDO_DEPOSIT_PERIOD_SEC --cancel_duration $IDO_CANCEL_PERIOD_SEC --withdraw_ts $IDO_WITHDRAW_TS
