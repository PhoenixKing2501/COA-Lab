/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Student/Desktop/Sem 5 Stuff/COA Final Assignment/newrisc/diff.v";
static int ng1[] = {1, 0};
static int ng2[] = {31, 0};
static int ng3[] = {0, 0};



static void Always_11_0(char *t0)
{
    char t7[8];
    char t21[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;

LAB0:    t1 = (t0 + 3008U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(11, ng0);
    t2 = (t0 + 3576);
    *((int *)t2) = 1;
    t3 = (t0 + 3040);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(11, ng0);

LAB5:    xsi_set_current_line(12, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);
    t4 = (t0 + 1208U);
    t6 = *((char **)t4);
    t8 = *((unsigned int *)t5);
    t9 = *((unsigned int *)t6);
    t10 = (t8 ^ t9);
    *((unsigned int *)t7) = t10;
    t4 = (t5 + 4);
    t11 = (t6 + 4);
    t12 = (t7 + 4);
    t13 = *((unsigned int *)t4);
    t14 = *((unsigned int *)t11);
    t15 = (t13 | t14);
    *((unsigned int *)t12) = t15;
    t16 = *((unsigned int *)t12);
    t17 = (t16 != 0);
    if (t17 == 1)
        goto LAB6;

LAB7:
LAB8:    t20 = (t0 + 1768);
    xsi_vlogvar_assign_value(t20, t7, 0, 0, 32);
    xsi_set_current_line(13, ng0);
    t2 = ((char*)((ng1)));
    memset(t7, 0, 8);
    xsi_vlog_signed_unary_minus(t7, 32, t2, 32);
    t3 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t3, t7, 0, 0, 32, 0LL);
    xsi_set_current_line(15, ng0);
    xsi_set_current_line(15, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB9:    t2 = (t0 + 2088);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t7, 0, 8);
    xsi_vlog_signed_greatereq(t7, 32, t4, 32, t5, 32);
    t6 = (t7 + 4);
    t8 = *((unsigned int *)t6);
    t9 = (~(t8));
    t10 = *((unsigned int *)t7);
    t13 = (t10 & t9);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB10;

LAB11:    goto LAB2;

LAB6:    t18 = *((unsigned int *)t7);
    t19 = *((unsigned int *)t12);
    *((unsigned int *)t7) = (t18 | t19);
    goto LAB8;

LAB10:    xsi_set_current_line(15, ng0);

LAB12:    xsi_set_current_line(16, ng0);
    t11 = (t0 + 1768);
    t12 = (t11 + 56U);
    t20 = *((char **)t12);
    t22 = (t0 + 1768);
    t23 = (t22 + 72U);
    t24 = *((char **)t23);
    t25 = (t0 + 2088);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    xsi_vlog_generic_get_index_select_value(t21, 1, t20, t24, 2, t27, 32, 1);
    t28 = (t21 + 4);
    t15 = *((unsigned int *)t28);
    t16 = (~(t15));
    t17 = *((unsigned int *)t21);
    t18 = (t17 & t16);
    t19 = (t18 != 0);
    if (t19 > 0)
        goto LAB13;

LAB14:
LAB15:    xsi_set_current_line(15, ng0);
    t2 = (t0 + 2088);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t7, 0, 8);
    xsi_vlog_signed_minus(t7, 32, t4, 32, t5, 32);
    t6 = (t0 + 2088);
    xsi_vlogvar_assign_value(t6, t7, 0, 0, 32);
    goto LAB9;

LAB13:    xsi_set_current_line(16, ng0);

LAB16:    xsi_set_current_line(17, ng0);
    t29 = (t0 + 2088);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    t32 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t32, t31, 0, 0, 32, 0LL);
    goto LAB15;

}

static void Cont_23_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 3256U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(23, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3672);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t4, 8);
    xsi_driver_vfirst_trans(t5, 0, 31);
    t10 = (t0 + 3592);
    *((int *)t10) = 1;

LAB1:    return;
}


extern void work_m_00000000000426034159_3948285920_init()
{
	static char *pe[] = {(void *)Always_11_0,(void *)Cont_23_1};
	xsi_register_didat("work_m_00000000000426034159_3948285920", "isim/full_tb_isim_beh.exe.sim/work/m_00000000000426034159_3948285920.didat");
	xsi_register_executes(pe);
}
