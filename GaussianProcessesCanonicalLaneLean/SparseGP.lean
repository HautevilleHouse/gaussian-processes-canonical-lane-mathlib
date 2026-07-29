import canonicalLaneMathlib.AdmissibleClass
import GaussianProcessesCanonicalLaneLean.GaussianProcess

namespace HautevilleHouse
namespace GaussianProcessesCanonicalLaneLean

structure SparseGP (X : Type u) (gp : GaussianProcess X) where
  inducingPoints : List X
  sparseApproxKernel : GPKernel X
  approximationError : ℝ
  errorBound : Prop

structure SparseGPEvidence (X : Type u) (gp : GaussianProcess X) (sgp : SparseGP X gp) where
  sparseApproxKernelClosed : GPKernelClosed X sgp.sparseApproxKernel
  errorBoundClosed : sgp.errorBound

def SparseGPClosed (X : Type u) (gp : GaussianProcess X) (sgp : SparseGP X gp) : Prop :=
  GPKernelClosed X sgp.sparseApproxKernel ∧ sgp.errorBound

theorem sparse_gp_closed_from_evidence (X : Type u) (gp : GaussianProcess X) (sgp : SparseGP X gp) (E : SparseGPEvidence X gp sgp) : SparseGPClosed X gp sgp := by
  exact And.intro E.sparseApproxKernelClosed E.errorBoundClosed

end GaussianProcessesCanonicalLaneLean
end HautevilleHouse
