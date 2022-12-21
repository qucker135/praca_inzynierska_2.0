----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.12.2022 14:53:35
-- Design Name: 
-- Module Name: slice_alu - Behavioral
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

entity slice_alu is
    Port ( status_in : in STD_LOGIC_VECTOR (7 downto 0);
           ir_in : in STD_LOGIC_VECTOR (13 downto 0);
           bbb_out : out STD_LOGIC_VECTOR (2 downto 0);
           curC_out : out STD_LOGIC);
end slice_alu;

architecture Behavioral of slice_alu is

begin

    bbb_out <= ir_in(9 downto 7);
    curC_out <= status_in(0);

end Behavioral;
