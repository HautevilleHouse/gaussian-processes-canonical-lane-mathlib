import canonicalLaneMathlib.AdmissibleClass
import GaussianProcessesCanonicalLaneLean.GaussianProcess

namespace HautevilleHouse
namespace GaussianProcessesCanonicalLaneLean

structure PosteriorProcess (X : Type u) (gp : GaussianProcess X) where
  observations : List (X × ℝ)
  posteriorMean : GPMeanFunction X
  posteriorKernel : GPKernel X
  posteriorFormulasCorrect : Prop

structure PosteriorProcessEvidence (X : Type u) (gp : GaussianProcess X) (pp : PosteriorProcess X gp) where
  posteriorMeanClosed : GPMeanFunctionClosed X pp.posteriorMean
  posteriorKernelClosed : GPKernelClosed X pp.posteriorKernel
  posteriorFormulasCorrectClosed : pp.posteriorFormulasCorrect

def PosteriorProcessClosed (X : Type u) (gp : GaussianProcess X) (pp : PosteriorProcess X gp) : Prop :=
  GPMeanFunctionClosed X pp.posteriorMean ∧ GPKernelClosed X pp.posteriorKernel ∧ pp.posteriorFormulasCorrect

theorem posterior_process_closed_from_evidence (X : Type u) (gp : GaussianProcess X) (pp : PosteriorProcess X gp) (E : PosteriorProcessEvidence X gp pp) : PosteriorProcessClosed X gp pp := by
  exact And.intro E.posteriorMeanClosed (And.intro E.posteriorKernelClosed E.posteriorFormulasCorrectClosed)

end GaussianProcessesCanonicalLaneLean
end HautevilleHouse
