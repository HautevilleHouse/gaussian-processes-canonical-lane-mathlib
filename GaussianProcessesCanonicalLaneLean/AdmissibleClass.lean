import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GaussianProcessesCanonicalLaneLean

structure AdmissibleClass where
  object : GaussianProcessAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  GaussianProcessWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end GaussianProcessesCanonicalLaneLean
end HautevilleHouse
