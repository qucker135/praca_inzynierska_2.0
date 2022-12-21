----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.12.2022 14:24:23
-- Design Name: 
-- Module Name: slice_pc - Behavioral
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

entity slice_pc is
    Port ( pc_in : in STD_LOGIC_VECTOR (12 downto 0);
           pc_out : out STD_LOGIC_VECTOR (10 downto 0));
end slice_pc;

architecture Behavioral of slice_pc is

begin

    pc_out <= pc_in(10 downto 0);

end Behavioral;
