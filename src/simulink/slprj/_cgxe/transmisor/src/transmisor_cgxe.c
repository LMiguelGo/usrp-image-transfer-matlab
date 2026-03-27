/* Include files */

#include "transmisor_cgxe.h"
#include "m_3RzNf8pcd3Smj4HTKf4YfB.h"

unsigned int cgxe_transmisor_method_dispatcher(SimStruct* S, int_T method, void*
  data)
{
  if (ssGetChecksum0(S) == 1837265251 &&
      ssGetChecksum1(S) == 658115583 &&
      ssGetChecksum2(S) == 1610454414 &&
      ssGetChecksum3(S) == 848287589) {
    method_dispatcher_3RzNf8pcd3Smj4HTKf4YfB(S, method, data);
    return 1;
  }

  return 0;
}
