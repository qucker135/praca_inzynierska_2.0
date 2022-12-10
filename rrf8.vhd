----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2022 12:46:58
-- Design Name: 
-- Module Name: rrf8 - Behavioral
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

entity rrf8 is
    Port ( arg2 : in STD_LOGIC_VECTOR (7 downto 0);
           curC : in STD_LOGIC;
           res : out STD_LOGIC_VECTOR (7 downto 0);
           flags : out STD_LOGIC_VECTOR (2 downto 0));
end rrf8;

architecture Behavioral of rrf8 is

begin
    
    res <= curC & arg2(7 downto 1);
    
    flags(0) <= arg2(0); -- C
    
    flags(2 downto 1) <= "--"; -- Z DC

end Behavioral;
