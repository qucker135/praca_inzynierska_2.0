----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.12.2022 13:14:58
-- Design Name: 
-- Module Name: demux_we_register_file - Behavioral
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

entity demux_we_register_file is
    Port ( we_in : in STD_LOGIC;
           addr_in : in STD_LOGIC_VECTOR (1 downto 0);
           we_out_vec : out STD_LOGIC_VECTOR(3 downto 0));
end demux_we_register_file;

architecture Behavioral of demux_we_register_file is

begin
    
    process(we_in, addr_in)
    begin
        we_out_vec <= (others => '0');
        case addr_in is
            when "00" =>
                we_out_vec(0) <= we_in;
            when "01" =>
                we_out_vec(1) <= we_in;
            when "10" =>
                we_out_vec(2) <= we_in;
            when "11" =>
                we_out_vec(3) <= we_in;
        end case;
    end process;
    
end Behavioral;
