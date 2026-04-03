# Anderson Conjecture Lean4 Results  ---  Archon

This repository contains a Lean 4 formalization of the main theorem from Anderson (2014): **there exists a weakly quasi-complete Noetherian local ring that is not quasi-complete**. This resolves [Problem 8a](https://doi.org/10.1007/978-1-4939-0925-4_20) ("Is a weakly quasi-complete ring quasi-complete?") from Cahen, Fontana, Frisch, and Glaz, *Open Problems in Commutative Ring Theory* (Springer, 2014), in the negative.

The Lean code in this repository was **automatically generated** using [**Archon**](https://github.com/frenzymath/Archon).

The theorem statement is declared in [`Challenge.lean`](Challenge.lean), and the complete proof is developed across the [`Anderson/`](Anderson/) folder, with the final result assembled in [`Anderson/Main.lean`](Anderson/Main.lean).

## Project Statistics

| Metric | Value |
|--------|-------|
| Lines of Lean | ~20k |
| Lean files | 44 |
| Lean version | v4.29.0-rc8 |
| Mathlib version | v4.29.0-rc8 |

## Organization

- **[`Challenge.lean`](Challenge.lean)** — The theorem statement with a `sorry` placeholder. This is the single file a verifier needs to read to check the mathematical claim.
- **[`INFORMAL_RAW_OUTPUT.md`](INFORMAL_RAW_OUTPUT.md)** — The informal mathematical blueprint (paper-style proofs) that was used as input to Archon for generating the formalization.
- **[`Mathematical_Proof.pdf`](Mathematical_Proof.pdf)** — PDF of the informal proof, manually polished for readability.
- **`Anderson/`** — 42 Lean files containing the full proof:
  - [`Main.lean`](Anderson/Main.lean) — final assembly of `main_theorem`
  - [`Basic.lean`](Anderson/Basic.lean) — definitions of quasi-completeness and weak quasi-completeness
  - [`AdicKerEval.lean`](Anderson/AdicKerEval.lean), [`AdicLocal.lean`](Anderson/AdicLocal.lean), [`AdicNoetherian.lean`](Anderson/AdicNoetherian.lean) — the adic completion of a Noetherian local ring is local and Noetherian
  - [`CompleteDomain/CompleteDomain.lean`](Anderson/CompleteDomain/CompleteDomain.lean) — T = ℂ[[x,y,z]]/(x²−yz) is a complete local domain with a non-principal height-one prime
  - [`QuasiCompleteRing/QuasiCompleteRing.lean`](Anderson/QuasiCompleteRing/QuasiCompleteRing.lean) — Anderson's Theorems 3–5 characterising (weak) quasi-completeness
  - [`Jensen/Jensen.lean`](Anderson/Jensen/Jensen.lean) — Jensen's Corollary 2.4: constructing a UFD with prescribed completion
  - [`Jensen/Adjoin/Adjoin.lean`](Anderson/Jensen/Adjoin/Adjoin.lean) — adjoining elements to N-subrings (Loepp, Jensen, Heitmann)
  - [`Jensen/CloseUp/CloseUp.lean`](Anderson/Jensen/CloseUp/CloseUp.lean) — closing up finitely generated ideals (Heitmann Lemma 4)
  - [`Jensen/KrullDomain/KrullDomain.lean`](Anderson/Jensen/KrullDomain/KrullDomain.lean) — Krull domain intersection for the two-generator coprime case
  - [`Jensen/Construction/Construction.lean`](Anderson/Jensen/Construction/Construction.lean) — the transfinite construction assembling the final ring

## References

See **[References](references/BIBLIOGRAPHY.md)**.

## Verifying the Proof with Comparator

If you want to independently verify our proof, you only need to do two things:

1. **Read [`Challenge.lean`](Challenge.lean)** and check that the theorem statement (`main_theorem`) faithfully captures the mathematical claim you care about. This file is short and self-contained — no need to read the rest of the codebase.
2. **Run [Comparator](https://github.com/leanprover/comparator)** to mechanically verify that our proof in `Anderson` indeed proves the exact statement in [`Challenge.lean`](Challenge.lean), uses only standard axioms, and is accepted by the Lean kernel.

In other words, you trust the *statement* by reading one file, and you trust the *proof* by running one command — without having to audit the full codebase or our build environment.

### Setup

#### 1. Install Lean

If you don't already have Lean installed, use [elan](https://github.com/leanprover/elan):

```bash
curl https://elan.lean-lang.org/elan-init.sh -sSf | sh
source ~/.profile   # or restart your shell
elan toolchain install leanprover/lean4:v4.29.0-rc8
```

#### 2. Install dependencies and Comparator

Comparator requires two external tools — [landrun](https://github.com/Zouuup/landrun) (sandbox) and [lean4export](https://github.com/leanprover/lean4export/) (definition exporter) — on your `PATH`. If you don't already have them installed, you can build everything inside this project directory:

```bash
# Install Go if not already installed (https://go.dev/doc/install)
# For Ubuntu/Debian:
sudo apt-get install -y golang-go

# Build landrun (requires Go)
git clone https://github.com/Zouuup/landrun.git
cd landrun && go build -o landrun cmd/landrun/main.go && cd ..

# Build lean4export (version must match lean-toolchain)
git clone https://github.com/leanprover/lean4export.git
cd lean4export && git checkout v4.29.0-rc8 && lake build && cd ..

# Build Comparator (version must match lean-toolchain)
git clone https://github.com/leanprover/comparator.git
cd comparator && git checkout v4.29.0-rc8 && lake build && cd ..

lake exe cache get

# Add all binaries to PATH for this session
export PATH="$PATH:$(pwd)/landrun:$(pwd)/lean4export/.lake/build/bin:$(pwd)/comparator/.lake/build/bin"
```

#### 3. Configuration

This repository already includes a `config.json` at the project root with the correct settings for verifying our main theorem.

### Usage

From the root of this repository, run:

```bash
lake env comparator config.json
```

On success, Comparator guarantees that `main_theorem` in `Anderson`:
1. Proves the exact same statement as declared in `Challenge.lean`.
2. Uses only the permitted axioms (`propext`, `Quot.sound`, `Classical.choice`).
3. Is accepted by the Lean kernel.

### Method 1: Built-in Lean Kernel Verification (Default)

The default configuration above uses the built-in Lean kernel to replay and verify the proof. No extra setup is needed — just run the command shown above.

The comparator builds both `Challenge` and `Anderson` in sandboxed environments via `landrun`, exports their definitions via `lean4export`, compares the theorem statements, validates axiom usage, and replays the solution through the Lean kernel.

### Method 2: Nanoda Kernel Verification

For additional assurance, Comparator can also verify the proof with the [nanoda](https://github.com/ammkrn/nanoda_lib) kernel — an independent Lean kernel implementation written in Rust. This provides a stronger trust guarantee through cross-checking by two independent kernels.

#### Extra setup

Install Rust and build nanoda:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env

git clone https://github.com/ammkrn/nanoda_lib.git
cd nanoda_lib
cargo build --release
cd ..

export PATH="$PATH:$(pwd)/nanoda_lib/target/release"
```

#### Run with nanoda enabled

Set `"enable_nanoda": true` in `config.json`, then run the same command:

```bash
lake env comparator config.json
```
