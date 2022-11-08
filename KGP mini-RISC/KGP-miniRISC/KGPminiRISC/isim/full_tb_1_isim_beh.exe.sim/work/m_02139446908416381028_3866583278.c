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

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/aerondight/COA Final Assignment/KGPminiRISC/reg_file.v";
static int ng1[] = {0, 0};
static int ng2[] = {32, 0};
static unsigned int ng3[] = {0U, 0U};
static int ng4[] = {1, 0};
static unsigned int ng5[] = {1U, 0U};
static unsigned int ng6[] = {2U, 0U};
static unsigned int ng7[] = {3U, 0U};
static unsigned int ng8[] = {31U, 0U};



static void Always_15_0(char *t0)
{
    char t13[8];
    char t15[8];
    char t16[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t14;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    unsigned int t27;
    int t28;
    char *t29;
    unsigned int t30;
    int t31;
    int t32;
    unsigned int t33;
    unsigned int t34;
    int t35;
    int t36;
    int t37;

LAB0:    t1 = (t0 + 3640U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(15, ng0);
    t2 = (t0 + 4208);
    *((int *)t2) = 1;
    t3 = (t0 + 3672);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(15, ng0);

LAB5:    xsi_set_current_line(16, ng0);
    t4 = (t0 + 1848U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(20, ng0);

LAB16:    xsi_set_current_line(21, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);

LAB17:    t2 = ((char*)((ng5)));
    t28 = xsi_vlog_unsigned_case_compare(t3, 2, t2, 2);
    if (t28 == 1)
        goto LAB18;

LAB19:    t2 = ((char*)((ng6)));
    t28 = xsi_vlog_unsigned_case_compare(t3, 2, t2, 2);
    if (t28 == 1)
        goto LAB20;

LAB21:    t2 = ((char*)((ng7)));
    t28 = xsi_vlog_unsigned_case_compare(t3, 2, t2, 2);
    if (t28 == 1)
        goto LAB22;

LAB23:
LAB25:
LAB24:    xsi_set_current_line(33, ng0);

LAB36:
LAB26:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(16, ng0);

LAB9:    xsi_set_current_line(17, ng0);
    xsi_set_current_line(17, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 2728);
    xsi_vlogvar_assign_value(t12, t11, 0, 0, 32);

LAB10:    t2 = (t0 + 2728);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t13, 0, 8);
    xsi_vlog_signed_less(t13, 32, t4, 32, t5, 32);
    t11 = (t13 + 4);
    t6 = *((unsigned int *)t11);
    t7 = (~(t6));
    t8 = *((unsigned int *)t13);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB11;

LAB12:    goto LAB8;

LAB11:    xsi_set_current_line(17, ng0);

LAB13:    xsi_set_current_line(18, ng0);
    t12 = ((char*)((ng3)));
    t14 = (t0 + 2568);
    t17 = (t0 + 2568);
    t18 = (t17 + 72U);
    t19 = *((char **)t18);
    t20 = (t0 + 2568);
    t21 = (t20 + 64U);
    t22 = *((char **)t21);
    t23 = (t0 + 2728);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    xsi_vlog_generic_convert_array_indices(t15, t16, t19, t22, 1, 1, t25, 32, 1);
    t26 = (t15 + 4);
    t27 = *((unsigned int *)t26);
    t28 = (!(t27));
    t29 = (t16 + 4);
    t30 = *((unsigned int *)t29);
    t31 = (!(t30));
    t32 = (t28 && t31);
    if (t32 == 1)
        goto LAB14;

LAB15:    xsi_set_current_line(17, ng0);
    t2 = (t0 + 2728);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t13, 0, 8);
    xsi_vlog_signed_add(t13, 32, t4, 32, t5, 32);
    t11 = (t0 + 2728);
    xsi_vlogvar_assign_value(t11, t13, 0, 0, 32);
    goto LAB10;

LAB14:    t33 = *((unsigned int *)t15);
    t34 = *((unsigned int *)t16);
    t35 = (t33 - t34);
    t36 = (t35 + 1);
    xsi_vlogvar_wait_assign_value(t14, t12, 0, *((unsigned int *)t16), t36, 0LL);
    goto LAB15;

LAB18:    xsi_set_current_line(22, ng0);

LAB27:    xsi_set_current_line(23, ng0);
    t4 = (t0 + 1528U);
    t5 = *((char **)t4);
    t4 = (t0 + 2568);
    t11 = (t0 + 2568);
    t12 = (t11 + 72U);
    t14 = *((char **)t12);
    t17 = (t0 + 2568);
    t18 = (t17 + 64U);
    t19 = *((char **)t18);
    t20 = (t0 + 1048U);
    t21 = *((char **)t20);
    xsi_vlog_generic_convert_array_indices(t13, t15, t14, t19, 1, 1, t21, 5, 2);
    t20 = (t13 + 4);
    t6 = *((unsigned int *)t20);
    t31 = (!(t6));
    t22 = (t15 + 4);
    t7 = *((unsigned int *)t22);
    t32 = (!(t7));
    t35 = (t31 && t32);
    if (t35 == 1)
        goto LAB28;

LAB29:    goto LAB26;

LAB20:    xsi_set_current_line(25, ng0);

LAB30:    xsi_set_current_line(26, ng0);
    t4 = (t0 + 1528U);
    t5 = *((char **)t4);
    t4 = (t0 + 2568);
    t11 = (t0 + 2568);
    t12 = (t11 + 72U);
    t14 = *((char **)t12);
    t17 = (t0 + 2568);
    t18 = (t17 + 64U);
    t19 = *((char **)t18);
    t20 = (t0 + 1208U);
    t21 = *((char **)t20);
    xsi_vlog_generic_convert_array_indices(t13, t15, t14, t19, 1, 1, t21, 5, 2);
    t20 = (t13 + 4);
    t6 = *((unsigned int *)t20);
    t31 = (!(t6));
    t22 = (t15 + 4);
    t7 = *((unsigned int *)t22);
    t32 = (!(t7));
    t35 = (t31 && t32);
    if (t35 == 1)
        goto LAB31;

LAB32:    goto LAB26;

LAB22:    xsi_set_current_line(29, ng0);

LAB33:    xsi_set_current_line(30, ng0);
    t4 = (t0 + 1528U);
    t5 = *((char **)t4);
    t4 = (t0 + 2568);
    t11 = (t0 + 2568);
    t12 = (t11 + 72U);
    t14 = *((char **)t12);
    t17 = (t0 + 2568);
    t18 = (t17 + 64U);
    t19 = *((char **)t18);
    t20 = ((char*)((ng8)));
    xsi_vlog_generic_convert_array_indices(t13, t15, t14, t19, 1, 1, t20, 5, 2);
    t21 = (t13 + 4);
    t6 = *((unsigned int *)t21);
    t31 = (!(t6));
    t22 = (t15 + 4);
    t7 = *((unsigned int *)t22);
    t32 = (!(t7));
    t35 = (t31 && t32);
    if (t35 == 1)
        goto LAB34;

LAB35:    goto LAB26;

LAB28:    t8 = *((unsigned int *)t13);
    t9 = *((unsigned int *)t15);
    t36 = (t8 - t9);
    t37 = (t36 + 1);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, *((unsigned int *)t15), t37, 0LL);
    goto LAB29;

LAB31:    t8 = *((unsigned int *)t13);
    t9 = *((unsigned int *)t15);
    t36 = (t8 - t9);
    t37 = (t36 + 1);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, *((unsigned int *)t15), t37, 0LL);
    goto LAB32;

LAB34:    t8 = *((unsigned int *)t13);
    t9 = *((unsigned int *)t15);
    t36 = (t8 - t9);
    t37 = (t36 + 1);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, *((unsigned int *)t15), t37, 0LL);
    goto LAB35;

}

static void Always_41_1(char *t0)
{
    char t7[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    t1 = (t0 + 3888U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(41, ng0);
    t2 = (t0 + 4224);
    *((int *)t2) = 1;
    t3 = (t0 + 3920);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(41, ng0);

LAB5:    xsi_set_current_line(42, ng0);
    t4 = (t0 + 2568);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t0 + 2568);
    t9 = (t8 + 72U);
    t10 = *((char **)t9);
    t11 = (t0 + 2568);
    t12 = (t11 + 64U);
    t13 = *((char **)t12);
    t14 = (t0 + 1048U);
    t15 = *((char **)t14);
    xsi_vlog_generic_get_array_select_value(t7, 32, t6, t10, t13, 1, 1, t15, 5, 2);
    t14 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t14, t7, 0, 0, 32, 0LL);
    xsi_set_current_line(43, ng0);
    t2 = (t0 + 2568);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2568);
    t6 = (t5 + 72U);
    t8 = *((char **)t6);
    t9 = (t0 + 2568);
    t10 = (t9 + 64U);
    t11 = *((char **)t10);
    t12 = (t0 + 1208U);
    t13 = *((char **)t12);
    xsi_vlog_generic_get_array_select_value(t7, 32, t4, t8, t11, 1, 1, t13, 5, 2);
    t12 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t12, t7, 0, 0, 32, 0LL);
    goto LAB2;

}


extern void work_m_02139446908416381028_3866583278_init()
{
	static char *pe[] = {(void *)Always_15_0,(void *)Always_41_1};
	xsi_register_didat("work_m_02139446908416381028_3866583278", "isim/full_tb_1_isim_beh.exe.sim/work/m_02139446908416381028_3866583278.didat");
	xsi_register_executes(pe);
}
