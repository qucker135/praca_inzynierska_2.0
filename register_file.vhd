----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.12.2022 14:01:28
-- Design Name: 
-- Module Name: register_file - Behavioral
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

use work.mux_out_register_file_types.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity register_file is
    Port ( clk : in STD_LOGIC;
           we : in STD_LOGIC;
           addr_in : in STD_LOGIC_VECTOR (1 downto 0);
           data_in : in STD_LOGIC_VECTOR (7 downto 0);
           data_out : out STD_LOGIC_VECTOR (7 downto 0));
end register_file;

architecture Behavioral of register_file is

component demux_we_register_file is
    Port ( we_in : in STD_LOGIC;
           addr_in : in STD_LOGIC_VECTOR (1 downto 0);
           we_out_vec : out STD_LOGIC_VECTOR(3 downto 0));
end component;

component mux_out_register_file is 
    Port ( reg_out : in mux_input_type;
           addr_in : in STD_LOGIC_VECTOR(1 downto 0);
           mux_out : out STD_LOGIC_VECTOR(7 downto 0));
end component;

component we_reg_8 is
    Port ( clk : in STD_LOGIC;
           we : in STD_LOGIC;
           din : in STD_LOGIC_VECTOR (7 downto 0);
           dout : out STD_LOGIC_VECTOR (7 downto 0));
end component;

    signal pom_we_out_vec : STD_LOGIC_VECTOR(3 downto 0);
    
    signal pom_data_out : mux_input_type;

begin

    u_demux_we_register_file: demux_we_register_file
    port map(
        we_in => we,
        addr_in => addr_in,
        we_out_vec => pom_we_out_vec
    );
    
    u_we_reg_8_0: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(0),
        din => data_in,
        dout => pom_data_out(0)
    );
    
    u_we_reg_8_1: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(1),
        din => data_in,
        dout => pom_data_out(1)
    );
    
    u_we_reg_8_2: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(2),
        din => data_in,
        dout => pom_data_out(2)
    );
    
    u_we_reg_8_3: we_reg_8
    port map(
        clk => clk,
        we => pom_we_out_vec(3),
        din => data_in,
        dout => pom_data_out(3)
    );
    
    u_mux_out_register_file: mux_out_register_file
    port map(
        reg_out => pom_data_out,
        addr_in => addr_in,
        mux_out => data_out
    );

end Behavioral;
