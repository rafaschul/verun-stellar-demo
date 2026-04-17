# Verun Stellar Demo — Testnet Contracts

Deployment date: 2026-04-17
Network: Stellar Testnet
Deployer: alias `deployer` (local `.stellar` config)

## Contract IDs

- VerunRegistry: `CBEX7XI4FRN3BZLWMNLJRKBDM7P6ORB2A2ICTTAAGGP5G7TZXA6MT7Q4`
- VerunScanner: `CBTWLIE6QP4VGSOZCZXEUJITLB4W4WPD57H2UHZFNA7QJUTBYFOGWVPP`
- x402Validator: `CCDFIIO6AX4Y72GPXFWH5P2TAKHOE4ESMQEQWZURNLXOCEBWLFVSBCHK`
- PaymentSettler: `CBU7GHHJNSKN2FTFGGGUL6HS23HM6L4U7F3ECRYANLXHESABHV33WQJV`
- AgentRegistry: `CAAO2XERZGH4Q37TMMWQNVV27QOUPYLMCAPOGPBOEFLEVA34ILSNQ2Y6`
- MockUSDC (SEP-41 placeholder): `CB6LA2GZ4Q4J4QFE4AMP5GVMMHAE2F2G3FDDUZWFGBGM2DVFTFGRTJZB`

## Build + Deploy

```bash
cd verun-stellar-demo
./contracts/deploy-testnet.sh
```

## Source

- Contract crate: `contracts/verun_core/`
- Wasm output: `contracts/wasm/verun_core.wasm`

## Notes

- This is a minimal real deployment for demo reliability (MUST scope).
- x402 facilitator endpoint returned HTTP 401 at check time, indicating endpoint reachable but auth-gated.
