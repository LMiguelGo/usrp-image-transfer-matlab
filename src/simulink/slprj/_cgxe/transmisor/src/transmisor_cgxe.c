/* Include files */

#include "transmisor_cgxe.h"
#include "m_otduqPw1TUwalbgDHtdM9C.h"

unsigned int cgxe_transmisor_method_dispatcher(SimStruct* S, int_T method, void*
  data)
{
  if (ssGetChecksum0(S) == 1278325745 &&
      ssGetChecksum1(S) == 3279531101 &&
      ssGetChecksum2(S) == 852901959 &&
      ssGetChecksum3(S) == 3250973885) {
    method_dispatcher_otduqPw1TUwalbgDHtdM9C(S, method, data);
    return 1;
  }

  return 0;
}
