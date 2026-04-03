import Mathlib.Algebra.Algebra.Operations
import Mathlib.RingTheory.LocalRing.MaximalIdeal.Defs
import Mathlib.RingTheory.Noetherian.Defs

variable (R : Type*) [CommRing R] [IsLocalRing R]

/-- A local ring `R` is quasi-complete if for any antitone sequence of ideals `A : ℕ → Ideal R`
and each `k : ℕ`, there exists `s` such that `A s ≤ (⨅ n, A n) ⊔ (IsLocalRing.maximalIdeal R) ^ k`.

This is Definition 1.1 of Anderson (2014). -/
def IsQuasiComplete : Prop :=
  ∀ (A : ℕ → Ideal R), Antitone A →
    ∀ (k : ℕ), ∃ s, A s ≤ (⨅ n, A n) ⊔ (IsLocalRing.maximalIdeal R) ^ k

/-- A local ring `R` is weakly quasi-complete if for any antitone sequence of ideals
`A : ℕ → Ideal R` with `⨅ n, A n = ⊥` and each `k : ℕ`, there exists `s` such that
`A s ≤ (IsLocalRing.maximalIdeal R) ^ k`.

Equivalently, this is `IsQuasiComplete` restricted to sequences whose intersection is `⊥`. -/
def IsWeaklyQuasiComplete : Prop :=
  ∀ (A : ℕ → Ideal R), Antitone A → (⨅ n, A n) = ⊥ →
    ∀ (k : ℕ), ∃ s, A s ≤ (IsLocalRing.maximalIdeal R) ^ k

/-- **Main Theorem**: There exists a weakly quasi-complete Noetherian
local ring that is not quasi-complete. -/
theorem main_theorem :
    ∃ (R : Type) (_ : CommRing R) (_ : IsLocalRing R) (_ : IsNoetherianRing R),
      IsWeaklyQuasiComplete R ∧ ¬ IsQuasiComplete R := by
  sorry
