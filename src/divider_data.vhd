LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

entity divider_data is
    port ( 
      operand_1   : in std_logic_vector(7 downto 0); 
      operand_2   : in std_logic_vector(7 downto 0);
      result      : out std_logic_vector(15 downto 0);
      clk         : in std_logic;
      reset_n     : in std_logic;
      load_op     : in std_logic;
      end_op      : in std_logic;
      shift_a     : in std_logic;
      shift_p     : in std_logic;
      subtract    : in std_logic;
      add         : in std_logic;
      neg_p       : out std_logic
      );
end divider_data;

architecture divider_data_arch of divider_data is
    signal a : std_logic_vector (7 downto 0);
    signal b : std_logic_vector (7 downto 0);
    signal p : std_logic_vector (8 downto 0);
    signal r : std_logic_vector (15 downto 0);
    
    begin
      update_a_register : process (clk) begin
        if(( not clk'stable ) and ( clk = '1' )) then
            if (reset_n = '0') then 
                a <= (others => '0');
            elsif (load_op = '1') then 
                a <= operand_1;
            elsif (shift_a = '1') then 
                a <= a(6 downto 0) & (not p(8));
            end if;
        end if;
    end process update_a_register;
        
    update_b_register : process (clk) begin
      if(( not clk'STABLE ) and ( clk = '1' )) then
        if (reset_n = '0') then
          b <= (others => '0');
          elsif (load_op = '1') 
            then b <= operand_2;
        end if;
      end if;
    end process update_b_register;
        
    update_p_register : process (clk) begin
      if(( not clk'STABLE ) and ( clk = '1' )) then
          if (reset_n = '0') then 
              p <= (others => '0');
          elsif (load_op = '1') then 
              p <= (others => '0');
          elsif (shift_p = '1') then 
              p <= p(7 downto 0) & a(7);
          elsif (subtract = '1') then 
              p <= p - b;
          elsif (add = '1') then 
              p <= p + b;
          end if;
      end if;
  end process update_p_register;
  
        
    update_r_register : process (clk) begin
      if(( not clk'STABLE ) and ( clk = '1' )) then
        if (reset_n = '0') then 
          r <= (others => '0');
        elsif (load_op = '1') then
          r <= (others => '0');
        elsif (end_op = '1') then 
          r(7 downto 0)<= p(7 downto 0);
          r(15 downto 8)<= a;
        end if;
      end if;
    
	end process update_r_register;
        
    neg_p <= p(8);
    result <= r;
        
     
end divider_data_arch;
