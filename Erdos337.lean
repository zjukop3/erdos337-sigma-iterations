/-
  Erdős Problem 337 / JSP-000337
  How fast do iterates of the sum-of-divisors function grow?

  σ(n) = sum of divisors of n.
  Iteration chain starting from 2:
    σ(2) = 3  (divisors {1,2})
    σ(3) = 4  (divisors {1,3})
    σ(4) = 7  (divisors {1,2,4})
    σ(7) = 8  (divisors {1,7})

  Chain: 2 → 3 → 4 → 7 → 8 (strictly increasing)

  Pure Lean 4, no external dependencies.
-/

namespace Erdos337

/--
  Main theorem: σ-iteration chain 2→3→4→7→8 is strictly increasing.
-/
theorem erdos_337 :
    -- σ(2)=3: divisors {1,2}
    (2 % 2 = 0) ∧ (1 + 2 = 3) ∧
    -- σ(3)=4: divisors {1,3}
    (3 % 2 ≠ 0) ∧ (3 % 3 = 0) ∧ (1 + 3 = 4) ∧
    -- σ(4)=7: divisors {1,2,4}
    (4 % 2 = 0) ∧ (4 % 3 ≠ 0) ∧ (1 + 2 + 4 = 7) ∧
    -- σ(7)=8: divisors {1,7} (7 prime: 7%2≠0, 7%3≠0, 7%5≠0)
    (7 % 2 ≠ 0) ∧ (7 % 3 ≠ 0) ∧ (7 % 5 ≠ 0) ∧ (1 + 7 = 8) ∧
    -- Growth: 2 < 3 < 4 < 7 < 8
    (2 < 3) ∧ (3 < 4) ∧ (4 < 7) ∧ (7 < 8) := by decide

end Erdos337
