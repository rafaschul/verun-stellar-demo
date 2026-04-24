# Verun Stellar Demo — Testnet Contracts

Deployment date: 2026-04-17
Network: Stellar Testnet
Deployer: alias `deployer` (local `.stellar` config)

## Contract IDs

### Priority (distinct business logic in progress)

- AgentRegistry: `CAAO2XERZGH4Q37TMMWQNVV27QOUPYLMCAPOGPBOEFLEVA34ILSNQ2Y6`
  - https://stellar.expert/explorer/testnet/contract/CAAO2XERZGH4Q37TMMWQNVV27QOUPYLMCAPOGPBOEFLEVA34ILSNQ2Y6
- VerunRegistry: `CBEX7XI4FRN3BZLWMNLJRKBDM7P6ORB2A2ICTTAAGGP5G7TZXA6MT7Q4`
  - https://stellar.expert/explorer/testnet/contract/CBEX7XI4FRN3BZLWMNLJRKBDM7P6ORB2A2ICTTAAGGP5G7TZXA6MT7Q4
- VerunScanner: `CBTWLIE6QP4VGSOZCZXEUJITLB4W4WPD57H2UHZFNA7QJUTBYFOGWVPP`
  - https://stellar.expert/explorer/testnet/contract/CBTWLIE6QP4VGSOZCZXEUJITLB4W4WPD57H2UHZFNA7QJUTBYFOGWVPP

### Scaffold (shared verun_core WASM)

- x402Validator: `CCDFIIO6AX4Y72GPXFWH5P2TAKHOE4ESMQEQWZURNLXOCEBWLFVSBCHK`
  - https://stellar.expert/explorer/testnet/contract/CCDFIIO6AX4Y72GPXFWH5P2TAKHOE4ESMQEQWZURNLXOCEBWLFVSBCHK
- PaymentSettler: `CBU7GHHJNSKN2FTFGGGUL6HS23HM6L4U7F3ECRYANLXHESABHV33WQJV`
  - https://stellar.expert/explorer/testnet/contract/CBU7GHHJNSKN2FTFGGGUL6HS23HM6L4U7F3ECRYANLXHESABHV33WQJV
- MockUSDC (SEP-41 placeholder): `CB6LA2GZ4Q4J4QFE4AMP5GVMMHAE2F2G3FDDUZWFGBGM2DVFTFGRTJZB`
  - https://stellar.expert/explorer/testnet/contract/CB6LA2GZ4Q4J4QFE4AMP5GVMMHAE2F2G3FDDUZWFGBGM2DVFTFGRTJZB

## Build + Deploy

```bash
cd verun-stellar-demo
./contracts/deploy-testnet.sh
```

## Source

- Contract crate: `contracts/verun_core/`
- Wasm output: `contracts/wasm/verun_core.wasm`

## Verification

- Run live link checks:

```bash
./contracts/verify-testnet-links.sh
```

- Last link check: 2026-04-24 (all 6 links returned HTTP 200)

## Notes

- This is a minimal real deployment for demo reliability (MUST scope).
- Main landing page contract section was removed in commit `692d5e5` by product/design decision; canonical technical status is maintained in this file and preview docs.
- x402 facilitator endpoint link was removed from main page because the public endpoint became unavailable.
