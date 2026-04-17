#![no_std]
use soroban_sdk::{contract, contractimpl, Env, Symbol, symbol_short};

const INIT: Symbol = symbol_short!("INIT");

#[contract]
pub struct VerunCore;

#[contractimpl]
impl VerunCore {
    pub fn init(env: Env, label: Symbol) {
        env.storage().instance().set(&INIT, &label);
    }

    pub fn ping(env: Env) -> Symbol {
        env.storage().instance().get(&INIT).unwrap_or(symbol_short!("NONE"))
    }
}
