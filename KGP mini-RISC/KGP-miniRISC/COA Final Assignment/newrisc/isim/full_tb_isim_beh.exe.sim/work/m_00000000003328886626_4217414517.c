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
static const char *ng0 = "C:/Users/Student/Desktop/Sem 5 Stuff/COA Final Assignment/newrisc/clock_divider.v";
static unsigned int ng1[] = {1U, 0U};
static unsigned int ng2[] = {100000U, 0U};
static int ng3[] = {1, 0};
static unsigned int ng4[] = {0U, 0U};
static int ng5[] = {2, 0};



static void Always_30_0(char *t0)
{
    char t8[8];
    char t10[8];
    char t20[8];
    char t21[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;

LAB0:    t1 = (t0 + 2664U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(30, ng0);
    t2 = (t0 + 2984);
    *((int *)t2) = 1;
    t3 = (t0 + 2696);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(30, ng0);

LAB5:    xsi_set_current_line(31, ng0);
    t4 = (t0 + 1744);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng1)));
    memset(t8, 0, 8);
    xsi_vlog_unsigned_add(t8, 32, t6, 32, t7, 32);
    t9 = (t0 + 1744);
    xsi_vlogvar_wait_assign_value(t9, t8, 0, 0, 32, 0LL);
    xsi_set_current_line(33, ng0);
    t2 = (t0 + 1744);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    t6 = ((char*)((ng3)));
    memset(t8, 0, 8);
    xsi_vlog_unsigned_minus(t8, 32, t5, 32, t6, 32);
    memset(t10, 0, 8);
    t7 = (t4 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB7;

LAB6:    t9 = (t8 + 4);
    if (*((unsigned int *)t9) != 0)
        goto LAB7;

LAB10:    if (*((unsigned int *)t4) < *((unsigned int *)t8))
        goto LAB9;

LAB8:    *((unsigned int *)t10) = 1;

LAB9:    t12 = (t10 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (~(t13));
    t15 = *((unsigned int *)t10);
    t16 = (t15 & t14);
    t17 = (t16 != 0);
    if (t17 > 0)
        goto LAB11;

LAB12:
LAB13:    xsi_set_current_line(36, ng0);
    t2 = (t0 + 1744);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    t6 = ((char*)((ng5)));
    memset(t20, 0, 8);
    xsi_vlog_unsigned_divide(t20, 32, t5, 32, t6, 32);
    memset(t21, 0, 8);
    t7 = (t4 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB15;

LAB14:    t9 = (t20 + 4);
    if (*((unsigned int *)t9) != 0)
        goto LAB15;

LAB18:    if (*((unsigned int *)t4) < *((unsigned int *)t20))
        goto LAB16;

LAB17:    memset(t10, 0, 8);
    t12 = (t21 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (~(t13));
    t15 = *((unsigned int *)t21);
    t16 = (t15 & t14);
    t17 = (t16 & 1U);
    if (t17 != 0)
        goto LAB19;

LAB20:    if (*((unsigned int *)t12) != 0)
        goto LAB21;

LAB22:    t19 = (t10 + 4);
    t22 = *((unsigned int *)t10);
    t23 = *((unsigned int *)t19);
    t24 = (t22 || t23);
    if (t24 > 0)
        goto LAB23;

LAB24:    t26 = *((unsigned int *)t10);
    t27 = (~(t26));
    t28 = *((unsigned int *)t19);
    t29 = (t27 || t28);
    if (t29 > 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t19) > 0)
        goto LAB27;

LAB28:    if (*((unsigned int *)t10) > 0)
        goto LAB29;

LAB30:    memcpy(t8, t30, 8);

LAB31:    t31 = (t0 + 1584);
    xsi_vlogvar_wait_assign_value(t31, t8, 0, 0, 1, 0LL);
    goto LAB2;

LAB7:    t11 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB9;

LAB11:    xsi_set_current_line(34, ng0);
    t18 = ((char*)((ng4)));
    t19 = (t0 + 1744);
    xsi_vlogvar_wait_assign_value(t19, t18, 0, 0, 32, 0LL);
    goto LAB13;

LAB15:    t11 = (t21 + 4);
    *((unsigned int *)t21) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB17;

LAB16:    *((unsigned int *)t21) = 1;
    goto LAB17;

LAB19:    *((unsigned int *)t10) = 1;
    goto LAB22;

LAB21:    t18 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t18) = 1;
    goto LAB22;

LAB23:    t25 = ((char*)((ng4)));
    goto LAB24;

LAB25:    t30 = ((char*)((ng1)));
    goto LAB26;

LAB27:    xsi_vlog_unsigned_bit_combine(t8, 1, t25, 1, t30, 1);
    goto LAB31;

LAB29:    memcpy(t8, t25, 8);
    goto LAB31;

}


extern void work_m_00000000003328886626_4217414517_init()
{
	static char *pe[] = {(void *)Always_30_0};
	xsi_register_didat("work_m_00000000003328886626_4217414517", "isim/full_tb_isim_beh.exe.sim/work/m_00000000003328886626_4217414517.didat");
	xsi_register_executes(pe);
}
