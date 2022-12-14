----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.12.2022 13:14:58
-- Design Name: 
-- Module Name: mux_we_register_file - Behavioral
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

entity mux_out_register_file is 
    Port ( reg_out : in mux_input_type;
           addr_in : in STD_LOGIC_VECTOR(1 downto 0);
           mux_out : out STD_LOGIC_VECTOR(7 downto 0));
end mux_out_register_file;

architecture Behavioral of mux_out_register_file is

begin
    
    process(
        reg_out,
        addr_in
    )
    begin
        case addr_in is
            when "00" =>
                mux_out <= reg_out(0);
            when "01" =>
                mux_out <= reg_out(1);
            when "10" =>
                mux_out <= reg_out(2);
            when "11" =>
                mux_out <= reg_out(3);
        end case;
    end process;
    
end Behavioral;
