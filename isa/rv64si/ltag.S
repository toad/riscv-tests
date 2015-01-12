#*****************************************************************************
# ld.S
#-----------------------------------------------------------------------------
#
# Test ld instruction.
#

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64S
RVTEST_CODE_BEGIN

  #-------------------------------------------------------------
  # Basic tests
  #-------------------------------------------------------------

  TEST_LD_OP( 2, ltag, 0x0000000000000000, 0,  tdat );
  TEST_LD_OP( 3, ltag, 0x0000000000000000, 8,  tdat );
  TEST_LD_OP( 4, ltag, 0x0000000000000000, 16, tdat );
  TEST_LD_OP( 5, ltag, 0x0000000000000000, 24, tdat );

  # Test with negative offset

  TEST_ST_OP( 6, ltag, stag, 0x0000000000000000, -24, tdat4 );
  TEST_ST_OP( 7, ltag, stag, 0x0000000000000001, -16, tdat4 );
  TEST_ST_OP( 8, ltag, stag, 0x0000000000000002, -8,  tdat4 );
  TEST_ST_OP( 9, ltag, stag, 0x0000000000000003, 0,   tdat4 );

  # read again to make sure the tag is not read from bypass
  TEST_LD_OP( 10, ltag, 0x0000000000000000, 0,  tdat );
  TEST_LD_OP( 11, ltag, 0x0000000000000001, 8,  tdat );
  TEST_LD_OP( 12, ltag, 0x0000000000000002, 16, tdat );
  TEST_LD_OP( 13, ltag, 0x0000000000000003, 24, tdat );
  

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

tdat:
tdat1:  .dword 0x00ff00ff00ff00ff
tdat2:  .dword 0xff00ff00ff00ff00
tdat3:  .dword 0x0ff00ff00ff00ff0
tdat4:  .dword 0xf00ff00ff00ff00f

RVTEST_DATA_END
