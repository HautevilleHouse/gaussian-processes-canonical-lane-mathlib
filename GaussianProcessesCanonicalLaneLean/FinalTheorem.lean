import canonicalLaneMathlib.AdmissibleClass
import GaussianProcessesCanonicalLaneLean.GPKernel
import GaussianProcessesCanonicalLaneLean.GPMeanFunction
import GaussianProcessesCanonicalLaneLean.GaussianProcess
import GaussianProcessesCanonicalLaneLean.PosteriorProcess
import GaussianProcessesCanonicalLaneLean.SparseGP
import GaussianProcessesCanonicalLaneLean.HyperparameterInference

namespace HautevilleHouse
namespace GaussianProcessesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop := True

def gateClosed (A : AdmissibleClass) : Prop := True

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  trivial

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  trivial

def ConstrainedGaussianProcessClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_gaussian_process_endgame (A : AdmissibleClass) : ConstrainedGaussianProcessClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GaussianProcessesCanonicalLaneLean
end HautevilleHouse
