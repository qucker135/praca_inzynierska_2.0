----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.12.2022 14:24:15
-- Design Name: 
-- Module Name: mux_3_1 - Behavioral
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

entity mux_3_1 is
    Port ( d0 : in STD_LOGIC_VECTOR (2 downto 0);
           d1 : in STD_LOGIC_VECTOR (2 downto 0);
           s : in STD_LOGIC;
           dout : out STD_LOGIC_VECTOR (2 downto 0));
end mux_3_1;

architecture Behavioral of mux_3_1 is

begin

    dout <= d0 when s = '0' else d1;

end Behavioral;
