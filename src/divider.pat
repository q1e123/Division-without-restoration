        in       operand_1(7 DOWNTO 0);;;  
        in       operand_2(7 DOWNTO 0);;;  
        in      clk;;;  
        in   reset_n;;;  
        in   start;;;  
        in     vdd;  
        in     vss;;;     
        out   ready;;; 
        out   result(15 DOWNTO 0);;;  
        
         
        
       BEGIN 
       -- Pattern description :  	
       --         a    b    c   r   s   vv     r       r	         
       --                   k   e   t   ds     e       e	  
       --                       s   a   ds     a       s	  
       --                       e   r          d       u	  
       --                       t   t          y       l
  					       	       t
  					       
     
       pat_0   : 00001110 00000011  1   1   0   10     ?*    ?**************** ;  
       pat_1   : 00001110 00000011  0   1   0   10     ?*    ?**************** ; 
       pat_2   : 00001110 00000011  1   1   0   10     ?*    ?**************** ; 
       pat_3   : 00001110 00000011  0   1   0   10     ?*    ?**************** ; 
       pat_4   : 00001110 00000011  1   0   1   10     ?*    ?**************** ; 
       pat_5   : 00001110 00000011  0   0   1   10     ?*    ?**************** ; 
       pat_6   : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_7   : 00001110 00000011  0   0   0   10     ?*    ?**************** ; 
       pat_8   : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_9   : 00001110 00000011  0   0   0   10     ?*    ?**************** ; 
       pat_10  : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_11  : 00001110 00000011  0   0   0   10     ?*    ?**************** ; 
       pat_13  : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_14  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_15  : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_16  : 00001110 00000011  0   0   0   10     ?*    ?**************** ; 
       pat_17  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_18  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_19  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_20  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_21  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_22  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_23  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_24  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_25  : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_26  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_27  : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_28  : 00001110 00000011  0   0   0   10     ?*    ?**************** ; 
       pat_29  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_30  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_31  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_32  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_33  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_34  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_35  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_36  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;
       pat_6   : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_7   : 00001110 00000011  0   0   0   10     ?*    ?**************** ; 
       pat_8   : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_9   : 00001110 00000011  0   0   0   10     ?*    ?**************** ; 
       pat_10  : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_11  : 00001110 00000011  0   0   0   10     ?*    ?**************** ; 
       pat_13  : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_14  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_15  : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_16  : 00001110 00000011  0   0   0   10     ?*    ?**************** ; 
       pat_17  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_18  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_19  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_20  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_21  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_22  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_23  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_24  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_25  : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_26  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_27  : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_28  : 00001110 00000011  0   0   0   10     ?*    ?**************** ; 
       pat_29  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_30  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_31  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_32  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_33  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_34  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_35  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_36  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;
       pat_6   : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_7   : 00001110 00000011  0   0   0   10     ?*    ?**************** ; 
       pat_8   : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_9   : 00001110 00000011  0   0   0   10     ?*    ?**************** ; 
       pat_10  : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_11  : 00001110 00000011  0   0   0   10     ?*    ?**************** ; 
       pat_13  : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_14  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_15  : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_16  : 00001110 00000011  0   0   0   10     ?*    ?**************** ; 
       pat_17  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_18  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_19  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_20  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_21  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_22  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_23  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_24  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_25  : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_26  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_27  : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_28  : 00001110 00000011  0   0   0   10     ?*    ?**************** ; 
       pat_29  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_30  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_31  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_32  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_33  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_34  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_35  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_36  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;
       pat_6   : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_7   : 00001110 00000011  0   0   0   10     ?*    ?**************** ; 
       pat_8   : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_9   : 00001110 00000011  0   0   0   10     ?*    ?**************** ; 
       pat_10  : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_11  : 00001110 00000011  0   0   0   10     ?*    ?**************** ; 
       pat_13  : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_14  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_15  : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_16  : 00001110 00000011  0   0   0   10     ?*    ?**************** ; 
       pat_17  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_18  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_19  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_20  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_21  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_22  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_23  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_24  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_25  : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_26  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_27  : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_28  : 00001110 00000011  0   0   0   10     ?*    ?**************** ; 
       pat_29  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_30  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_31  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_32  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_33  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_34  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_35  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_36  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;
       pat_6   : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_7   : 00001110 00000011  0   0   0   10     ?*    ?**************** ; 
       pat_8   : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_9   : 00001110 00000011  0   0   0   10     ?*    ?**************** ; 
       pat_10  : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_11  : 00001110 00000011  0   0   0   10     ?*    ?**************** ; 
       pat_13  : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_14  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_15  : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_16  : 00001110 00000011  0   0   0   10     ?*    ?**************** ; 
       pat_17  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_18  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_19  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_20  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_21  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_22  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_23  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_24  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_25  : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_26  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_27  : 00001110 00000011  1   0   0   10     ?*    ?**************** ; 
       pat_28  : 00001110 00000011  0   0   0   10     ?*    ?**************** ; 
       pat_29  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_30  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_31  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_32  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_33  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_34  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;    
       pat_35  : 00001110 00000011  1   0   0   10     ?*    ?**************** ;    
       pat_36  : 00001110 00000011  0   0   0   10     ?*    ?**************** ;
       end;  