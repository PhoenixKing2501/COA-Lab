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
static const char *ng0 = "/home/aerondight/COA Final Assignment/KGPminiRISC/sign_extend_15_32.v";
static int ng1[] = {17, 0};



static void Cont_6_0(char *t0)
{
    char t3[8];
    char t5[8];
    char t8[8];
    char *t1;
    char *t2;
    char *t4;
    char *t6;
    char *t7;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;

LAB0:    t1 = (t0 + 2360U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(6, ng0);
    t2 = (t0 + 1048U);
    t4 = *((char **)t2);
    t2 = ((char*)((ng1)));
    t6 = (t0 + 1048U);
    t7 = *((char **)t6);
    memset(t8, 0, 8);
    t6 = (t8 + 4);
    t9 = (t7 + 4);
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 14);
    t12 = (t11 & 1);
    *((unsigned int *)t8) = t12;
    t13 = *((unsigned int *)t9);
    t14 = (t13 >> 14);
    t15 = (t14 & 1);
    *((unsigned int *)t6) = t15;
    xsi_vlog_mul_concat(t5, 17, 1, t2, 1U, t8, 1);
    xsi_vlogtype_concat(t3, 32, 32, 2U, t5, 17, t4, 15);
    t16 = (t0 + 2760);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t3, 8);
    xsi_driver_vfirst_trans(t16, 0, 31);
    t21 = (t0 + 2680);
    *((int *)t21) = 1;

LAB1:    return;
}


extern void work_m_11170964334688173779_2844711910_init()
{
	static char *pe[] = {(void *)Cont_6_0};
	xsi_register_didat("work_m_11170964334688173779_2844711910", "isim/full_tb_1_isim_beh.exe.sim/work/m_11170964334688173779_2844711910.didat");
	xsi_register_executes(pe);
}
