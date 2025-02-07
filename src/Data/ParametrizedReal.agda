------------------------------------------------------------------------
-- The Agda standard library
--
-- Parametrized Real numbers
------------------------------------------------------------------------

{-# OPTIONS --without-K --safe #-}

open import Data.ParametrizedReal.Interface using (Reals)

module Data.ParametrizedReal (RealInterface : Reals) where

open import Relation.Nullary using (yes; no)

------------------------------------------------------------------------
-- Publicly re-export contents of core module and queries

open import Data.ParametrizedReal.Base RealInterface public
open import Data.ParametrizedReal.Properties.Core RealInterface public
  using (_≟_; _≤?_; _<?_)

infixl 7 _⊓_
infixl 6 _⊔_

-- max
_⊔_ : ℝ → ℝ → ℝ
x ⊔ y with x ≤? y
... | yes _ = y
... | no  _ = x

-- min
_⊓_ : ℝ → ℝ → ℝ
x ⊓ y with x ≤? y
... | yes _ = x
... | no  _ = y

-- absolute value
∣_∣ : ℝ → ℝ
∣ x ∣  with 0ℝ ≤? x
... | yes _ = x
... | no  _ = - x

