LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity divider is
    generic (
        OPERAND_SIZE : positive :=8;
        RESULT_SIZE: positive := 16
    );
    port ( 
        operand_1   : in std_logic_vector (OPERAND_SIZE-1 downto 0); 
        operand_2   : in std_logic_vector (OPERAND_SIZE-1 downto 0);
        result      : out std_logic_vector(RESULT_SIZE-1 downto 0);
        clk         : in std_logic;
        reset_n     : in std_logic;
        start       : in std_logic;
        ready       : out std_logic
    );
end divider;

architecture divider_arch of divider is
    signal load_op    : std_logic;
    signal shift_a : std_logic;
    signal shift_p : std_logic;
    signal subtract  : std_logic;
    signal add  : std_logic;
    signal end_op     : std_logic;
    signal neg_p      : std_logic;
    
component divider_control
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
end component;

component divider_data
    generic (
      OPERAND_SIZE : positive := 8;
      RESULT_SIZE: positive := 16
    );
    port ( operand_1 : in std_logic_vector (OPERAND_SIZE-1 downto 0);
           operand_2 : in std_logic_vector (OPERAND_SIZE-1 downto 0);
           result  : out std_logic_vector(RESULT_SIZE-1 downto 0);
           clk       : in std_logic                    ;
           reset_n   : in std_logic                    ;
           load_op   : in std_logic                    ;
           end_op    : in std_logic                    ;
           shift_a: in std_logic                    ;
           shift_p: in std_logic                    ;
           subtract : in std_logic                    ;
           add : in std_logic                    ;
           neg_p     : out std_logic 
          );
end component;

begin
    DATA : divider_data
        generic map (OPERAND_SIZE => OPERAND_SIZE, RESULT_SIZE => RESULT_SIZE)
        port map
        ( operand_1  => operand_1 ,
          operand_2  => operand_2 ,
          result   => result  ,
          clk        =>  clk      ,
          reset_n    => reset_n   ,
          neg_p      => neg_p     ,
          end_op     => end_op    ,
          load_op    => load_op   ,
          shift_a => shift_a,
          shift_p => shift_p,
          subtract  => subtract ,
          add  => add
        );
    
    CONTROL : divider_control port map
    ( clk        => clk       ,
      reset_n    => reset_n   ,
      start      => start     ,
      neg_p      => neg_p     ,
      ready      => ready     ,
      end_op     => end_op    ,
      load_op    => load_op   ,
      shift_a => shift_a,
      shift_p => shift_p,
      subtract  => subtract ,
      add  => add 
    );
      
end divider_arch;