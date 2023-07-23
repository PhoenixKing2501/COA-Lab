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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000003508409356_1351276808_init();
    work_m_00000000003328886626_4217414517_init();
    work_m_00000000000712546613_3866583278_init();
    work_m_00000000003261970420_4089252921_init();
    xilinxcorelib_ver_m_00000000001358910285_0097192460_init();
    xilinxcorelib_ver_m_00000000001687936702_2843080771_init();
    xilinxcorelib_ver_m_00000000000277421008_0980162720_init();
    xilinxcorelib_ver_m_00000000003435484244_4037756126_init();
    work_m_00000000002489990758_0610666722_init();
    work_m_00000000001147589140_3381898454_init();
    work_m_00000000001202028243_2844711910_init();
    work_m_00000000001202028243_3141235720_init();
    work_m_00000000001599599724_3207788825_init();
    work_m_00000000002221903874_0532655844_init();
    work_m_00000000001460937077_3927796435_init();
    work_m_00000000003229334269_1865485290_init();
    work_m_00000000003958043115_2132086643_init();
    work_m_00000000001272943180_2327300932_init();
    work_m_00000000000426034159_3948285920_init();
    work_m_00000000001259999409_3149890987_init();
    work_m_00000000001053887488_2725559894_init();
    xilinxcorelib_ver_m_00000000001358910285_4190433792_init();
    xilinxcorelib_ver_m_00000000001358910285_3392866099_init();
    xilinxcorelib_ver_m_00000000001687936702_2665453648_init();
    xilinxcorelib_ver_m_00000000000277421008_2641575621_init();
    xilinxcorelib_ver_m_00000000001603977570_3407892710_init();
    work_m_00000000003869038185_3258266500_init();
    work_m_00000000002821237286_3960456194_init();
    work_m_00000000002476641764_4205961752_init();
    work_m_00000000000535445628_1265429713_init();
    work_m_00000000002345402070_3558071519_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000002345402070_3558071519");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}