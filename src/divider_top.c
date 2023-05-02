#include <genlib.h>  
  
main()  
{  
int i;  
  
   GENLIB_DEF_LOFIG("divider_top");  
  
   GENLIB_LOCON("vdd",           IN,           "vdd");    
   GENLIB_LOCON("vss",           IN,           "vss");    
   GENLIB_LOCON("vdde",          IN,          "vdde");   
   GENLIB_LOCON("vsse",          IN,          "vsse");   
   GENLIB_LOCON("operand_1[7:0]",     IN,     "operand_1[7:0]");    
   GENLIB_LOCON("operand_2[7:0]",     IN,     "operand_2[7:0]");    
   GENLIB_LOCON("reset",         IN,         "reset");    
   GENLIB_LOCON("start",         IN,         "start");    
   GENLIB_LOCON("clk",           IN,           "clk");    
   GENLIB_LOCON("ready",         OUT,        "ready");    
   GENLIB_LOCON("result[15:0]",   OUT,  "result[15:0]");    
     
                              
   GENLIB_LOINS ("pvsse_sp", "p36", "cki", "vdde", "vdd", "vsse", "vss", 0);  
   GENLIB_LOINS ("pvdde_sp", "p37", "cki", "vdde", "vdd", "vsse", "vss", 0);  
   GENLIB_LOINS ("pvddeck_sp","p38", "clock", "cki", "vdde", "vdd", "vsse", "vss",0); 
   GENLIB_LOINS ("pvssi_sp", "p39", "cki", "vdde", "vdd", "vsse", "vss", 0);  
   GENLIB_LOINS ("pvddi_sp", "p40", "cki", "vdde", "vdd", "vsse", "vss", 0);  
	
 
  

   for (i = 0; i < 8; i++)  
    GENLIB_LOINS("pi_sp", 
	GENLIB_NAME("p%d", i),   
 	GENLIB_NAME("operand_1[%d]", i), 
	GENLIB_NAME("operand_1operand_1[%d]", i),   
        	 "cki", "vdde", "vdd", "vsse", "vss", 0); 

   for (i = 0; i < 8; i++)  
    GENLIB_LOINS("pi_sp", 
	GENLIB_NAME("p%d", i + 8),   
        GENLIB_NAME("operand_2[%d]", i), 
	GENLIB_NAME("operand_2operand_2[%d]", i),   
         	  "cki", "vdde", "vdd", "vsse", "vss", 0);  
   
   for (i = 0; i < 16; i++)  
    GENLIB_LOINS("po_sp", 
	  GENLIB_NAME("p%d", i + 2*8),   
          GENLIB_NAME("resultresult[%d]", i), 
	  GENLIB_NAME("result[%d]", i),  
          "cki", "vdde", "vdd", "vsse", "vss", 0);  
  
  
  
  
   GENLIB_LOINS("pi_sp", "p35",  
         "start", "startstart",  
         "cki", "vdde", "vdd", "vsse", "vss", 0);  
     
   GENLIB_LOINS("pi_sp", "p32",  
         "reset", "resetreset",  
         "cki", "vdde", "vdd", "vsse", "vss", 0);  
     
   GENLIB_LOINS("pck_sp", "p33",  
         "clk",  
         "cki", "vdde", "vdd", "vsse", "vss", 0);  
     
   GENLIB_LOINS("po_sp", "p34",  
         "readyready", "ready",  
         "cki", "vdde", "vdd", "vsse", "vss", 0);  
     
   GENLIB_LOINS("divider", "divider",
		"operand_1operand_1[7:0]", "operand_2operand_2[7:0]", 
		"resultresult[15:0]", 
   	     	"clock", "resetreset",  	      
         	"startstart",  	     
         	"readyready", 
        	"vdd", "vss", 0);  
  
   GENLIB_SAVE_LOFIG();  
   exit(0);   
}  
