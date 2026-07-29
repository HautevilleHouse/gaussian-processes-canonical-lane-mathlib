import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GaussianProcessesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  GaussianProcessWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A :=
  A.object.conclusion

end GaussianProcessesCanonicalLaneLean
end HautevilleHouse
