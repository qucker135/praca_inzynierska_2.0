----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2022 12:21:18
-- Design Name: 
-- Module Name: pc_inc - Behavioral
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

entity pc_inc is
    Port ( pc_in : in STD_LOGIC_VECTOR (12 downto 0);
           pc_inc_out : out STD_LOGIC_VECTOR (12 downto 0));
end pc_inc;

architecture Behavioral of pc_inc is

begin

    pc_inc_out <= std_logic_vector(unsigned(pc_in) + 1);

end Behavioral;
