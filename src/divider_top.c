#include <genlib.h>  
int operand_size = 8;
int result_size = 16;

main()  
{  
int i;  
  
   GENLIB_DEF_LOFIG("divider_top");  
  
   GENLIB_LOCON("vdd",           IN,           "vdd");    
   GENLIB_LOCON("vss",           IN,           "vss");    
   GENLIB_LOCON("vdde",          IN,          "vdde");   
   GENLIB_LOCON("vsse",          IN,          "vsse");   
   GENLIB_LOCON("op_a[3:0]",     IN,     "op_a[7:0]");    
   GENLIB_LOCON("op_b[3:0]",     IN,     "op_b[7:0]");    
   GENLIB_LOCON("reset",         IN,         "reset");    
   GENLIB_LOCON("start",         IN,         "start");    
   GENLIB_LOCON("clk",           IN,           "clk");    
   GENLIB_LOCON("ready",         OUT,        "ready");    
   GENLIB_LOCON("result[15:0]",   OUT,  "result[15:0]");    
     
                              
   GENLIB_LOINS ("pvsse_sp", "p20", "cki", "vdde", "vdd", "vsse", "vss", 0);  
   GENLIB_LOINS ("pvdde_sp", "p21", "cki", "vdde", "vdd", "vsse", "vss", 0);  
   GENLIB_LOINS ("pvddeck_sp","p22", "clock", "cki", "vdde", "vdd", "vsse", "vss",0); 
   GENLIB_LOINS ("pvssi_sp", "p23", "cki", "vdde", "vdd", "vsse", "vss", 0);  
   GENLIB_LOINS ("pvddi_sp", "p24", "cki", "vdde", "vdd", "vsse", "vss", 0);  
	
 
  

   for (i = 0; i < operand_size; i++)  
    GENLIB_LOINS("pi_sp", 
	GENLIB_NAME("p%d", i),   
 	GENLIB_NAME("op_a[%d]", i), 
	GENLIB_NAME("op_aop_a[%d]", i),   
        	 "cki", "vdde", "vdd", "vsse", "vss", 0); 

   for (i = 0; i < operand_size; i++)  
    GENLIB_LOINS("pi_sp", 
	GENLIB_NAME("p%d", i + operand_size),   
        GENLIB_NAME("op_b[%d]", i), 
	GENLIB_NAME("op_bop_b[%d]", i),   
         	  "cki", "vdde", "vdd", "vsse", "vss", 0);  
   
   for (i = 0; i < result_size; i++)  
    GENLIB_LOINS("po_sp", 
	  GENLIB_NAME("p%d", i + result_size),   
          GENLIB_NAME("resultresult[%d]", i), 
	  GENLIB_NAME("result[%d]", i),  
          "cki", "vdde", "vdd", "vsse", "vss", 0);  
  
  
  
  
   GENLIB_LOINS("pi_sp", "p16",  
         "start", "startstart",  
         "cki", "vdde", "vdd", "vsse", "vss", 0);  
     
   GENLIB_LOINS("pi_sp", "p17",  
         "reset", "resetreset",  
         "cki", "vdde", "vdd", "vsse", "vss", 0);  
     
   GENLIB_LOINS("pck_sp", "p18",  
         "clk",  
         "cki", "vdde", "vdd", "vsse", "vss", 0);  
     
   GENLIB_LOINS("po_sp", "p19",  
         "readyready", "ready",  
         "cki", "vdde", "vdd", "vsse", "vss", 0);  
     
   GENLIB_LOINS("divider", "divider",
		"op_aop_a[7:0]", "op_bop_b[7:0]", 
		"resultresult[15:0]", 
   	     	"clock", "resetreset",  	      
         	"startstart",  	     
         	"readyready", 
        	"vdd", "vss", 0);  
  
   GENLIB_SAVE_LOFIG();  
   exit(0);   
}  
