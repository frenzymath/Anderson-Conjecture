# References

This directory intentionally does not contain full copyrighted texts. Below is the complete list of papers and monographs needed to understand the mathematical content formalized in this project.

## Core References (directly used in the proof)

These four papers form the backbone of the formalization.

### 1. Anderson (2014) — Quasi-completeness theory

- **Anderson, D. D.** *Quasi-complete semilocal rings and modules.* In M. Fontana, S. Frisch, & S. Glaz (Eds.), Commutative Algebra (pp. 25–37). Springer, 2014.
- **DOI:** [10.1007/978-1-4939-0925-4_2](https://doi.org/10.1007/978-1-4939-0925-4_2)
- **Key results used:**
  - Theorem 3 (complete implies quasi-complete)
  - Theorem 4 (six equivalent characterizations of quasi-completeness)
  - Theorem 5 Item 3 (= Theorem 1.3: quasi-complete implies weakly quasi-complete)
  - Corollary 2 Parts 1 and 3 (properties of weakly quasi-complete rings)

### 2. Jensen (2006) — UFD construction with prescribed fiber

- **Jensen, D.** *Completions of UFDs with semi-local formal fibers.* Communications in Algebra, 34(1), 347–360, 2006.
- **DOI:** [10.1080/00927870500346321](https://doi.org/10.1080/00927870500346321)
- **Key results used:**
  - Lemma 2.1 (extends Loepp's fiber control lemma)
  - Theorem 2.2 (characterization of completions of UFDs, both directions)
  - Corollary 2.4 (existence of UFD with prescribed completion — the key construction input)

### 3. Heitmann (1993) — Transfinite UFD construction

- **Heitmann, R. C.** *Characterization of completions of unique factorization domains.* Transactions of the AMS, 337(1), 379–387, 1993.
- **DOI:** [10.1090/S0002-9947-1993-1102888-9](https://doi.org/10.1090/S0002-9947-1993-1102888-9)
- **Key results used:**
  - Theorem 1 (necessity conditions for UFD completions)
  - Theorem 8 (main UFD construction via transfinite induction)
  - Lemmas 2–7 (N-subring definition and avoidance machinery)

### 4. Loepp (1997) — Generic formal fiber control

- **Loepp, S.** *Constructing local generic formal fibers.* Journal of Algebra, 187(1), 16–38, 1997.
- **DOI:** [10.1006/jabr.1997.6768](https://doi.org/10.1006/jabr.1997.6768)
- **Key results used:**
  - Lemmas 2–4 (avoidance and unit selection)
  - Lemma 11 (transcendental adjunction)
  - Lemma 12 (fiber control — key technical lemma)
  - Lemmas 13–16 (surjectivity, transfinite union, combined step, main construction)
  - Theorem 17 (semilocal variant with weakened hypotheses)

## Supporting References (background and auxiliary results)

### 5. Farley (2016)

- **Farley, J. D.** *Quasi-completeness and localizations of polynomial domains: A conjecture from "Open Problems in Commutative Ring Theory".* Bulletin of the Korean Mathematical Society, 53(6), 1613–1615, 2016.
- **DOI:** [10.4134/BKMS.b140895](https://doi.org/10.4134/BKMS.b140895)
- **Key results used:** Theorem 3 (polynomial localizations), Corollary 4

### 6. Chevalley (1943) — Historical background

- **Chevalley, C.** *On the theory of local rings.* Annals of Mathematics (2), 44, 690–708, 1943.
- **DOI:** [10.2307/1969105](https://doi.org/10.2307/1969105)
- **Key result:** Lemma 7 (complete implies quasi-complete). Not directly used in the proof, but provides the historical motivation for the quasi-completeness hierarchy.

### 7. Nagata — Localization and UFDs

- **Nagata, M.** *Local Rings.* Interscience Tracts in Pure and Applied Mathematics, No. 13. Interscience Publishers (Wiley), 1962.
- **ISBN:** 978-0-470-62865-2
- **Key result:** Nagata's theorem: if R is a domain, p is a prime element, and the localization R[1/p] is a UFD, then R is a UFD. Used in the Krull domain / UFD step of the construction.

### 8. Samuel — Krull domain theory

- **Samuel, P.** *Lectures on Unique Factorization Domains.* TIFR Lectures on Mathematics, No. 30. Tata Institute of Fundamental Research, Bombay, 1964.
- **URL:** [mathweb.tifr.res.in/Documents/Publications/Lectures/tifr30.pdf](https://mathweb.tifr.res.in/Documents/Publications/Lectures/tifr30.pdf)
- **Key content:** Theory of Krull domains via families of DVRs, used for proving that certain intersections of UFDs remain Krull domains.

## Proof Dependency Tree

```
main_theorem (there exists a WQC ring that is not QC)
├── Jensen's construction (constructs ring A)         [Jensen 2006, Cor. 2.4]
│   ├── Complete domain choice (constructs T)          [self-contained]
│   └── UFD with prescribed fiber                      [Jensen 2006, Thm 2.2]
│       ├── Jensen Lemma 2.1                           [Jensen 2006]
│       ├── Loepp Lemmas 2–4, 11–16                    [Loepp 1997]
│       └── Heitmann Theorem 8 + Lemmas 2–7            [Heitmann 1993]
├── A is WQC and has bad quotient                      [Anderson 2014, Cor. 2]
│   └── Anderson Theorems 3–4                          [Anderson 2014]
└── QC implies property that A violates                [Anderson 2014, Thm 5]
```
