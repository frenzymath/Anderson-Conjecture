/-
Copyright (c) 2026 FrenzyMath. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.Algebra.Lie.OfAssociative
import Mathlib.RingTheory.AdicCompletion.Algebra
import Mathlib.RingTheory.LocalRing.MaximalIdeal.Defs

/-!
# Trivial Generic Formal Fiber

A Noetherian local domain A has trivial generic formal fiber if
every prime of its adic completion contracting to zero is itself
zero. This is the key condition in Jensen's construction of UFDs
with prescribed completions.
-/

/-- A local domain `A` has **trivial generic formal fiber** if every
prime ideal of its completion that contracts to zero in `A` is itself
zero. -/
def HasTrivialGenericFormalFiber
    (R : Type*) [CommRing R] [IsDomain R] [IsLocalRing R]
    [IsNoetherianRing R] : Prop :=
  ∀ (P : Ideal (AdicCompletion (IsLocalRing.maximalIdeal R) R)),
    P.IsPrime →
    Ideal.comap
      (algebraMap R
        (AdicCompletion (IsLocalRing.maximalIdeal R) R)) P = ⊥ →
    P = ⊥
