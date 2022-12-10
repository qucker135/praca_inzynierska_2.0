----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2022 18:23:35
-- Design Name: 
-- Module Name: arg2_8 - Behavioral
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

entity arg2_8 is
    Port ( arg2 : in STD_LOGIC_VECTOR (7 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0);
           flags : out STD_LOGIC_VECTOR (2 downto 0));
end arg2_8;

architecture Behavioral of arg2_8 is

signal pom_res_sig : STD_LOGIC_VECTOR(7 downto 0);

begin

    pom_res_sig <= arg2;
    
    res <= pom_res_sig;
    
    process(pom_res_sig)
    begin
        if pom_res_sig = X"00" then
            flags(2) <= '1';
        else
            flags(2) <= '0';
        end if;
    end process;
    
    flags(1 downto 0) <= "--";

end Behavioral;
