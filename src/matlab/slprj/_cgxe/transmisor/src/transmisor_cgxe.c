/* Include files */

#include "transmisor_cgxe.h"
#include "m_fbkVLcGTGg3rtCem5knjcB.h"

unsigned int cgxe_transmisor_method_dispatcher(SimStruct* S, int_T method, void*
  data)
{
  if (ssGetChecksum0(S) == 1192762046 &&
      ssGetChecksum1(S) == 3729368388 &&
      ssGetChecksum2(S) == 3483804033 &&
      ssGetChecksum3(S) == 4016408106) {
    method_dispatcher_fbkVLcGTGg3rtCem5knjcB(S, method, data);
    return 1;
  }

  return 0;
}
