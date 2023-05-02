LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity divider_test is
end divider_test;

architecture divider_test_arch of divider_test is
    component divider is
        port ( 
            operand_1   : in std_logic_vector (7 downto 0); 
            operand_2   : in std_logic_vector (7 downto 0);
            result      : out std_logic_vector(15 downto 0);
            clk       : in std_logic;
            reset_n   : in std_logic;
            start     : in std_logic;
            ready     : out std_logic
        );
    end component;
    
    signal ck        : std_logic := '0'            ;
    signal operand_1 : std_logic_vector(7 downto 0);
    signal operand_2 : std_logic_vector(7 downto 0);
    signal result  : std_logic_vector(15 downto 0);
    signal clk       : std_logic                   ;
    signal reset_n   : std_logic                   ;
    signal start     : std_logic                   ;
    signal ready     : std_logic                   ;
    
    begin
        DIV : divider port map 
         ( 
		   operand_1     =>    operand_1,
           operand_2     =>    operand_2,
           result      =>    result ,
           start         =>    start    ,
           ready         =>    ready    ,
           reset_n       =>    reset_n  ,
           clk           =>    clk 
		 );
           
        ck  <= not ck after 5 ps;
        clk <= ck;
        
        operand_1 <= "00001001";
        operand_2 <= "00000010";
       
        start   <= '0', '1' after 25 ps, '0' after 50 ps;
        reset_n <= '0', '1' after 5 ps;
end divider_test_arch;
