import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GaussianProcessesCanonicalLaneLean

structure GPKernel (X : Type u) where
  kernelFn : X → X → ℝ
  symmetric : ∀ x y, kernelFn x y = kernelFn y x
  positiveSemidefinite : ∀ (n : ℕ) (xs : Fin n → X) (α : Fin n → ℝ), 0 ≤ ∑ i j, α i * α j * kernelFn (xs i) (xs j)

structure GPKernelEvidence (X : Type u) (K : GPKernel X) where
  symmetricClosed : K.symmetric
  positiveSemidefiniteClosed : K.positiveSemidefinite

def GPKernelClosed (X : Type u) (K : GPKernel X) : Prop := 
  K.symmetric ∧ K.positiveSemidefinite

theorem gp_kernel_closed_from_evidence (X : Type u) (K : GPKernel X) (E : GPKernelEvidence X K) : GPKernelClosed X K := by
  exact And.intro E.symmetricClosed E.positiveSemidefiniteClosed

end GaussianProcessesCanonicalLaneLean
end HautevilleHouse
