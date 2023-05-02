LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

entity divider_control is
    port ( clk        : in std_logic ;
           reset_n    : in std_logic ;
           start      : in std_logic ;
           neg_p      : in std_logic ;
           ready      : out std_logic;
           end_op     : out std_logic;
           load_op    : out std_logic;
           shift_a : out std_logic;
           shift_p : out std_logic;
           subtract  : out std_logic;
           add  : out std_logic
           );
end divider_control;

architecture divider_control_arch of divider_control is
    
    type state is (INIT, SETUP, SHIFT_P_STATE, SHIFT_A_STATE, SUBTRACT_STATE, ADD_STATE, END_OP_STATE);
    signal current_state  : state    ;
    signal next_state: state    ;
    signal valid    : std_logic;
    signal count    : integer;
    
    begin
    state_transision : process (reset_n, current_state, start, neg_p, count) begin 
        case current_state is
            when INIT =>
                if (reset_n = '0') then 
		            next_state <= INIT;
                elsif (start = '1') then
		            next_state <= SETUP;
                else
                    next_state <= INIT;
                end if;
              
             when SETUP =>
                if (reset_n = '0') then 
			        next_state <= INIT;
                else 
		            next_state <= SHIFT_P_STATE;
                end if;
               
            when SHIFT_P_STATE =>
                if (reset_n = '0') then
      	               next_state <= INIT;
                elsif (count = 0) then 
		            next_state <= END_OP_STATE;
                else
                    next_state <= SUBTRACT_STATE;
                end if;
              
            when SUBTRACT_STATE =>
                if (reset_n = '0') then
                    next_state <= INIT;
                else
                    next_state <= SHIFT_A_STATE;
                end if;
                  
            when SHIFT_A_STATE =>
               if (reset_n = '0') then
                    next_state <= INIT;
               elsif (neg_p = '1') then
                    next_state <= ADD_STATE;
               elsif (count = 0) then 
		            next_state <= END_OP_STATE; 
               else
     		         next_state <= SHIFT_P_STATE;
               end if;
				 
            when ADD_STATE =>
                if (reset_n = '0') then
   		            next_state <= INIT;
                elsif (count = 0) then 
		            next_state <= END_OP_STATE;
                else 
		            next_state <= SHIFT_P_STATE;
                end if;
               
            when END_OP_STATE =>
                if (reset_n = '0') then 
		            next_state <= INIT;
                else
  		            next_state <= INIT; 
                end if;                                
        end case; 
    end process state_transision;
    
	signal_assignment : process (current_state) begin
		if (current_state = SETUP) then 
			load_op <= '1';
		else 
			load_op <= '0';
		end if;
		
		if (current_state = SHIFT_P_STATE)  then
			shift_p <= '1';
		else 
			shift_p <= '0';
		end if;
		
		if (current_state = SUBTRACT_STATE) then 
			subtract <= '1';
		else
			subtract <= '0';
		end if;
		
		if (current_state = SHIFT_A_STATE) then
			shift_a <= '1';
		else 
			shift_a <= '0';
		end if;
		
		if (current_state = ADD_STATE) then 
			add <= '1';
		else 
			add <= '0';
		end if;
		
		if (current_state = END_OP_STATE) then 
			end_op <= '1';
		else 
			end_op <= '0';
		end if;   
		
	end process signal_assignment;

    update_state : process (clk) begin
        if ((not clk'stable) and (clk = '1')) then
            current_state <= next_state;
        end if; 
    end process update_state;
       
    counter : process (clk) begin
        if(( not clk'STABLE ) and ( clk = '1' )) then
            if (reset_n = '0') then count <= 0;
                elsif (current_state = INIT) then 
                    count <= 8;
                elsif (current_state = SHIFT_P_STATE) then 
                    count <= count - 1;
            end if;
        end if;
    end process counter;
       
    validity_checker : process (clk) begin
        if ((not clk'STABLE ) and (clk = '1')) then
            if (reset_n = '0') then 
                valid <= '0';
            elsif (current_state = END_OP_STATE) then 
                valid <= '1';
            elsif (current_state = INIT) then 
                valid <='0';
            end if;
        end if;
    end process validity_checker;
        
    ready <= valid;    

end divider_control_arch;
