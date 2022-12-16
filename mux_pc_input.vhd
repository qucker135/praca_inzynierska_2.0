----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2022 13:15:21
-- Design Name: 
-- Module Name: mux_pc_input - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_pc_input is
    Port ( value_from_stack : in STD_LOGIC_VECTOR (12 downto 0);
           ext_k_to_pc : in STD_LOGIC_VECTOR (12 downto 0);
           pc_inc : in STD_LOGIC_VECTOR (12 downto 0);
           ext_std_input : in STD_LOGIC_VECTOR (12 downto 0);
           str_inc : in STD_LOGIC;
           str_k_to_pc : in STD_LOGIC;
           str_stack : in STD_LOGIC;
           mux_out : out STD_LOGIC_VECTOR (12 downto 0));
end mux_pc_input;

architecture Behavioral of mux_pc_input is

begin

    process(
        value_from_stack, 
        ext_k_to_pc,
        pc_inc,
        ext_std_input,
        str_inc,
        str_k_to_pc,
        str_stack
    )
    begin
        if str_inc = '1' then
            mux_out <= pc_inc;
        elsif str_k_to_pc = '1' then
            mux_out <= ext_k_to_pc;
        elsif str_stack = '1' then
            mux_out <= value_from_stack;
        else
            mux_out <= ext_std_input;
        end if;
    end process;


end Behavioral;
