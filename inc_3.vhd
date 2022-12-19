----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.12.2022 12:23:34
-- Design Name: 
-- Module Name: inc_3 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity inc_3 is
    Port ( num : in STD_LOGIC_VECTOR (2 downto 0);
           inc_num : out STD_LOGIC_VECTOR (2 downto 0));
end inc_3;

architecture Behavioral of inc_3 is

begin

    inc_num <= std_logic_vector(unsigned(num) + 1);

end Behavioral;
