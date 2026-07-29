import canonicalLaneMathlib.AdmissibleClass
import GaussianProcessesCanonicalLaneLean.GaussianProcess

namespace HautevilleHouse
namespace GaussianProcessesCanonicalLaneLean

structure HyperparameterInference (X : Type u) (gp : GaussianProcess X) where
  marginalLikelihood : ℝ
  gradientStep : ℝ → ℝ
  convergenceCriterion : Prop
  optimalParameters : List ℝ

structure HyperparameterInferenceEvidence (X : Type u) (gp : GaussianProcess X) (hi : HyperparameterInference X gp) where
  convergenceCriterionClosed : hi.convergenceCriterion

def HyperparameterInferenceClosed (X : Type u) (gp : GaussianProcess X) (hi : HyperparameterInference X gp) : Prop :=
  hi.convergenceCriterion

theorem hyperparameter_inference_closed_from_evidence (X : Type u) (gp : GaussianProcess X) (hi : HyperparameterInference X gp) (E : HyperparameterInferenceEvidence X gp hi) : HyperparameterInferenceClosed X gp hi := by
  exact E.convergenceCriterionClosed

end GaussianProcessesCanonicalLaneLean
end HautevilleHouse
