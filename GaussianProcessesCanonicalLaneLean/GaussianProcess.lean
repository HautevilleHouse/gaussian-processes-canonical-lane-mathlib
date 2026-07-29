import canonicalLaneMathlib.AdmissibleClass
import GaussianProcessesCanonicalLaneLean.GPKernel
import GaussianProcessesCanonicalLaneLean.GPMeanFunction

namespace HautevilleHouse
namespace GaussianProcessesCanonicalLaneLean

structure GaussianProcess (X : Type u) where
  mean : GPMeanFunction X
  kernel : GPKernel X
  indexSet : Set X
  finiteDimDistributionsConsistent : Prop

structure GaussianProcessEvidence (X : Type u) (gp : GaussianProcess X) where
  meanClosed : GPMeanFunctionClosed X gp.mean
  kernelClosed : GPKernelClosed X gp.kernel
  finiteDimDistributionsConsistentClosed : gp.finiteDimDistributionsConsistent

def GaussianProcessClosed (X : Type u) (gp : GaussianProcess X) : Prop :=
  GPMeanFunctionClosed X gp.mean ∧ GPKernelClosed X gp.kernel ∧ gp.finiteDimDistributionsConsistent

theorem gaussian_process_closed_from_evidence (X : Type u) (gp : GaussianProcess X) (E : GaussianProcessEvidence X gp) : GaussianProcessClosed X gp := by
  exact And.intro E.meanClosed (And.intro E.kernelClosed E.finiteDimDistributionsConsistentClosed)

end GaussianProcessesCanonicalLaneLean
end HautevilleHouse
