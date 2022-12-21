----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.12.2022 15:18:00
-- Design Name: 
-- Module Name: slice_datamux_ir - Behavioral
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

entity slice_datamux_ir is
    Port ( ir_in : in STD_LOGIC_VECTOR (13 downto 0);
           ir_8_out : out STD_LOGIC_VECTOR (7 downto 0);
           ir_11_out : out STD_LOGIC_VECTOR (10 downto 0));
end slice_datamux_ir;

architecture Behavioral of slice_datamux_ir is

begin

    ir_8_out <= ir_in(7 downto 0);
    ir_11_out <= ir_in(10 downto 0);

end Behavioral;
