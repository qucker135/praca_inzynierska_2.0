----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2022 19:25:15
-- Design Name: 
-- Module Name: btc - Behavioral
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

entity btc is
    Port ( arg2 : in STD_LOGIC_VECTOR (7 downto 0);
           bbb : in STD_LOGIC_VECTOR (2 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0);
           flags : out STD_LOGIC_VECTOR (2 downto 0));
end btc;

architecture Behavioral of btc is

begin

    process(arg2, bbb)
    begin
        case bbb is
            when "000" =>
                flags(2) <= not arg2(0);
            when "001" => 
                flags(2) <= not arg2(1);
            when "010" =>
                flags(2) <= not arg2(2);
            when "011" =>
                flags(2) <= not arg2(3);
            when "100" =>
                flags(2) <= not arg2(4);
            when "101" =>
                flags(2) <= not arg2(5);
            when "110" =>
                flags(2) <= not arg2(6);
            when "111" =>
                flags(2) <= not arg2(7);
            when others =>
                flags(2) <= '-';
        end case;
    end process;
    
    flags(1 downto 0) <= "--";

    res <= (others => '-');

end Behavioral;
