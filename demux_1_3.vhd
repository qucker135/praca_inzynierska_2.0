----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.12.2022 12:44:16
-- Design Name: 
-- Module Name: demux_1_3 - Behavioral
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

entity demux_1_3 is
    Port ( we_in : in STD_LOGIC;
           str : in STD_LOGIC_VECTOR (2 downto 0);
           we_out : out STD_LOGIC_VECTOR (7 downto 0));
end demux_1_3;

architecture Behavioral of demux_1_3 is

begin

    process(we_in, str)
    begin
        we_out <= (others => '0');
        case str is
            when "000" =>
                we_out(0) <= we_in;
            when "001" =>
                we_out(1) <= we_in;
            when "010" =>
                we_out(2) <= we_in;
            when "011" =>
                we_out(3) <= we_in;
            when "100" =>
                we_out(4) <= we_in;
            when "101" =>
                we_out(5) <= we_in;
            when "110" =>
                we_out(6) <= we_in;
            when "111" =>
                we_out(7) <= we_in;
            when others =>
                we_out <= (others => '0');
        end case;
    end process;

end Behavioral;
