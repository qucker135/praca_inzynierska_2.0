----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2022 23:29:36
-- Design Name: 
-- Module Name: stack - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.mux_13_3_types.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity stack is
    Port ( clk : in STD_LOGIC;
           ena : in STD_LOGIC;
           push_pop : in STD_LOGIC;
           stack_in : in STD_LOGIC_VECTOR (12 downto 0);
           stack_out : out STD_LOGIC_VECTOR (12 downto 0));
end stack;

architecture Behavioral of stack is

component we_reg_13 is
    Port ( clk : in STD_LOGIC;
           we : in STD_LOGIC;
           din : in STD_LOGIC_VECTOR (12 downto 0);
           dout : out STD_LOGIC_VECTOR (12 downto 0));
end component;

component we_reg_3 is
    Port ( clk : in STD_LOGIC;
           we : in STD_LOGIC;
           din : in STD_LOGIC_VECTOR (2 downto 0);
           dout : out STD_LOGIC_VECTOR (2 downto 0));
end component;
    
component mux_3_1 is
    Port ( d0 : in STD_LOGIC_VECTOR(2 downto 0);
           d1 : in STD_LOGIC_VECTOR(2 downto 0);
           s : in STD_LOGIC;
           dout : out STD_LOGIC_VECTOR(2 downto 0));
end component;   

component inc_3 is
    Port ( num : in STD_LOGIC_VECTOR (2 downto 0);
           inc_num : out STD_LOGIC_VECTOR (2 downto 0));
end component; 

component dec_3 is
    Port ( num : in STD_LOGIC_VECTOR (2 downto 0);
           dec_num : out STD_LOGIC_VECTOR (2 downto 0));
end component; 

component demux_1_3 is
    Port ( we_in : in STD_LOGIC;
           str : in STD_LOGIC_VECTOR (2 downto 0);
           we_out : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component mux_13_3 is
    Port ( mux_in_vec : in mux_13_3_input_type;
           str : in STD_LOGIC_VECTOR (2 downto 0);
           mux_out : out STD_LOGIC_VECTOR (12 downto 0));
end component;

    signal pom_demux_in : STD_LOGIC;

    signal pom_demux_out_we_in : STD_LOGIC_VECTOR(7 downto 0);

    signal pom_reg_out_mux_in : mux_13_3_input_type;

    signal pom_ptr_out : STD_LOGIC_VECTOR(2 downto 0);

    signal pom_ptr_inc_out : STD_LOGIC_VECTOR(2 downto 0);

    signal pom_ptr_dec_out : STD_LOGIC_VECTOR(2 downto 0);

    signal pom_ptr_in : STD_LOGIC_VECTOR(2 downto 0);

begin

    pom_demux_in <= ena and push_pop;

    u_demux_1_3: demux_1_3
    port map(
        we_in => pom_demux_in,
        str => pom_ptr_out,
        we_out => pom_demux_out_we_in
    );
    

    u_we_reg_13_0: we_reg_13
    port map(
        clk => clk,
        we => pom_demux_out_we_in(0),
        din => stack_in,
        dout => pom_reg_out_mux_in(0)
    );

    u_we_reg_13_1: we_reg_13
    port map(
        clk => clk,
        we => pom_demux_out_we_in(1),
        din => stack_in,
        dout => pom_reg_out_mux_in(1)
    );

    u_we_reg_13_2: we_reg_13
    port map(
        clk => clk,
        we => pom_demux_out_we_in(2),
        din => stack_in,
        dout => pom_reg_out_mux_in(2)
    );

    u_we_reg_13_3: we_reg_13
    port map(
        clk => clk,
        we => pom_demux_out_we_in(3),
        din => stack_in,
        dout => pom_reg_out_mux_in(3)
    );

    u_we_reg_13_4: we_reg_13
    port map(
        clk => clk,
        we => pom_demux_out_we_in(4),
        din => stack_in,
        dout => pom_reg_out_mux_in(4)
    );

    u_we_reg_13_5: we_reg_13
    port map(
        clk => clk,
        we => pom_demux_out_we_in(5),
        din => stack_in,
        dout => pom_reg_out_mux_in(5)
    );

    u_we_reg_13_6: we_reg_13
    port map(
        clk => clk,
        we => pom_demux_out_we_in(6),
        din => stack_in,
        dout => pom_reg_out_mux_in(6)
    );

    u_we_reg_13_7: we_reg_13
    port map(
        clk => clk,
        we => pom_demux_out_we_in(7),
        din => stack_in,
        dout => pom_reg_out_mux_in(7)
    );

    u_mux_3_1: mux_3_1
    port map(
        d0 => pom_ptr_dec_out,
        d1 => pom_ptr_inc_out,
        s => push_pop,
        dout => pom_ptr_in
    );

    u_we_reg_3 : we_reg_3
    port map(
        clk => clk,
        we => ena,
        din => pom_ptr_in,
        dout => pom_ptr_out
    );

    u_inc_3 : inc_3
    port map(
        num => pom_ptr_out,
        inc_num => pom_ptr_inc_out
    );

    u_dec_3 : dec_3
    port map(
        num => pom_ptr_out,
        dec_num => pom_ptr_dec_out
    );

    u_mux_13_3 : mux_13_3
    port map(
        mux_in_vec => pom_reg_out_mux_in,
        str => pom_ptr_dec_out,
        mux_out => stack_out
    );

end Behavioral;
