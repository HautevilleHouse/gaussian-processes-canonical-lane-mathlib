import canonicalLaneMathlib.AdmissibleClass
import GaussianProcessesCanonicalLaneLean.GPKernel

namespace HautevilleHouse
namespace GaussianProcessesCanonicalLaneLean

structure GPMeanFunction (X : Type u) where
  meanFn : X → ℝ
  bounded : ∃ (M : ℝ), ∀ x, |meanFn x| ≤ M

structure GPMeanFunctionEvidence (X : Type u) (m : GPMeanFunction X) where
  boundedClosed : m.bounded

def GPMeanFunctionClosed (X : Type u) (m : GPMeanFunction X) : Prop :=
  m.bounded

theorem gp_mean_function_closed_from_evidence (X : Type u) (m : GPMeanFunction X) (E : GPMeanFunctionEvidence X m) : GPMeanFunctionClosed X m := by
  exact E.boundedClosed

end GaussianProcessesCanonicalLaneLean
end HautevilleHouse
