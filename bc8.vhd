----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2022 18:41:23
-- Design Name: 
-- Module Name: bc8 - Behavioral
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

entity bc8 is
    Port ( arg2 : in STD_LOGIC_VECTOR (7 downto 0);
           bbb : in STD_LOGIC_VECTOR (2 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0);
           flags : out STD_LOGIC_VECTOR (2 downto 0));
end bc8;

architecture Behavioral of bc8 is

begin

    process(arg2, bbb)
    begin
        case bbb is
            when "000" =>
                res <= arg2(7 downto 1) & '0';
            when "001" => 
                res <= arg2(7 downto 2) & '0' & arg2(0);
            when "010" =>
                res <= arg2(7 downto 3) & '0' & arg2(1 downto 0);
            when "011" =>
                res <= arg2(7 downto 4) & '0' & arg2(2 downto 0);
            when "100" =>
                res <= arg2(7 downto 5) & '0' & arg2(3 downto 0);
            when "101" =>
                res <= arg2(7 downto 6) & '0' & arg2(4 downto 0);
            when "110" =>
                res <= arg2(7) & '0' & arg2(5 downto 0);
            when "111" =>
                res <= '0' & arg2(6 downto 0);
            when others =>
                res <= arg2(7 downto 0);
        end case;
    end process;
    
    flags <= "---";

end Behavioral;
