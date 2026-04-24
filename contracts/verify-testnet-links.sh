#!/usr/bin/env bash
set -euo pipefail

BASE_URL="https://api.stellar.expert/explorer/testnet/contract"

CONTRACTS=(
  "VerunRegistry:CBEX7XI4FRN3BZLWMNLJRKBDM7P6ORB2A2ICTTAAGGP5G7TZXA6MT7Q4"
  "VerunScanner:CBTWLIE6QP4VGSOZCZXEUJITLB4W4WPD57H2UHZFNA7QJUTBYFOGWVPP"
  "x402Validator:CCDFIIO6AX4Y72GPXFWH5P2TAKHOE4ESMQEQWZURNLXOCEBWLFVSBCHK"
  "PaymentSettler:CBU7GHHJNSKN2FTFGGGUL6HS23HM6L4U7F3ECRYANLXHESABHV33WQJV"
  "AgentRegistry:CAAO2XERZGH4Q37TMMWQNVV27QOUPYLMCAPOGPBOEFLEVA34ILSNQ2Y6"
  "MockUSDC:CB6LA2GZ4Q4J4QFE4AMP5GVMMHAE2F2G3FDDUZWFGBGM2DVFTFGRTJZB"
)

echo "Checking Stellar testnet contract explorer links..."
FAIL=0
for item in "${CONTRACTS[@]}"; do
  NAME="${item%%:*}"
  ID="${item##*:}"
  URL="${BASE_URL}/${ID}"
  CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "$URL" || true)

  if [[ "$CODE" == "200" ]]; then
    echo "✅ $NAME -> $URL (HTTP $CODE)"
  else
    echo "❌ $NAME -> $URL (HTTP ${CODE:-ERR})"
    FAIL=1
  fi
done

if [[ $FAIL -ne 0 ]]; then
  echo "One or more links are not active."
  exit 1
fi

echo "All 6 contract links are active."
