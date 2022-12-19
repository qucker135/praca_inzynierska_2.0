----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.12.2022 12:33:39
-- Design Name: 
-- Module Name: dec_3 - Behavioral
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

entity dec_3 is
    Port ( num : in STD_LOGIC_VECTOR (2 downto 0);
           dec_num : out STD_LOGIC_VECTOR (2 downto 0));
end dec_3;

architecture Behavioral of dec_3 is

begin

    dec_num <= std_logic_vector(unsigned(num) - 1);

end Behavioral;
