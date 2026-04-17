#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
CFG_DIR="$ROOT_DIR/.stellar"
WASM_PATH="/workspace/contracts/wasm/verun_core.wasm"

mkdir -p "$CFG_DIR"

# 1) Generate + fund deployer if missing
if ! docker run --rm -v "$CFG_DIR":/cfg stellar/stellar-cli:latest --config-dir /cfg keys ls | grep -q '^deployer$'; then
  docker run --rm -v "$CFG_DIR":/cfg stellar/stellar-cli:latest --config-dir /cfg keys generate deployer --network testnet --fund
fi

# 2) Build contract wasm
docker run --rm -v "$ROOT_DIR":/workspace -w /workspace stellar/stellar-cli:latest \
  contract build --manifest-path /workspace/contracts/verun_core/Cargo.toml --out-dir /workspace/contracts/wasm

# 3) Deploy six contract instances
for alias in verun-registry verun-scanner x402-validator payment-settler agent-registry mock-usdc; do
  echo "Deploying $alias"
  docker run --rm -v "$ROOT_DIR":/workspace -v "$CFG_DIR":/cfg -w /workspace stellar/stellar-cli:latest \
    --config-dir /cfg contract deploy --network testnet --source-account deployer --wasm "$WASM_PATH" --alias "$alias"
done

echo "Done. Contract aliases saved under $CFG_DIR"
