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
static const char *ng0 = "/home/aerondight/COA Final Assignment/KGPminiRISC/branch_control.v";
static unsigned int ng1[] = {4U, 0U};
static unsigned int ng2[] = {0U, 0U};
static int ng3[] = {0, 0};
static unsigned int ng4[] = {1U, 0U};
static unsigned int ng5[] = {2U, 0U};
static unsigned int ng6[] = {3U, 0U};
static unsigned int ng7[] = {5U, 0U};



static void Cont_16_0(char *t0)
{
    char t4[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 4440U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(16, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_add(t4, 32, t3, 32, t2, 32);
    t5 = (t0 + 6424);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t4, 8);
    xsi_driver_vfirst_trans(t5, 0, 31);
    t10 = (t0 + 6248);
    *((int *)t10) = 1;

LAB1:    return;
}

static void Cont_17_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    t1 = (t0 + 4688U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(17, ng0);
    t2 = (t0 + 1688U);
    t3 = *((char **)t2);
    t2 = (t0 + 6488);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t3, 8);
    xsi_driver_vfirst_trans(t2, 0, 31);
    t8 = (t0 + 6264);
    *((int *)t8) = 1;

LAB1:    return;
}

static void Cont_18_2(char *t0)
{
    char t3[8];
    char t6[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    t1 = (t0 + 4936U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(18, ng0);
    t2 = ((char*)((ng2)));
    t4 = (t0 + 1368U);
    t5 = *((char **)t4);
    t4 = (t0 + 1208U);
    t7 = *((char **)t4);
    memset(t6, 0, 8);
    t4 = (t6 + 4);
    t8 = (t7 + 4);
    t9 = *((unsigned int *)t7);
    t10 = (t9 >> 28);
    *((unsigned int *)t6) = t10;
    t11 = *((unsigned int *)t8);
    t12 = (t11 >> 28);
    *((unsigned int *)t4) = t12;
    t13 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t13 & 15U);
    t14 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t14 & 15U);
    xsi_vlogtype_concat(t3, 32, 32, 3U, t6, 4, t5, 26, t2, 2);
    t15 = (t0 + 6552);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t3, 8);
    xsi_driver_vfirst_trans(t15, 0, 31);
    t20 = (t0 + 6280);
    *((int *)t20) = 1;

LAB1:    return;
}

static void Cont_19_3(char *t0)
{
    char t3[8];
    char t6[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    t1 = (t0 + 5184U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(19, ng0);
    t2 = ((char*)((ng2)));
    t4 = (t0 + 1528U);
    t5 = *((char **)t4);
    t4 = (t0 + 1208U);
    t7 = *((char **)t4);
    memset(t6, 0, 8);
    t4 = (t6 + 4);
    t8 = (t7 + 4);
    t9 = *((unsigned int *)t7);
    t10 = (t9 >> 23);
    *((unsigned int *)t6) = t10;
    t11 = *((unsigned int *)t8);
    t12 = (t11 >> 23);
    *((unsigned int *)t4) = t12;
    t13 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t13 & 511U);
    t14 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t14 & 511U);
    xsi_vlogtype_concat(t3, 32, 32, 3U, t6, 9, t5, 21, t2, 2);
    t15 = (t0 + 6616);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t3, 8);
    xsi_driver_vfirst_trans(t15, 0, 31);
    t20 = (t0 + 6296);
    *((int *)t20) = 1;

LAB1:    return;
}

static void Always_29_4(char *t0)
{
    char t4[8];
    char t16[8];
    char t17[8];
    char t20[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    int t15;
    char *t18;
    char *t19;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    char *t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;

LAB0:    t1 = (t0 + 5432U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(29, ng0);
    t2 = (t0 + 6312);
    *((int *)t2) = 1;
    t3 = (t0 + 5464);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(29, ng0);

LAB5:    xsi_set_current_line(30, ng0);
    t5 = (t0 + 2008U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t4 + 4);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t6);
    t9 = (t8 >> 3);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 3);
    *((unsigned int *)t5) = t11;
    t12 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t12 & 3U);
    t13 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t13 & 3U);

LAB6:    t14 = ((char*)((ng2)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 2, t14, 2);
    if (t15 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng4)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t15 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng5)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t15 == 1)
        goto LAB11;

LAB12:
LAB14:
LAB13:    xsi_set_current_line(44, ng0);

LAB58:    xsi_set_current_line(45, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 3528);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 32);

LAB15:    goto LAB2;

LAB7:    xsi_set_current_line(32, ng0);

LAB16:    xsi_set_current_line(33, ng0);
    t18 = (t0 + 1688U);
    t19 = *((char **)t18);
    t18 = ((char*)((ng3)));
    memset(t20, 0, 8);
    xsi_vlog_signed_less(t20, 32, t19, 32, t18, 32);
    memset(t17, 0, 8);
    t21 = (t20 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t20);
    t25 = (t24 & t23);
    t26 = (t25 & 1U);
    if (t26 != 0)
        goto LAB17;

LAB18:    if (*((unsigned int *)t21) != 0)
        goto LAB19;

LAB20:    t28 = (t17 + 4);
    t29 = *((unsigned int *)t17);
    t30 = *((unsigned int *)t28);
    t31 = (t29 || t30);
    if (t31 > 0)
        goto LAB21;

LAB22:    t34 = *((unsigned int *)t17);
    t35 = (~(t34));
    t36 = *((unsigned int *)t28);
    t37 = (t35 || t36);
    if (t37 > 0)
        goto LAB23;

LAB24:    if (*((unsigned int *)t28) > 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t17) > 0)
        goto LAB27;

LAB28:    memcpy(t16, t38, 8);

LAB29:    t32 = (t0 + 3528);
    xsi_vlogvar_assign_value(t32, t16, 0, 0, 32);
    goto LAB15;

LAB9:    xsi_set_current_line(36, ng0);

LAB30:    xsi_set_current_line(37, ng0);
    t3 = (t0 + 1688U);
    t5 = *((char **)t3);
    t3 = ((char*)((ng3)));
    memset(t20, 0, 8);
    xsi_vlog_signed_equal(t20, 32, t5, 32, t3, 32);
    memset(t17, 0, 8);
    t6 = (t20 + 4);
    t8 = *((unsigned int *)t6);
    t9 = (~(t8));
    t10 = *((unsigned int *)t20);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB31;

LAB32:    if (*((unsigned int *)t6) != 0)
        goto LAB33;

LAB34:    t14 = (t17 + 4);
    t13 = *((unsigned int *)t17);
    t22 = *((unsigned int *)t14);
    t23 = (t13 || t22);
    if (t23 > 0)
        goto LAB35;

LAB36:    t24 = *((unsigned int *)t17);
    t25 = (~(t24));
    t26 = *((unsigned int *)t14);
    t29 = (t25 || t26);
    if (t29 > 0)
        goto LAB37;

LAB38:    if (*((unsigned int *)t14) > 0)
        goto LAB39;

LAB40:    if (*((unsigned int *)t17) > 0)
        goto LAB41;

LAB42:    memcpy(t16, t21, 8);

LAB43:    t18 = (t0 + 3528);
    xsi_vlogvar_assign_value(t18, t16, 0, 0, 32);
    goto LAB15;

LAB11:    xsi_set_current_line(40, ng0);

LAB44:    xsi_set_current_line(41, ng0);
    t3 = (t0 + 1688U);
    t5 = *((char **)t3);
    t3 = ((char*)((ng3)));
    memset(t20, 0, 8);
    xsi_vlog_signed_not_equal(t20, 32, t5, 32, t3, 32);
    memset(t17, 0, 8);
    t6 = (t20 + 4);
    t8 = *((unsigned int *)t6);
    t9 = (~(t8));
    t10 = *((unsigned int *)t20);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB45;

LAB46:    if (*((unsigned int *)t6) != 0)
        goto LAB47;

LAB48:    t14 = (t17 + 4);
    t13 = *((unsigned int *)t17);
    t22 = *((unsigned int *)t14);
    t23 = (t13 || t22);
    if (t23 > 0)
        goto LAB49;

LAB50:    t24 = *((unsigned int *)t17);
    t25 = (~(t24));
    t26 = *((unsigned int *)t14);
    t29 = (t25 || t26);
    if (t29 > 0)
        goto LAB51;

LAB52:    if (*((unsigned int *)t14) > 0)
        goto LAB53;

LAB54:    if (*((unsigned int *)t17) > 0)
        goto LAB55;

LAB56:    memcpy(t16, t21, 8);

LAB57:    t18 = (t0 + 3528);
    xsi_vlogvar_assign_value(t18, t16, 0, 0, 32);
    goto LAB15;

LAB17:    *((unsigned int *)t17) = 1;
    goto LAB20;

LAB19:    t27 = (t17 + 4);
    *((unsigned int *)t17) = 1;
    *((unsigned int *)t27) = 1;
    goto LAB20;

LAB21:    t32 = (t0 + 2648U);
    t33 = *((char **)t32);
    goto LAB22;

LAB23:    t32 = (t0 + 2168U);
    t38 = *((char **)t32);
    goto LAB24;

LAB25:    xsi_vlog_unsigned_bit_combine(t16, 32, t33, 32, t38, 32);
    goto LAB29;

LAB27:    memcpy(t16, t33, 8);
    goto LAB29;

LAB31:    *((unsigned int *)t17) = 1;
    goto LAB34;

LAB33:    t7 = (t17 + 4);
    *((unsigned int *)t17) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB34;

LAB35:    t18 = (t0 + 2648U);
    t19 = *((char **)t18);
    goto LAB36;

LAB37:    t18 = (t0 + 2168U);
    t21 = *((char **)t18);
    goto LAB38;

LAB39:    xsi_vlog_unsigned_bit_combine(t16, 32, t19, 32, t21, 32);
    goto LAB43;

LAB41:    memcpy(t16, t19, 8);
    goto LAB43;

LAB45:    *((unsigned int *)t17) = 1;
    goto LAB48;

LAB47:    t7 = (t17 + 4);
    *((unsigned int *)t17) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB48;

LAB49:    t18 = (t0 + 2648U);
    t19 = *((char **)t18);
    goto LAB50;

LAB51:    t18 = (t0 + 2168U);
    t21 = *((char **)t18);
    goto LAB52;

LAB53:    xsi_vlog_unsigned_bit_combine(t16, 32, t19, 32, t21, 32);
    goto LAB57;

LAB55:    memcpy(t16, t19, 8);
    goto LAB57;

}

static void Cont_53_5(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t16[8];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    char *t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    char *t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    char *t46;
    char *t47;
    char *t48;
    char *t49;
    char *t50;
    char *t51;

LAB0:    t1 = (t0 + 5680U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(53, ng0);
    t2 = (t0 + 2008U);
    t5 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t7 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 3);
    t10 = (t9 & 1);
    *((unsigned int *)t6) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 3);
    t13 = (t12 & 1);
    *((unsigned int *)t2) = t13;
    t14 = (t0 + 1848U);
    t15 = *((char **)t14);
    t17 = *((unsigned int *)t6);
    t18 = *((unsigned int *)t15);
    t19 = (t17 ^ t18);
    *((unsigned int *)t16) = t19;
    t14 = (t6 + 4);
    t20 = (t15 + 4);
    t21 = (t16 + 4);
    t22 = *((unsigned int *)t14);
    t23 = *((unsigned int *)t20);
    t24 = (t22 | t23);
    *((unsigned int *)t21) = t24;
    t25 = *((unsigned int *)t21);
    t26 = (t25 != 0);
    if (t26 == 1)
        goto LAB4;

LAB5:
LAB6:    memset(t4, 0, 8);
    t29 = (t16 + 4);
    t30 = *((unsigned int *)t29);
    t31 = (~(t30));
    t32 = *((unsigned int *)t16);
    t33 = (t32 & t31);
    t34 = (t33 & 1U);
    if (t34 != 0)
        goto LAB7;

LAB8:    if (*((unsigned int *)t29) != 0)
        goto LAB9;

LAB10:    t36 = (t4 + 4);
    t37 = *((unsigned int *)t4);
    t38 = *((unsigned int *)t36);
    t39 = (t37 || t38);
    if (t39 > 0)
        goto LAB11;

LAB12:    t42 = *((unsigned int *)t4);
    t43 = (~(t42));
    t44 = *((unsigned int *)t36);
    t45 = (t43 || t44);
    if (t45 > 0)
        goto LAB13;

LAB14:    if (*((unsigned int *)t36) > 0)
        goto LAB15;

LAB16:    if (*((unsigned int *)t4) > 0)
        goto LAB17;

LAB18:    memcpy(t3, t46, 8);

LAB19:    t40 = (t0 + 6680);
    t47 = (t40 + 56U);
    t48 = *((char **)t47);
    t49 = (t48 + 56U);
    t50 = *((char **)t49);
    memcpy(t50, t3, 8);
    xsi_driver_vfirst_trans(t40, 0, 31);
    t51 = (t0 + 6328);
    *((int *)t51) = 1;

LAB1:    return;
LAB4:    t27 = *((unsigned int *)t16);
    t28 = *((unsigned int *)t21);
    *((unsigned int *)t16) = (t27 | t28);
    goto LAB6;

LAB7:    *((unsigned int *)t4) = 1;
    goto LAB10;

LAB9:    t35 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t35) = 1;
    goto LAB10;

LAB11:    t40 = (t0 + 2488U);
    t41 = *((char **)t40);
    goto LAB12;

LAB13:    t40 = (t0 + 2168U);
    t46 = *((char **)t40);
    goto LAB14;

LAB15:    xsi_vlog_unsigned_bit_combine(t3, 32, t41, 32, t46, 32);
    goto LAB19;

LAB17:    memcpy(t3, t41, 8);
    goto LAB19;

}

static void Always_62_6(char *t0)
{
    char t4[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    int t15;
    char *t16;
    char *t17;

LAB0:    t1 = (t0 + 5928U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(62, ng0);
    t2 = (t0 + 6344);
    *((int *)t2) = 1;
    t3 = (t0 + 5960);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(62, ng0);

LAB5:    xsi_set_current_line(63, ng0);
    t5 = (t0 + 2008U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t4 + 4);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t6);
    t9 = (t8 >> 0);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 0);
    *((unsigned int *)t5) = t11;
    t12 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t12 & 7U);
    t13 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t13 & 7U);

LAB6:    t14 = ((char*)((ng2)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 3, t14, 3);
    if (t15 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng4)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 3, t2, 3);
    if (t15 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng5)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 3, t2, 3);
    if (t15 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng6)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 3, t2, 3);
    if (t15 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng1)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 3, t2, 3);
    if (t15 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng7)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 3, t2, 3);
    if (t15 == 1)
        goto LAB17;

LAB18:
LAB20:
LAB19:    xsi_set_current_line(95, ng0);

LAB28:    xsi_set_current_line(96, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 3208);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 32);
    xsi_set_current_line(97, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3368);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB21:    goto LAB2;

LAB7:    xsi_set_current_line(65, ng0);

LAB22:    xsi_set_current_line(66, ng0);
    t16 = (t0 + 2168U);
    t17 = *((char **)t16);
    t16 = (t0 + 3208);
    xsi_vlogvar_assign_value(t16, t17, 0, 0, 32);
    xsi_set_current_line(67, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3368);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    goto LAB21;

LAB9:    xsi_set_current_line(70, ng0);

LAB23:    xsi_set_current_line(71, ng0);
    t3 = (t0 + 2488U);
    t5 = *((char **)t3);
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t5, 0, 0, 32);
    xsi_set_current_line(72, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3368);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    goto LAB21;

LAB11:    xsi_set_current_line(75, ng0);

LAB24:    xsi_set_current_line(76, ng0);
    t3 = (t0 + 2328U);
    t5 = *((char **)t3);
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t5, 0, 0, 32);
    xsi_set_current_line(77, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3368);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    goto LAB21;

LAB13:    xsi_set_current_line(80, ng0);

LAB25:    xsi_set_current_line(81, ng0);
    t3 = (t0 + 3528);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t7 = (t0 + 3208);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 32);
    xsi_set_current_line(82, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3368);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    goto LAB21;

LAB15:    xsi_set_current_line(85, ng0);

LAB26:    xsi_set_current_line(86, ng0);
    t3 = (t0 + 2808U);
    t5 = *((char **)t3);
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t5, 0, 0, 32);
    xsi_set_current_line(87, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3368);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    goto LAB21;

LAB17:    xsi_set_current_line(90, ng0);

LAB27:    xsi_set_current_line(91, ng0);
    t3 = (t0 + 2488U);
    t5 = *((char **)t3);
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t5, 0, 0, 32);
    xsi_set_current_line(92, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 3368);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 32);
    goto LAB21;

}


extern void work_m_08943063958139749260_3960456194_init()
{
	static char *pe[] = {(void *)Cont_16_0,(void *)Cont_17_1,(void *)Cont_18_2,(void *)Cont_19_3,(void *)Always_29_4,(void *)Cont_53_5,(void *)Always_62_6};
	xsi_register_didat("work_m_08943063958139749260_3960456194", "isim/branch_control_isim_beh.exe.sim/work/m_08943063958139749260_3960456194.didat");
	xsi_register_executes(pe);
}
